-- -----------------------------------------------------
-- Dim(Carro)
-- -----------------------------------------------------
SELECT carro.tipo, carro.modelo, carro.ano, carro.marca
FROM carro;

-- -----------------------------------------------------
-- Dim(Motorista)
-- -----------------------------------------------------
SELECT motorista.avaliacao
FROM motorista;

-- -----------------------------------------------------
-- Dim(Passageiro)
-- -----------------------------------------------------
SELECT passageiro.avaliacao
FROM passageiro;

-- -----------------------------------------------------
-- Dim(Cidade)
-- -----------------------------------------------------
SELECT local.cidade
FROM local;

-- -----------------------------------------------------
-- Dim(Estado)
-- -----------------------------------------------------
SELECT local.estado
FROM local;

-- -----------------------------------------------------
-- Dim(Pais)
-- -----------------------------------------------------
SELECT local.pais
FROM local;

-- -----------------------------------------------------
-- Dim(Duracao)
-- -----------------------------------------------------
SELECT viagem.fim - (select viagem.inicio from viagem)
FROM viagem;

-- -----------------------------------------------------
-- Fato
-- -----------------------------------------------------
Select count(*)
From viagem, motorista, passageiro, carro, local
group by motorista.avalicao, passageiro.avaliacao, carro.tipo, carro.modelo, carro.ano, carro.marca, local.cidade, (viagem.fim - viagem.inicio)