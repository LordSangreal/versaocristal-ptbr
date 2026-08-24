-- VersaoCristal: Pokemon Crystal em portugues brasileiro.
--
-- Nomes de golpes e de Pokemon ficam no original em ingles, de proposito:
-- nao ha lang/move_names.lua nem lang/species_names.lua neste mod.

return function(mod)
  local idioma = {
    falas = "pt",
    menus = "pt",
    golpes = "pt",
    itens = "pt",
  }
  local temOpcoes = pcall(function()
    mod.options:define({
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
      {
        key = "golpes",
        type = "choice",
        label = "DESCRICOES DE GOLPES",
        choices = { { "PORTUGUES", "pt" }, { "ENGLISH", "en" } },
        default = "pt",
        requires_restart = true,
      },
      {
        key = "itens",
        type = "choice",
        label = "DESCRICOES DE ITENS",
        choices = { { "PORTUGUES", "pt" }, { "ENGLISH", "en" } },
        default = "pt",
        requires_restart = true,
      },
    })
  end)
  if temOpcoes then
    for key in pairs(idioma) do
      local ok, value = pcall(function() return mod.options:get(key) end)
      if ok and value == "en" then idioma[key] = "en" end
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
  -- Registrar ANTES de qualquer coisa pedir um glifo.  O caminho da imagem
  -- vai direto para love.graphics.newImage, que resolve contra a raiz do
  -- jogo e nao contra o mod -- sem `mod.assets:path` a pagina carrega vazia
  -- e todo acentuado desenha em branco.
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
  -- Chave = rotulo nomeado da desmontagem, ou TEXT_S<banco>_<endereco>
  -- quando o extrator nao resolve rotulo.  E o formato do Gen2Recomped;
  -- este mod nao roda no gen1recomp (que nao suporta Crystal e indexa por
  -- ponteiro "banco:endereco").
  local n = 0
  if idioma.falas == "pt" then
    n = n + each("dialogue", function(k, v)
      mod.content.text:override(k, v)
    end)
  end
  if idioma.menus == "pt" then
    n = n + each("strings", function(src, value)
      mod.content.strings:override(src, value)
    end)
  end
  n = n + each("item_names", function(id, value)
    mod.content.items:patch(id, { name = value })
  end)
  n = n + each("landmarks", function(id, value)
    mod.content.landmarks:patch(id, { name = value })
  end)
  -- O status tem dois rotulos: o do texto e o de tres letras que cabe na
  -- caixinha ao lado da barra de vida.  Trocar so o primeiro deixaria o HUD
  -- em ingles, que e justamente onde o rotulo mais aparece.
  n = n + each("status_labels", function(id, value)
    mod.content.statuses:patch(id, { label = value, hudLabel = value })
  end)
  -- Descricao de item.  `description` nao esta declarado no schema, mas o
  -- registro de topo e extensivel e quem desenha le `def.description`.
  -- O pcall isola: se a rota nao existir, o mod segue funcionando e o aviso
  -- aparece no log em vez de derrubar tudo.
  local descOk, descErro = 0, nil
  if idioma.itens == "pt" then
    each("item_descriptions", function(id, value)
      local ok, err = pcall(function()
        mod.content.items:patch(id, { description = value })
      end)
      if ok then descOk = descOk + 1 elseif not descErro then descErro = err end
    end)
  end
  n = n + descOk
  if descErro then
    mod.log:warn("descricao de item nao aplicada: %s", tostring(descErro))
  end
  -- Descricao de golpe.  Aparece na tela de resumo do POKéMON e na bolsa
  -- quando o item e uma TM ou HM -- ali o jogo mostra a descricao do GOLPE.
  local mvOk, mvErro = 0, nil
  if idioma.golpes == "pt" then
    each("move_descriptions", function(id, value)
      local ok, err = pcall(function()
        mod.content.moves:patch(id, { description = value })
      end)
      if ok then mvOk = mvOk + 1 elseif not mvErro then mvErro = err end
    end)
  end
  n = n + mvOk
  if mvErro then
    mod.log:warn("descricao de golpe nao aplicada: %s", tostring(mvErro))
  end

  mod.events:on("game.ready", function()
    mod.log:info("VersaoCristal: %d textos aplicados", n)
  end)
end
