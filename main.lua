-- VersaoCristal: Pokemon Crystal em portugues brasileiro.
--
-- Nome de POKeMON, de personagem e de cidade ficam no original em ingles, de
-- proposito -- so a palavra generica de lugar traduz ("CIDADE DE VIOLET").
-- Golpe, item, tipo e classe de treinador SE traduzem desde a 0.48.0, com a
-- terminologia das cartas de TCG pt-BR; por isso existem lang/move_names.lua
-- e lang/item_names.lua. Nao ha lang/species_names.lua e nao deve haver.

return function(mod)
  -- ---- idioma de GOLPE, ITEM, NPCS e POKEDEX ------------------------------
  local idioma = {
    falas = "pt",
    menus = "pt",
    golpes = "pt",
    itens = "pt",
    npcs = "pt",
    pokedex = "pt",
  }
  local temOpcoes = pcall(function()
    mod.options:define({
      {
        key = "golpes",
        type = "choice",
        label = "NOME DOS GOLPES",
        choices = { { "PORTUGUES", "pt" }, { "ENGLISH", "en" } },
        default = "pt",
        requires_restart = true,
      },
      {
        key = "itens",
        type = "choice",
        label = "NOME DOS ITENS",
        choices = { { "PORTUGUES", "pt" }, { "ENGLISH", "en" } },
        default = "pt",
        requires_restart = true,
      },
      {
        key = "npcs",
        type = "choice",
        label = "NOME DOS NPCS",
        choices = { { "PORTUGUES", "pt" }, { "ENGLISH", "en" } },
        default = "pt",
        requires_restart = true,
      },
      {
        key = "pokedex",
        type = "choice",
        label = "POKEDEX",
        choices = { { "PORTUGUES", "pt" }, { "ENGLISH", "en" } },
        default = "pt",
        requires_restart = true,
      },
      {
        key = "falas",
        type = "choice",
        label = "FALAS",
        choices = { { "PORTUGUES", "pt" }, { "ENGLISH", "en" } },
        default = "pt",
        requires_restart = true,
      },
      {
        key = "menus",
        type = "choice",
        label = "MENUS E BATALHA",
        choices = { { "PORTUGUES", "pt" }, { "ENGLISH", "en" } },
        default = "pt",
        requires_restart = true,
      },
    })
  end)
  if temOpcoes then
    for chave in pairs(idioma) do
      local ok, valor = pcall(function() return mod.options:get(chave) end)
      if ok and valor == "en" then idioma[chave] = "en" end
    end
  end

  local function catalog(name)
    local rel = "lang/" .. name .. ".lua"
    local body = mod:read(rel)
    if not body then return {} end
    local loader = loadstring or load
    local chunk, err = loader(body, rel)
    if not chunk then
      mod.log:warn("%s tem erro de sintaxe: %s", rel, tostring(err))
      return {}
    end
    local ok, t = pcall(chunk)
    if not ok or type(t) ~= "table" then
      mod.log:warn("%s nao devolveu uma tabela", rel)
      return {}
    end
    return t
  end

  local function each(name, apply)
    local n = 0
    for k, v in pairs(catalog(name)) do
      if type(v) == "string" and v ~= "" then
        apply(k, v)
        n = n + 1
      end
    end
    return n
  end

  -- ---- glifos -------------------------------------------------------
  for id, page in pairs(catalog("font")) do
    if type(page) == "table" and type(page.image) == "string"
        and mod:read(page.image) then
      page.image = mod.assets:path(page.image)
    end
    mod.content.font:register(id, page)
  end
  for seq, code in pairs(catalog("charmap")) do
    mod.content.font:register("charmap:" .. seq, { seq = seq, code = code })
  end

  -- ---- aplicacao -----------------------------------------------------
  local n = 0
  if idioma.falas == "pt" then
    n = n + each("dialogue", function(k, v)
      mod.content.text:override(k, v)
      if k:sub(1, 6) == "TEXT_S" then
        local bank, addr = k:sub(7):match("^(%w+)_(%w+)$")
        if bank and addr then
          mod.content.text:override(bank:lower() .. ":" .. addr:lower(), v)
        end
      elseif k:find("^%x%x:%x%x%x%x$") then
        local bank, addr = k:match("^(%x%x):(%x%x%x%x)$")
        if bank and addr then
          mod.content.text:override("TEXT_S" .. bank:upper() .. "_" .. addr:upper(), v)
        end
      end
    end)
  end

  if idioma.menus == "pt" then
    n = n + each("strings", function(src, value)
      mod.content.strings:override(src, value)
    end)
  end

  if idioma.itens == "pt" then
    n = n + each("item_names", function(id, value)
      mod.content.items:patch(id, { name = value })
    end)
    each("item_descriptions", function(id, value)
      pcall(function() mod.content.items:patch(id, { description = value }) end)
    end)
  end

  if idioma.golpes == "pt" then
    each("move_names", function(id, value)
      pcall(function() mod.content.moves:patch(id, { name = value }) end)
    end)
    each("move_descriptions", function(id, value)
      pcall(function() mod.content.moves:patch(id, { description = value }) end)
    end)
  end

  n = n + each("landmarks", function(id, value)
    mod.content.landmarks:patch(id, { name = value })
  end)

  if idioma.npcs == "pt" then
    each("trainer_classes", function(id, value)
      pcall(function() mod.content.trainers:patch(id, { name = value }) end)
    end)
  end

  each("status_labels", function(id, value)
    pcall(function() mod.content.statuses:patch(id, { label = value, hudLabel = value }) end)
  end)

  each("type_names", function(id, value)
    pcall(function() mod.content.type_chart:patch(id, { name = value }) end)
  end)

  -- POKéDEX
  if idioma.pokedex == "pt" then
    local dex = catalog("pokedex")
    if mod.content.pokedex then
      for id, entrada in pairs(dex) do
        if type(entrada) == "table" then
          pcall(function() mod.content.pokedex:patch(id, entrada) end)
        end
      end
    end
    if mod.content.pokemon then
      for id, entrada in pairs(dex) do
        if type(entrada) == "table" and entrada.height and entrada.weight then
          pcall(function()
            mod.content.pokemon:patch(id, {
              dexEntry = {
                heightFt = math.floor(entrada.height / 100),
                heightIn = entrada.height % 100,
                weight = entrada.weight,
              },
            })
          end)
        end
      end
    end
  end

  mod.events:on("game.ready", function()
    mod.log:info("VersaoCristal: mod pronto e carregado")
  end)
end
