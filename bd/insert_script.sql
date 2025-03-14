-- -----------------------------------------------------
-- Table `instituicao`
-- -----------------------------------------------------
INSERT INTO `sch_invest`.`instituicao` 
(`id`, `nome`, `cnpj`, `tipo`, `descricao`, `img_logo`) 
VALUES 
(1, "Caixa Econômica Federal", "00.360.305/0001-04", "Poupança", "Conta poupança para emergência.", "...\img\logo_caixa.jpeg"),
(2, "Nu Pagamentos S.A.", "18.236.120/0001-58", "Poupança",  "Depósitos na conta de pagamentos.", "...\img\logo_nu_p.jpeg"),
(3, "Nu Financeira S.A", "30.680.829/0001-43", "Poupança",  "Depósitos no RDB do Nubank.", "...\img\logo_nu_f.jpeg"),
(4, "Itaú Unibanco", "60.701.190/0001-04", "Poupança",  "Conta corrente para recebebimento de salário.", "...\img\logo_itau.jpeg"),
(5, "BTG Pactual", "30.306.294/0001-45", "Poupança",  "Investimento em renda fixa e em FIIs", "...\img\logo_btg.jpeg");


SELECT * FROM sch_invest.instituicao



-- -----------------------------------------------------
-- Table `grupo`
-- -----------------------------------------------------
INSERT INTO `sch_invest`.`grupo` 
(`id`, `nome`, `descricao`) 
VALUES 
(1, "Salário", "Receber salário"),
(2, "Pessoal", "Gastos pessoais"),
(3, "Investir", "Aportar em investimentos"),
(4, "Emergência", "Gastos de emergência");


SELECT * FROM sch_invest.grupo



-- -----------------------------------------------------
-- Table `conta`
-- -----------------------------------------------------
INSERT INTO `sch_invest`.`conta` 
(`id`, `agencia`, `numero`, `tipo`, `saldo`, `fgc_conta`, `conta_ativa`, `instituicao_ìd`, `grupo_id`) 
VALUES 
(1, "3175", "34458-3", "Corrente", 0.00, true, true, 4, 1),
(2, "1111", "11111-3", "Cofrinho", 100.00, false, true, 4, 2),
(3, "2222", "22222-3", "Poupança", 1200.00, true, true, 1, 4),
(4, "3333", "33333-3", "Caixinha", 20.00, true, true, 2, 4);


SELECT * FROM sch_invest.conta



-- -----------------------------------------------------
-- Table `investimento`
-- -----------------------------------------------------
INSERT INTO `sch_invest`.`investimento` 
(`id`, `nome_ativo`, `quantidade_comprada`, `valor_aporte`, `rentabilidade_contratada`, `data_aporte`, 
`tipo`, `liquidez`, `indexador`, `data_vencimento`, `fgc_investimento`, `conta_id`, `grupo_id`) 
VALUES 
-- Caso real
(1, "FGTS", 0, 365.62, "3%", "timestamp()", "FGTS", "No vencimento", "PRÉ", "timestamp()", 0, 1, 3),
-- Tesouro Direto
(2, "Tesouro IPCA+ 2026", 9, 2256.02, "IPCA+ 1555%", "timestamp()", "TD", "D+1", "IPCA", "timestamp()", 1, 3, 3),
(3, "Tesouro IPCA+ 2029", 9, 3241.22, "IPCA+ 1555%", "timestamp()", "TD", "D+1", "IPCA", "timestamp()", 1, 3, 3),
(4, "Tesouro IPCA+ 2035", 9, 1782.25, "IPCA+ 1555%", "timestamp()", "TD", "D+1", "IPCA", "timestamp()", 1, 3, 3),
(5, "Tesouro IPCA+ 2045", 9, 6503.77, "IPCA+ 1555%", "timestamp()", "TD", "D+1", "IPCA", "timestamp()", 1, 3, 3),
(6, "Tesouro IPCA+ 2026", 9, 900, "IPCA+ 1555%", "timestamp()", "TD", "D+1", "IPCA", "timestamp()", 1, 3, 3),
(7, "Tesouro IPCA+ 2029", 9, 6757.07, "IPCA+ 1555%", "timestamp()", "TD", "D+1", "IPCA", "timestamp()", 1, 3, 3),
(8, "Tesouro SELIC 2029", 9, 8268.03, "SELIC + 0,00xxx", "timestamp()", "TD", "D+1", "SELIC", "timestamp()", 1, 3, 3),
(9, "Tesouro PRÉ 2032", 9, 2421.43, "14,56%", "timestamp()", "TD", "D+1", "PRÉ", "timestamp()", 1, 3, 3),
(10, "Tesouro PRÉ 2031", 9, 10399.73, "13,XX%", "timestamp()", "TD", "D+1", "PRÉ", "timestamp()", 1, 3, 3);


SELECT * FROM sch_invest.investimento



-- -----------------------------------------------------
-- Table `vencimento_detalhe`
-- -----------------------------------------------------
INSERT INTO `sch_invest`.`vencimento_detalhe` 
(`id`, `valo_recebido`, `percentual_ganho`, `investimento_id`) 
VALUES 
(1, 54870.45, 13.14, 2),
(2, 74823.45, 9.74, 5),
(3, 13720.45, 15.68, 7);


SELECT * FROM sch_invest.vencimento_detalhe



-- -----------------------------------------------------
-- Table `meta`
-- -----------------------------------------------------
INSERT INTO `sch_invest`.`meta` 
(`id`, `valor_alvo`, `data_estimada`, `descricao_detalhada`, `status_meta`, `investimento_id`) 
VALUES 
(1, 54241.00, "timestamp()", "Detalhe...", 1, 1);


SELECT * FROM sch_invest.meta



-- -----------------------------------------------------
-- Table `lista`
-- -----------------------------------------------------
INSERT INTO `sch_invest`.`lista` 
(`id`, `nome`, `descricao`) 
VALUES
(1, "Renda Fixa", "Investimento com crescimento positivo dos juros."),
(2, "Renda Variável", "Investimento com juros oscilando, podendo haver perdas."),
(3, "Indexador", "Referência de pagamento dos juros."),
(4, "Status", "Condição em que se encontra determinada meta."),
(5, "Grupo", "Grupo ao qual se destina determinado investimento."),
(6, "R$", "Real brasileiro."),
(7, "Liquidez", "A capacidade de conversão de um bem em dinheiro.");


SELECT * FROM sch_invest.lista



-- -----------------------------------------------------
-- Table `item`
-- -----------------------------------------------------
INSERT INTO `sch_invest`.`item` 
(`id`, `nome`, `descricao`, `lista_id`) 
VALUES 
-- Renda fixa
(1, "Tesouro", "Tesouro Direto.", 1),
(2, "CDB", "Certificado de Depósito Bancário.", 1),
(3, "RDB", "Recibo de Depósito Bancário.", 1),
(4, "LCI", "Letra de Crédito Imobiliário.", 1),
(5, "LCA", "Letra de Crédito do Agronegócio.", 1),
(6, "Poup", "Conta Poupança.", 1),
(7, "FGTS", "Fundo de Garantia do Tempo de Serviço.", 1),
(8, "C/C", "Conta Corrente.", 1),
-- Renda variável
(9, "FII", "Fundo de Investimento Imobiliário", 2),
-- Indexador
(10, "CDI", "Certificado de Depósito Interbancário", 3),
(11, "IPCA", "Índice de Preços ao Consumidor Amplo", 3),
(12, "PRÉ", "Taxa de juros previamente definida.", 3),
(13, "SELIC", "Sistema Especial de Liquidação e Custódia", 3),
-- Status
(14, "EAN", "Em andamento", 4),
(15, "CAN", "Cancelada", 4),
(16, "ATG", "Atingida", 4),
-- Grupo
(17, "Emergência", "Reserva de emergência.", 5),
(18, "Imóvel", "Aquisição de imóvel próprio.", 5),
(19, "Viagem", "Realizar viagem planejada.", 5),
(20, "Pets", "Cuidados com os animais do lar.", 5),
(21, "Pessoal", "Uso pessoal.", 5),
(22, "Reenvestir", "Reinvestir valor recebido.", 5),
(23, "G1-100K", "Período até 2029 para obter 100K.", 5),
(24, "G2-100K", "Período de 2030 até 2034 para obter 100K.", 5),
(25, "G3-100K", "Período de 2035 até 2039 para obter 100K.", 5),
(26, "G4-100K", "Período de 2040 até 2045 para obter 100K.", 5),
(27, "Oportunidade", "Reserva paa oportunidade futura", 5),
-- R$ 
(28, "Cédula", "Real brasileiro", 6),
(29, "Moeda", "Real brasileiro", 6),
-- Liquidez
(30, "Diária", "Obtio no mesmo dia da solicitação.", 7),
(31, "D+1", "Obtio no dia seguinte à solicitação.", 7),
(32, "D+2", "Obtio no segundo dia após a solicitação.", 7),
(33, "No vencimento", "Obtido apenas na data de vencimento.", 7);


SELECT * FROM sch_invest.item



-- -----------------------------------------------------
-- Table `armazenamento`
-- -----------------------------------------------------
INSERT INTO `sch_invest`.`armazenamento` 
(`id`, `local_interno`, `local_externo`) 
VALUES 
(1, "Local Interno 1", "Local Externo 1"),
(2, "Local Interno 2", "Local Externo 2"),
(3, "Local Interno 3", "Local Externo 3"),
(4, "Local Interno 4", "Local Externo 4"),
(5, "Local Interno 5", "Local Externo 5"),
(6, "Local Interno 6", "Local Externo 6"),
(7, "Local Interno 7", "Local Externo 7");


SELECT * FROM sch_invest.armazenamento



-- -----------------------------------------------------
-- Table `especie`
-- -----------------------------------------------------
INSERT INTO `sch_invest`.`especie` 
(`id`, `valor`, `tipo`, `descricao`, `armazenamento_id`, `grupo_id`) 
VALUES 
(1, 100.00, "Cédula", "Usado para...", 5, 1),
(2, 100.00, "Cédula", "Usado para...", 6, 2),
(3, 100.00, "Cédula", "Usado para...", 7, 3),
(4, 100.00, "Cédula", "Usado para...", 7, 4);


SELECT * FROM sch_invest.especie



-- -----------------------------------------------------
-- Table `cartao`
-- -----------------------------------------------------
INSERT INTO `sch_invest`.`cartao` 
(`id`, `modalidade`, `saldo_debito`, `limite_credito`, `img_bandeira`, `conta_id`, `armazenamento_id`) 
VALUES 
(NULL, NULL, NULL, NULL, NULL, NULL, NULL);


SELECT * FROM sch_invest.cartao

