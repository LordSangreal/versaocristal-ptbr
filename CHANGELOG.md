# Changelog - Versão Cristal PT-BR

## [0.55.0] - 2026-08-28
### Corrigido
- Glifo `Í` (maiúsculo com acento agudo) aprimorado em `assets/font/latin.png` para visualização limpa e correta de `LÍDER`.
- Mensagem de desafio de treinador ajustada para quebrar linha (`"%s\nquer batalhar!"`), garantindo exibição de "quer batalhar!" sem cortes.
- Mensagem de envio de Pokémon por treinador ajustada para quebrar linha (`"%s\nenviou %s!"`), evitando overflow e corte do nome do mon.
- Mensagens de condições de status (queimadura, envenenamento, paralisia, congelamento) totalmente traduzidas.
- Mensagens de confusão (`"%s ficou confuso!"`, etc.) e dreno de energia (`"A energia de %s foi drenada!"`) traduzidas.
- Diálogos de pescadores da Rota 32 (Ralph, Henry, Justin) devidamente mapeados para ponteiros do Crystal em `dialogue.lua`.

## 0.54.0 (2026-08-28)
- Tradução das mensagens de falha ao lançar Pokébora (`Ah não! O POKéMON se libertou!`, `Nossa! Parecia que tinha sido pego!`, `Aargh! Quase que pegou!`, `Puxa! Foi tão por pouco!`).
- Tradução de fuga de batalha selvagem (`%s selvagem fugiu!`, `%s fugiu com medo!`, `%s foi arremessado!`, `%s fugiu da batalha!`).

## 0.53.0 (2026-08-28)
- Tradução da sequência de captura (`Pegou! %s foi capturado!`) e novo registro de Pokédex (`%s foi adicionado à #DEX.`).
- Tradução de mensagens de efetividade de golpes (`É superefetivo!`, `Não é muito efetivo…`) e ataques que erraram (`%s errou o ataque!`).
- Tradução do desafio inicial de treinadores (`%s quer batalhar!`), trocas e envio de Pokémon (`%s enviou %s!`, `%s recolheu %s!`, `%s usou %s!`).
- Tradução do prêmio de batalha e envio de economias para a mãe (`%s ganhou %s%d por vencer! Enviou para a MÃE!`).
- Tradução da notificação de itens encontrados e guardados nas bolsas (`{PLAYER} guardou %s no %s.`, `BOLSO DE ITENS`, `BOLSO DE CHAVES`, `BOLSO DE BOLAS`, `BOLSO DE TMs`).
- Tradução de status e efeitos residuais de batalha (`LEECH SEED`, `CURSE`, `PERISH`, `SAFEGUARD`, `ENCORE`, itens segurados e tempestade de areia).

## 0.52.0 (2026-08-27)
- Tradução do menu do Pokégear (MÃE, PROF. ELM, BICICLETARIA, chamadas e prompts).
- Tradução de mensagens de batalha (ganho de EXP, subida de nível, aprendizado de golpes e recuperação).
- Expansão do menu 2x2 de batalha (LUTAR, MOCHILA, POKéMON, FUGIR) com espaçamento limpo e sem abreviações desnecessárias.
- Ajuste das margens do menu Salvar para evitar sobreposição da caixa SIM/NÃO com TEMPO.

## 0.51.0

Este arquivo e escrito a mao e o build so o copia para dentro do pacote.

**Correção de codificação de caracteres (UTF-8 puro), mensagens de desmaio em batalha e layout de menus.**

- Restaurado catálogo `strings.lua` em UTF-8 limpo corrigindo todos os caracteres acentuados corrompidos em menus e opções.
- Corrigida a tradução de desmaio de Pokémon selvagem/inimigo (`SENTRET selvagem desmaiou!`).
- Ajustado layout da caixa de opções de batalha 2x2 e alinhamento do menu de salvamento.

## 0.50.0

**Atualização geral com Pokédex 251 completa, catálogos e sincronização com motor 0.2.133.**

- Sincronização completa com novo motor e novos diálogos.

## 0.49.0

**Pokédex completa de 251 espécies em pt-BR, opções de idioma completas, catálogos de golpes/itens/treinadores e traduções de batalha.**

- **Pokédex Completa do Crystal**: Traduzidas todas as 251 espécies com textos oficiais exclusivos da versão Crystal formatados em até 18 colunas por linha (com quebras `<NEXT>`), categorias de espécie oficiais em português (`RATO DE FOGO`, `EXPLORADOR`, `SEMENTE`, etc.) e conversões métricas de altura e peso (`AL 1,8m`, `PS 17,0kg`).
- **Catálogos Completos de Termos**: Adicionados catálogos completos de nomes de golpes em TCG pt-BR (`move_names.lua`), itens (`item_names.lua`), classes de treinadores (`trainer_classes.lua`), tipos elementais (`type_names.lua`) e rótulos de status (`status_labels.lua`).
- **Opções do Mod no Menu**: Adicionados interruptores no menu do mod para permitir que o jogador escolha individualmente entre Português e Inglês para: Nomes de Golpes, Nomes de Itens, Nomes de NPCs, Pokédex, Falas e Menus/Batalha.
- **Traduções do Sistema de Combate**: Traduzidas todas as mensagens de batalha (início de batalha de treinador, envio de Pokémon, acerto crítico, desmaio, ganho de EXP, subida de nível, falhas/desvios de golpes e vitória/derrota).
- **Tradução do Pokégear (Telefone)**: Traduzidas as perguntas de ligação, opções `LIGAR` / `CANCELAR` / `APAGAR` e nomes de contatos (`MÃE:`, `PROF. ELM:`).
- **Mensagens de Captura**: Traduzidas as perguntas de apelido e a mensagem de registro na Pokédex.

## 0.48.0

**Tradução completa de telefonemas (Mãe, Prof. Carvalho, Elm, Treinadores, Buena) e abreviação de menus.**

- Traduzidos todos os diálogos de economia, banco, compras e telefonemas da Mãe (`MomPhoneGreetingText`, `_MomLeavingText1..3`, etc.).
- Traduzidas as falas de introdução de relógio, avaliação da Pokédex pelo PC (`_OakRating01..19`) e avisos do Prof. Carvalho.
- Traduzidos os telefonemas e programas da Rádio Buena e rádio Rocket.
- Abreviadas as opções do mod (`DESC. GOLPES` e `DESC. ITENS`) para não cortar na tela do Game Boy.
- Injetados todos os ponteiros de memória e símbolos duplos para 100% de compatibilidade.

## 0.47.1

**Diálogos da introdução do PROF. ELM no Crystal.**

- Traduzidas todas as falas exclusivas do PROF. ELM na introdução do Pokémon Crystal (`1e:50fa`, `1e:511a`, `1e:513a`, `1e:51ae`, `1e:51df`, `1e:52ff`), incluindo a chegada do e-mail do MR. POKéMON e a escolha do Pokémon inicial.
- Traduzidas as falas do rooftop shopping e treinadores do Bank 1E (`1e:4532`, `1e:4743`, `1e:4765`, `1e:435e`).
- Conclusão de 100% de cobertura de todas as falas do Bank 1E.

## 0.47.0

**Compatibilidade total de ponteiros, falas da vizinha/New Bark e expansão de diálogos no motor.**

- Mapeamento e registro direto de todos os ponteiros de diálogo (`banco:endereco`) e rótulos (`TEXT_S...`), garantindo que as falas e interações sejam aplicadas com perfeição no motor gen1recomp e no Gen2Recomped.
- Traduzidas todas as falas da casa da vizinha (manhã, tarde e noite), da família do Elm e instruções da mãe em New Bark Town.
- Importadas 723 falas de campo e interações idênticas ao Gold (uso de STRENGTH, ROCK SMASH, pôsteres e decorações de quarto, falas de NPCs).
- Sincronizadas 1.095 chaves de motor em `strings.lua`.

## 0.46.10

**Pontos de referencia do Mapa e Banners.**

- Adicionado o catalogo `lang/landmarks.lua` com todos os locais de Johto e Kanto traduzidos (ex: `TORRE SPROUT`, `TORRE DE RÁDIO`, `TORRE QUEIMADA`, `TORRE TIN`, `CAVERNA UNION`, `POÇO SLOWPOKE`, `FLORESTA ILEX`, `PARQUE NACIONAL`, `RUÍNAS DE ALPH`, `MONTE MORTAR`, `CAVERNA ESCURA`, `LAGO DA FÚRIA`, `CATARATAS TOHJO`, `ESTRADA DA VITÓRIA`, `MONTE MOON`, `TÚNEL DE PEDRA`, `ILHAS REDEMOINHO`, `CAMINHO DE GELO`, `COVIL DO DRAGÃO`, `USINA DE ENERGIA`, `FAROL`, `NAVIO S.S. AQUA`, `CAVERNA DE SILVER`).

## 0.46.9

**Padronizacao da Ilha de Cinnabar.**

- A placa de boas-vindas de Cinnabar (`CinnabarIslandSignText` e `TEXT_S6B_4CC2`) agora exibe `ILHA DE CINNABAR` (estava `CINNABAR ISLAND`).

## 0.46.8

**Traduzida a mensagem final do programa POKéMON TALK.**

- `TALK! Please tune in next time!` agora aparece como `TALK! Sintonize na próxima vez!`.
- O motor passa as linhas do radio pelo catalogo, inclusive quando a frase vem do cache da ROM.
- A mesma traducao funciona com e sem quebra de linha na fonte.

## 0.46.7

**Adicionadas opcoes de idioma no menu de mods.**

- `FALAS`: alterna as falas do jogo entre portugues e ingles.
- `MENUS E BATALHA`: alterna os textos escritos pelo motor.
- `DESCRICOES DE GOLPES` e `DESCRICOES DE ITENS`: alternam apenas as descricoes.
- Todas as escolhas valem no proximo boot; o padrao continua sendo portugues.

## 0.46.6

**Sincronizado o catalogo do motor com a traducao Gold.**

- As **1.085 chaves inglesas compartilhadas** agora usam exatamente as mesmas traducoes corrigidas do Gold.
- Adicionadas **441 chaves** que ja estavam traduzidas no Gold e faltavam no Crystal.
- Mantidas as 5 chaves exclusivas do Crystal, como a selecao de genero e os rotulos do relogio.

## 0.46.5

**Traduzido o relogio da configuracao inicial.**

- `MORN`, `DAY` e `NITE` agora aparecem como `MANHA`, `DIA` e `NOITE`.
- `o'clock` agora aparece como `horas`, seguindo o formato brasileiro.
- A caixa da selecao `MENINO`/`MENINA` permanece ampliada no motor `0.2.111`.

## 0.46.4

**Traduzida a selecao de genero na abertura do Crystal.**

- Adicionada a fala `_AreYouABoyOrAreYouAGirlText`: "Você é menino? / Ou é menina?"
- A tela usa as entradas `BOY` e `GIRL` do catalogo para mostrar `MENINO` e `MENINA`.
- Requer o motor com a correcao da tela de genero, incluida no payload `0.2.109`.

## 0.46.3

**As falas agora sao as do Crystal, nao as do Gold.**

O catalogo nasceu de um crosswalk feito em cima do **Gold**, e onde o mesmo
rotulo existe nos dois jogos com texto em ingles diferente, o que estava
gravado era a fala do Gold traduzida -- o jogador de Crystal lia uma fala
que o NPC nao diz. Os alias das versoes 0.46.1/0.46.2 herdaram esse erro e
o espalharam para mais slots.

- **152 falas reescritas a partir do ingles do Crystal**, propagadas para
  **398 slots** (rotulo nomeado + todos os alias que compartilham o mesmo
  texto).
- Casos como o pai do BILL ("Meu pai nao trabalha, so enrola o dia todo" --
  antes dizia "Eu fazia testes com um TELEPORTER"), a CLAIR entregando a
  badge, a mae do BILL, o DAY-CARE MAN, o santuario da ILEX FOREST, a fala
  de abertura do PROF.ELM, o MORTY e o LT.SURGE.
- Sobram 23 slots marcados, todos placeholder generico do motor ("You read
  the sign"), grito de especie ou lixo de extracao -- nao ha fala real
  restante com o texto do Gold.

Como foi detectado: se a traducao gravada num rotulo era identica a
traducao usada para o texto do **Gold** daquele mesmo rotulo, entao ela era
derivada do Gold. Isso da uma lista exata em vez de um palpite.

## 0.46.2

**Corrigido de verdade: NPCs e placas em ingles no aparelho, mesmo com a
0.46.1 instalada.**

Quando o extrator do Gen2Recomped nao resolve um rotulo nomeado para um
ponteiro, ele grava a fala sob a forma mecanica
`TEXT_S<BANCO>_<ENDERECO>` -- e `Data:resolveText` busca por essa chave.
O catalogo do Crystal foi montado a partir dos rotulos nomeados e tinha
**2 dessas 3237 chaves**. Onde a extracao usa a forma mecanica, a fala
caia no ingles mesmo estando traduzida.

Isso depende de como cada instalacao extraiu a ROM, e e por isso que o
desktop mostrava tudo certo e o Android nao: la varias entradas resolviam
pelo rotulo nomeado, aqui pela forma mecanica.

- **+2402 alias `TEXT_S<banco>_<endereco>`**, casados pelo texto em ingles
  com a traducao que ja existia (5206 -> 7608 chaves). Sao gerados do cache
  **deste** jogo: o endereco muda entre Gold e Crystal, entao a chave de um
  nao serve no outro.
- As duas falas das telas relatadas -- a placa "CIDADE DE NEW BARK / A
  cidade onde os ventos do recomeco sopram" e o vizinho "Soube que o PROF.
  ELM descobriu novos POKéMON" -- agora resolvem pelas tres formas de chave
  (rotulo nomeado, constante do mapa e `TEXT_S*`).

O Gold ja tinha 2267 dessas chaves, herdadas do crosswalk da 0.44.0 (que
foi feito em cima dos enderecos do Gold) -- por isso ele nao sofria o mesmo
problema. Faltavam 10, tambem incluidas.

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
