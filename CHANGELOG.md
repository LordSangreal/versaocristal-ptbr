# Changelog

Este arquivo e escrito a mao e o build so o copia para dentro do pacote.

## 0.46.1

**Corrigido: NPCs e placas apareciam em ingles mesmo com a fala traduzida.**

O motor resolve a fala de um objeto/placa em `Data:resolveText`
(`src/core/Data.lua`): pega `text_pointers[MAPA][TEXT_*]` e busca
`data.text[entry.text]`. Acontece que `entry.text` muitas vezes **e a
propria constante do mapa** (`TEXT_PLAYERS_HOUSE1_F_OBJ_005`), nao o rotulo
nomeado (`PlayersHouse1FStoveText`). O catalogo so tinha os rotulos
nomeados, entao essas falas caiam no ingles -- mesmo as que ja estavam
traduzidas ha varias versoes.

A auditoria de cobertura anterior nao pegava isso porque media so o campo
`label` das entradas, e nao a chave que o motor realmente busca. Refeita
com a logica do `resolveText`, a cobertura real era **92,1%**, nao os 99,4%
que o README anunciava.

- **+204 chaves**: 190 alias (a mesma traducao sob a constante do mapa,
  casada pelo texto em ingles; prefixo de codigo de controle preservado --
  os pontinhos de pausa e tokens como `{PC}`/`&{USER}` fazem parte da fala)
  e 14 falas que faltavam de verdade, traduzidas agora. Entre elas a
  vizinha no inicio do jogo ("Bom dia, {PLAYER}! Estou de visita!"), a
  FLORIA da FLOWER SHOP, o marinheiro do OLIVINE CAFE que ensina STRENGTH,
  a neta do KURT e a placa de regras da BATTLE TOWER.
- **Cobertura real: 92,1% -> 99,1%.** As 27 que sobram sao grito de especie
  e entradas sem texto nenhum no cache do motor (script asm), que nao tem o
  que traduzir.

## 0.46.0

**Primeira versao como repositorio proprio.** O Crystal era traduzido dentro
da [`versaodourada`](https://github.com/LordSangreal/versaodourada) ate a
0.45.1, dividindo um catalogo unico com o Gold. Esta versao separa os dois.

- **`lang/dialogue.lua` com 5002 falas**, filtrado do catalogo compartilhado
  para conter so os rotulos que a extracao do Crystal usa de fato. O
  catalogo antigo tinha 7614 chaves, das quais 2610 so existiam no Gold --
  peso morto aqui.
- **Corrigido: as falas nao apareciam traduzidas no Crystal.** Um erro de
  sintaxe no catalogo (uma string sem fechar, herdada de um script de lote
  da 0.45.0) fazia o `loadstring` do `main.lua` falhar. Como o `main.lua`
  devolve tabela vazia quando o catalogo nao compila, os 7614 dialogos
  sumiam de uma vez -- sobravam so os menus (`strings.lua`, que compilava
  normal) e a fala de abertura do OAK (que vem de outro arquivo). Era
  exatamente o sintoma relatado: mae e NPCs iniciais em ingles, menus e
  Prof. OAK em portugues.
- Adicionado um validador estrito de sintaxe ao fluxo de trabalho, que le o
  arquivo inteiro token a token em vez de so procurar aspas sem fechar --
  esse erro nao passa de novo silenciosamente.
- `games` no `manifest.json` e so `crystal`; o mod id e `versaocristal`,
  diferente do `versaodourada`, para os dois poderem conviver instalados.

### Pendencia: 555 falas com o texto do Gold

O catalogo herdado foi construido por crosswalk em cima do **Gold**. Existem
582 rotulos que os dois jogos usam com texto em ingles **diferente** -- o
Crystal reescreveu falas inteiras reaproveitando o mesmo nome de rotulo. Em
555 delas este mod ainda mostra a versao do Gold traduzida.

Das 582 divergencias, 27 ja estao corretas (foram escritas a mao a partir do
texto do Crystal durante a passada "na ordem do jogo" da 0.45.0); as outras
555 estao na fila de reescrita.

Exemplos:

| Rotulo | Crystal | Mostrado hoje |
|---|---|---|
| `BillPopWontWorkText` | "Meu pai nao trabalha, so enrola o dia todo" | "Eu fazia testes com um TELEPORTER" |
| `BlackthornGymClairText_YouKeptMeWaiting` | "Voce me deixou esperando! Toma!" | "Voce se provou para mim..." |
| `BlackthornYoungsterText` | "Mestres de dragao vem de BLACKTHORN" | "Vou me tornar um usuario de dragao CLAIR" |

---

## Historico anterior (dentro da `versaodourada`)

O trabalho de traducao do Crystal ate aqui esta no CHANGELOG da
`versaodourada`, principalmente na **0.45.0**, que fez a passada completa na
ordem do jogo: New Bark Town ate o Hall of Fame, mais Ruins of Alph, Day
Care, Battle Tower, a sequencia da BUENA/PASSWORD na Radio Tower, a provacao
da CLAIR na Dragon Shrine, o arco da lenda do HO-OH/SUICUNE/ENTEI/RAIKOU, e
as 170 falas de treinador (antes/depois da batalha).
