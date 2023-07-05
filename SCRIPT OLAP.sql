-- -----------------------------------------------------
-- Table `mydb`.`Carro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Carro` (
  `idCarro` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL,
  `modelo` VARCHAR(45) NULL,
  `ano` YEAR NULL,
  `marca` VARCHAR(45) NULL,
  PRIMARY KEY (`idCarro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Passageiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Passageiro` (
  `idPassageiro` INT NOT NULL AUTO_INCREMENT,
  `avaliacao` INT(1) NULL,
  PRIMARY KEY (`idPassageiro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Motorista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Motorista` (
  `idMotorista` INT NOT NULL AUTO_INCREMENT,
  `avalicao` INT(1) NULL,
  PRIMARY KEY (`idMotorista`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Duracao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Duracao` (
  `idDuracao` INT NOT NULL,
  `tempo` TIME NULL,
  PRIMARY KEY (`idDuracao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pais` (
  `idPais` INT NOT NULL AUTO_INCREMENT,
  `pais` VARCHAR(45) NULL,
  PRIMARY KEY (`idPais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estado` (
  `idEstado` INT NOT NULL AUTO_INCREMENT,
  `uf` VARCHAR(2) NULL,
  `Pais_idPais` INT NOT NULL,
  PRIMARY KEY (`idEstado`),
  CONSTRAINT `fk_Estado_Pais1`
    FOREIGN KEY (`Pais_idPais`)
    REFERENCES `mydb`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cidade` (
  `idCidade` INT NOT NULL AUTO_INCREMENT,
  `cidade` VARCHAR(45) NULL,
  `Estado_idEstado` INT NOT NULL,
  PRIMARY KEY (`idCidade`),
  CONSTRAINT `fk_Cidade_Estado1`
    FOREIGN KEY (`Estado_idEstado`)
    REFERENCES `mydb`.`Estado` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fato` (
  `idFato` INT NOT NULL AUTO_INCREMENT,
  `qtd_viagem` INT NULL,
  `Carro_idCarro` INT NOT NULL,
  `Passageiro_idPassageiro` INT NOT NULL,
  `Motorista_idMotorista` INT NOT NULL,
  `Duracao_idDuracao` INT NOT NULL,
  `Cidade_idCidade` INT NOT NULL,
  PRIMARY KEY (`idFato`),
  CONSTRAINT `fk_Fato_Carro1`
    FOREIGN KEY (`Carro_idCarro`)
    REFERENCES `mydb`.`Carro` (`idCarro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fato_Passageiro1`
    FOREIGN KEY (`Passageiro_idPassageiro`)
    REFERENCES `mydb`.`Passageiro` (`idPassageiro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fato_Motorista1`
    FOREIGN KEY (`Motorista_idMotorista`)
    REFERENCES `mydb`.`Motorista` (`idMotorista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fato_Duracao1`
    FOREIGN KEY (`Duracao_idDuracao`)
    REFERENCES `mydb`.`Duracao` (`idDuracao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fato_Cidade1`
    FOREIGN KEY (`Cidade_idCidade`)
    REFERENCES `mydb`.`Cidade` (`idCidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;