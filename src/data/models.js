/**
 * Modelo de Paginação
 * - Sem tabela relacionada
 * @param { Object} options Dados da consulta paginada
 * @param {Number} options.totalRows Quantidade de registros encontrados
 * @param {Number} options.currentPage Número da página atual (começa em 0)
 * @param {Number} options.pageSize Quantidade de registros por página
 * @param {Object[]} options.data Lista de registros da consulta 
 */
function PaginatedQueryModel(options = {}) {
    this.totalRows = options.totalRows;
    this.currentPage = options.currentPage;
    this.pageSize = options.pageSize;
    this.data = options.data || [];
}


/**
 * Modelo da Instituição
 * - Tabela: instituicao
 * @param { Object } options 
 * `nome`, `cnpj`, `tipo`, `descricao`, `img_logo`
 */

function InstituicaoModel(options = {}){
    this.id = options.id;
    this.nome = options.nome;
    this.cnpj = options.cnpj;
    this.tipo = options.tipo;
    this.descricao = options.descricao;
    this.imgLogo = options.imgLogo;
}


/**
 * Modelo de Grupo
 * - Tabela: grupo
 * @param { Object } options 
 * `id`, `nome`, `descricao`
 */
function GrupoModel(options = {}){
    this.id = options.id;
    this.nome = options.nome;
    this.descricao = options.descricao;
}


/**
 * Modelo de Conta
 * - Tabela: conta
 * @param { Object } options 
 * `id`, `agencia`, `numero`, `tipo`, `saldo`, `fgc_conta`, `conta_ativa`, `instituicao_ìd`, `grupo_id`
 */
function ContaModel(options = {}){
    this.id = options.id;
    this.agencia = options.agencia;
    this.numero = options.numero;
    this.tipo = options.tipo;
    this.saldo = options.fgcConta;
    this.contaAtiva = options.contaAtiva;
    this.instituicaoId = options.instituicaoId;
    this.grupoId = options.grupoId;
}

module.exports = {

    //Paginação
    PaginatedQueryModel,

    //Instituição
    InstituicaoModel,

    //Grupo
    GrupoModel,

    //Conta
    ContaModel,


}