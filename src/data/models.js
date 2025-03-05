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
 * 
 */
function GrupoSchema(options = {}){
    this.id = options.id;
    this.nome = options.nome;
    this.descricao = options.descricao;
}
