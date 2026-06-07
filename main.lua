local VAZIO = " "

local VITORIAS = {
  { 1, 2, 3 }, { 4, 5, 6 }, { 7, 8, 9 },
  { 1, 4, 7 }, { 2, 5, 8 }, { 3, 6, 9 },
  { 1, 5, 9 }, { 3, 5, 7 },
}

local function novo_tabuleiro()
  return { VAZIO, VAZIO, VAZIO, VAZIO, VAZIO, VAZIO, VAZIO, VAZIO, VAZIO }
end

local function proximo_jogador(jogador)
  return jogador == "X" and "O" or "X"
end

local function fazer_jogada(tabuleiro, posicao, jogador)
  local novo = {}

  for i = 1, 9 do
    novo[i] = i == posicao and jogador or tabuleiro[i]
  end

  return novo
end

local function vencedor(tabuleiro)
  for _, linha in ipairs(VITORIAS) do
    local a, b, c = linha[1], linha[2], linha[3]

    if tabuleiro[a] ~= VAZIO and tabuleiro[a] == tabuleiro[b] and tabuleiro[b] == tabuleiro[c] then
      return tabuleiro[a]
    end
  end
end

local function cheio(tabuleiro)
  for i = 1, 9 do
    if tabuleiro[i] == VAZIO then
      return false
    end
  end

  return true
end

local function mostrar(tabuleiro)
  local casa = {}

  for i = 1, 9 do
    casa[i] = tabuleiro[i] ~= VAZIO and tabuleiro[i] or tostring(i)
  end

  print("\n " .. casa[1] .. " | " .. casa[2] .. " | " .. casa[3])
  print("---+---+---")
  print(" " .. casa[4] .. " | " .. casa[5] .. " | " .. casa[6])
  print("---+---+---")
  print(" " .. casa[7] .. " | " .. casa[8] .. " | " .. casa[9] .. "\n")
end

local function ler_posicao(tabuleiro, jogador)
  while true do
    io.write("Jogador " .. jogador .. ", escolha uma posicao (1-9): ")

    local entrada = io.read()
    if not entrada then
      return nil
    end

    local posicao = tonumber(entrada)

    if posicao and posicao >= 1 and posicao <= 9 and tabuleiro[posicao] == VAZIO then
      return posicao
    end

    print("Jogada invalida. Tente novamente.")
  end
end

local function estado_jogo(tabuleiro)
  local ganhador = vencedor(tabuleiro)

  if ganhador then
    return "VITORIA", ganhador
  end

  if cheio(tabuleiro) then
    return "EMPATE"
  end

  return "EM_ANDAMENTO"
end

local function aplicar_turno(tabuleiro, posicao, jogador)
  local tabuleiro_atualizado = fazer_jogada(tabuleiro, posicao, jogador)
  return tabuleiro_atualizado, proximo_jogador(jogador)
end

local function jogar(tabuleiro, jogador)
  mostrar(tabuleiro)

  local estado, vencedor_jogo = estado_jogo(tabuleiro)

  if estado == "VITORIA" then
    print("Jogador " .. vencedor_jogo .. " venceu!")
    return
  end

  if estado == "EMPATE" then
    print("Empate!")
    return
  end

  local posicao = ler_posicao(tabuleiro, jogador)

  if not posicao then
    print("\nJogo encerrado.")
    return
  end

  local tabuleiro_atualizado, proximo = aplicar_turno(tabuleiro, posicao, jogador)

  return jogar(tabuleiro_atualizado, proximo)
end

print("=== Jogo da Velha Funcional em Lua ===")
jogar(novo_tabuleiro(), "X")
