# Jogo da Velha Funcional em Lua

Implementacao do jogo da velha em Lua usando uma abordagem funcional.

## Como executar

```bash
lua main.lua
```

## Como jogar

O tabuleiro mostra numeros de `1` a `9` nas casas vazias. Em cada turno, o jogador atual escolhe uma dessas posicoes.

Exemplo:

```text
 1 | 2 | 3
---+---+---
 4 | 5 | 6
---+---+---
 7 | 8 | 9
```

## Pontos importantes para apresentar

- O tabuleiro e representado por uma lista com 9 posicoes.
- A funcao `fazer_jogada` nao altera o tabuleiro original; ela retorna um novo tabuleiro.
- Funcoes como `vencedor`, `cheio` e `estado_jogo` sao puras: recebem dados e retornam resultados.
- A funcao `aplicar_turno` devolve o tabuleiro atualizado e o proximo jogador.
- O fluxo do jogo usa recursao em `jogar`, chamando a proxima rodada com o novo tabuleiro e o proximo jogador.
- Entrada e saida ficam concentradas em `ler_posicao`, `mostrar` e `jogar`.
