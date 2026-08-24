# Versao Cristal

**Pokemon Crystal em portugues brasileiro**, rodando no [gen1recomp](https://github.com/bryanthaboi/gen1recomp) e no [Gen2Recomped](https://github.com/UNDERdecoded/Gen2Recomped). Os dois sao recriacoes nativas dos jogos em Lua/LOVE2D, nao emuladores.

**Todos os testes de textos, menus, dialogos, placas e jogabilidade estao sendo realizados e validados ativamente de forma continua diretamente no `gen1recomp` (PC e Android).**

Nao acompanha nenhum byte de ROM. Voce precisa da sua propria copia de Pokemon Crystal para o aplicativo importar.

**Todo o texto e traducao propria, escrita a partir do ingles original.**

> **Joga Pokemon Gold?** A traducao do Gold vive noutro repositorio:
> **[LordSangreal/versaodourada](https://github.com/LordSangreal/versaodourada)**.
> Ela roda no `gen1recomp` oficial **e** no Gen2Recomped. Veja
> [Por que dois repositorios](#por-que-dois-repositorios) abaixo.

---

## Estado

| O que | Quanto |
|---|---|
| Falas e dialogos no catalogo | 11.519 |
| Rotulos de menu e batalha | 1095 |
| Pontos de referencia no mapa (`landmarks.lua`) | 94 |
| Descricoes de golpe | 251 |
| Descricoes de item | 161 |
| Glifos acentuados desenhados | 25 |

O menu de detalhes do mod oferece escolhas independentes para deixar falas, menus/batalha e descricoes de golpes/itens em ingles. As escolhas valem no proximo boot e portugues e o padrao.

---

## Por que dois repositorios

Ate a `versaodourada` 0.45.1, Gold e Crystal dividiam um catalogo so. Fazia sentido no comeco: os dois jogos rodam no mesmo motor, e o Gen2Recomped indexa dialogo por **rotulo nomeado** (`MomGivesPokegearText`), nao por endereco de ROM -- entao a mesma chave servia os dois.

O problema aparece no detalhe. **Centenas de rotulos existem nos dois jogos com texto em ingles diferente** -- o Crystal reescreveu falas inteiras, e o extrator reaproveita o mesmo nome de rotulo. Com um catalogo unico, quem jogasse Crystal via a fala do Gold traduzida, e vice-versa.

Dai a separacao:

| | `versaodourada` | `versaocristal-ptbr` (aqui) |
|---|---|---|
| Jogo | Gold / Silver | Crystal |
| Motores | `gen1recomp` e Gen2Recomped | `gen1recomp` e Gen2Recomped |
| Catalogos | `dialogue.lua` (ponteiro de ROM, pro `gen1recomp`) + `dialogue_gen2recomped.lua` (rotulo nomeado) | `dialogue.lua` (ponteiros de ROM e rotulos nomeados com registro duplo) |

Os catalogos que **nao** dependem de como cada jogo numera as falas -- `strings.lua` (menus e batalha, 1.095 chaves sincronizadas), `landmarks.lua` (94 pontos de mapa) e as descricoes de golpe/item -- sao mantidos em sincronia em ambos os repositorios.

---

## O que fica no original -- e por que

Isto e **decisao de traducao**, nao falta dela.

**Nomes de POKéMON, de golpe e de personagem.** BULBASAUR, THUNDERBOLT,
LANCE. Sao os nomes oficiais no mundo inteiro, inclusive nos jogos em
portugues -- traduzi-los quebraria a comunicacao com qualquer guia, video
ou amigo.

**Nomes de item.** POKé BALL, POTION, BERRY, REPEL. Item entra na mesma
categoria: e vocabulario compartilhado da franquia, nao prosa. **A
descricao do item esta em portugues** -- e o padrao que a franquia usa: o
nome identifica, a descricao explica.

**TM e HM.** A sigla acompanha o nome do golpe, que fica em ingles.
Traduzir so ela produziria "MT29 contem o PSYCHIC" -- duas linguas no mesmo
folego.

**Rotulos de status na caixa de vida (PSN, BRN, PAR, SLP, FRZ).** Alem de
serem sigla padrao da franquia, estao fixos no codigo do motor
(`src/battle/Status.lua`, campos `label`/`hudLabel`), sem gancho de
traducao -- nao daria para mudar mesmo querendo.

### O que traduz

**CITY, TOWN e ROUTE traduzem a palavra generica, mantendo o nome
proprio:** "VIOLET CITY" -> "CIDADE DE VIOLET"; "ROUTE 30" -> "ROTA 30". O
jogador ainda reconhece "VIOLET" num guia, e "cidade"/"rota" leem em
portugues. Pontos de interesse que nao sao cidade nem rota -- SPROUT TOWER,
UNION CAVE, RUINS OF ALPH -- ficam inteiros em ingles.

**Rotulos de atributo na tela de status:** ATAQUE, DEFESA, ESP.ATQ,
ESP.DEF, VELOC. Nomenclatura sugerida por **Hyd**. HP vira **PS** (sigla
oficial pt-BR); PP fica, porque nao tem sigla consagrada em portugues.

**A interface do aplicativo** (launcher, importacao de ROM, gerenciador de
mods) fica em ingles de proposito: os botoes tem largura fixa e o
portugues, mais longo, sai cortado.

---

## Terminologia

Segue a localizacao oficial em portugues do Brasil, que chegou aos jogos
com Scarlet/Violet:

**Ginasio** (nao "academia") · **Lider de Ginasio** · **Treinador** ·
**Insignia** (nao "medalha") · **Centro POKéMON** · **Bolsa** (nao
"mochila") · **PS** para HP · **Cidade de**/**Rota** para CITY/TOWN e ROUTE

---

## Instalacao

Precisa do [Gen2Recomped](https://github.com/UNDERdecoded/Gen2Recomped) com
Crystal importado.

Baixe o zip do release e importe pelo botao *Import mod .zip* no painel de
MODS -- mesmo fluxo no desktop e no Android.

Confira no gerenciador de mods que ele aparece habilitado. Se aparecer
`ENABLED (NOT THIS GAME)`, o boot nao e de Crystal.

> **Ja usava a `versaodourada` para jogar Crystal?** Desabilite ou remova
> ela ao instalar esta. As duas registram as mesmas chaves de rotulo, e a
> que tiver prioridade maior ganha -- com as duas ativas voce pode acabar
> vendo a fala do Gold no Crystal, que e justamente o que a separacao
> resolve.

---

## Creditos

Todo o texto e traducao propria, escrita a partir do ingles original.

**Hyd** sugeriu a nomenclatura dos rotulos de atributo (ATAQUE, DEFESA,
ESP.ATQ, ESP.DEF, VELOC.).

Gen2Recomped e o fork de **UNDERdecodedHD**, que trouxe o suporte a Gen 2
-- e ao Crystal -- que torna este mod possivel. `gen1recomp` e de
**bryanthaboi** e dos contribuidores do projeto.

Uma nota de historia: as primeiras versoes da `versaodourada` (da qual este
mod nasceu) partiram da traducao de **R_Lopes** e **Night_Shadown**,
publicada nos anos 2000 como patch de ROM. Cada fala foi reescrita do
ingles entre a 0.34.0 e a 0.41.0, e nao ha mais nenhuma linha derivada
daquele trabalho -- o credito fica como agradecimento.

---

## Arquivos do pacote

```
main.lua                    registra os overrides quando o jogo abre
manifest.json               quem o mod e e para qual jogo

lang/dialogue.lua           7608 falas; chave = rotulo nomeado
                             (MomGivesPokegearText) ou TEXT_S<banco>_<endereco>
lang/strings.lua            645 textos do motor: batalha, menus, opcoes,
                             avisos de entrada em rota/cidade, atributos
lang/move_descriptions.lua  251 descricoes de golpe; chave = id do golpe
lang/item_descriptions.lua  161 descricoes de item; chave = id do item
lang/font.lua                   a pagina de glifos que o mod acrescenta
lang/charmap.lua             25 que sequencia de bytes desenha qual glifo
lang/item_names.lua             vazio: nome de item fica em ingles
lang/status_labels.lua          vazio: PSN/BRN/PAR/SLP/FRZ ficam

assets/font/latin.png         os glifos acentuados, desenhados do zero;
                               128x64 -- a altura extra e so espaco vazio,
                               exigencia minima do Gen2Recomped
```

Um catalogo vazio nao e um catalogo faltando: e a decisao registrada de
deixar aquilo no original.
