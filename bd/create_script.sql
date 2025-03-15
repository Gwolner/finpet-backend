-- Remoção de configurações específicas do MySQL
-- Não são necessárias no PostgreSQL

-- Criando o schema
DROP SCHEMA IF EXISTS sch_invest CASCADE;
CREATE SCHEMA sch_invest;

-- Usar o schema sch_invest
SET search_path TO sch_invest;

-- Tabela patrimonio
DROP TABLE IF EXISTS patrimonio;
CREATE TABLE patrimonio (
    id SERIAL PRIMARY KEY,
    especializacao VARCHAR(45),
    grupo VARCHAR(45),
    proposito VARCHAR(100)
);

-- Tabela instituicao
DROP TABLE IF EXISTS instituicao;
CREATE TABLE instituicao (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(45),
    cnpj VARCHAR(45),
    tipo VARCHAR(45),
    descricao VARCHAR(45),
    img_logo VARCHAR(45)
);

-- Tabela investimento
DROP TABLE IF EXISTS investimento;
CREATE TABLE investimento (
    id_patrimonio INT PRIMARY KEY,
    nome_ativo VARCHAR(45),
    quantidade_comprada NUMERIC(4,2),
    valor_aporte NUMERIC(7,2),
    rentabilidade_contratada VARCHAR(45),
    data_aporte DATE,
    natureza VARCHAR(45),
    liquidez VARCHAR(45),
    indexador VARCHAR(45),
    valor_liquido NUMERIC(7,2),
    data_vencimento DATE,
    fgc_investimento BOOLEAN,
    id_instituicao INT,
    CONSTRAINT fk_investimento_patrimonio FOREIGN KEY (id_patrimonio) REFERENCES patrimonio (id),
    CONSTRAINT fk_investimento_instituicao FOREIGN KEY (id_instituicao) REFERENCES instituicao (id)
);

-- Tabela vencimento_detalhe
DROP TABLE IF EXISTS vencimento_detalhe;
CREATE TABLE vencimento_detalhe (
    id SERIAL PRIMARY KEY,
    valo_recebido NUMERIC(7,2),
    percentual_ganho NUMERIC(5,2),
    id_investimento INT,
    CONSTRAINT fk_vencimento_investimento FOREIGN KEY (id_investimento) REFERENCES investimento (id_patrimonio)
);

-- Tabela meta
DROP TABLE IF EXISTS meta;
CREATE TABLE meta (
    id SERIAL PRIMARY KEY,
    tipo_referencia VARCHAR(45),
    valor_alvo NUMERIC(7,2),
    data_estimada DATE,
    descricao_detalhada VARCHAR(200),
    status_meta VARCHAR(45),
    id_patrimonio INT,
    CONSTRAINT fk_meta_patrimonio FOREIGN KEY (id_patrimonio) REFERENCES patrimonio (id)
);

-- Tabela lista
DROP TABLE IF EXISTS lista;
CREATE TABLE lista (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(45),
    descricao VARCHAR(100)
);

-- Tabela item
DROP TABLE IF EXISTS item;
CREATE TABLE item (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(45),
    descricao VARCHAR(100),
    lista_id INT,
    CONSTRAINT fk_item_lista FOREIGN KEY (lista_id) REFERENCES lista (id)
);

-- Tabela especie
DROP TABLE IF EXISTS especie;
CREATE TABLE especie (
    id_patrimonio INT PRIMARY KEY,
    tipo VARCHAR(45),
    descricao VARCHAR(45),
    valor NUMERIC(7,2),
    CONSTRAINT fk_especie_patrimonio FOREIGN KEY (id_patrimonio) REFERENCES patrimonio (id)
);

-- Tabela armazenamento
DROP TABLE IF EXISTS armazenamento;
CREATE TABLE armazenamento (
    id SERIAL PRIMARY KEY,
    local_interno VARCHAR(100),
    local_externo VARCHAR(100),
    id_especie INT,
    CONSTRAINT fk_armazenamento_especie FOREIGN KEY (id_especie) REFERENCES especie (id_patrimonio)
);

-- Tabela conta
DROP TABLE IF EXISTS conta;
CREATE TABLE conta (
    id_patrimonio INT PRIMARY KEY,
    numero_agencia VARCHAR(45),
    numero_conta VARCHAR(45),
    tipo VARCHAR(45),
    saldo NUMERIC(7,2),
    fgc_conta BOOLEAN,
    conta_ativa BOOLEAN,
    id_instituicao INT,
    CONSTRAINT fk_conta_patrimonio FOREIGN KEY (id_patrimonio) REFERENCES patrimonio (id),
    CONSTRAINT fk_conta_instituicao FOREIGN KEY (id_instituicao) REFERENCES instituicao (id)
);

-- Tabela cartao
DROP TABLE IF EXISTS cartao;
CREATE TABLE cartao (
    id_fisico SERIAL PRIMARY KEY,
    modalidade VARCHAR(45),
    saldo_debito NUMERIC(7,2),
    limite_credito NUMERIC(7,2),
    img_bandeira VARCHAR(45)
);

-- Tabela objetivo
DROP TABLE IF EXISTS objetivo;
CREATE TABLE objetivo (
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(45),
    id_patrimonio INT,
    CONSTRAINT fk_objetivo_patrimonio FOREIGN KEY (id_patrimonio) REFERENCES patrimonio (id)
);
