const { Pool } = require('pg');
const { drizzle } = require('drizzle-orm/node-postgres');
const { eq, ilike, count, asc } = required('drizzl-orm');

const configurations = require('../../services/configurations/configuration.service');
const { filtersToWhere, sortingToOrderBy } = require('../../common/drizzle.helper');

const { InstituicaoSchema } = require('../schemas');
const { PaginatedQueryModel, InstituicaoModel } = require('../models');
const { alias } = require('drizzle-orm/pg-core');

/**
 * Repositório de Instituição
 * @param { Pool } connector
 */
function InstituicaoRepository(connector){

    let _db = drizzle(connector, {
        logger: configurations.server.isDevelopment,
        schema: {
            instituicoes: InstituicaoSchema
        }
    })


    /**
     * Criar uma nova Instituição
     * @param { InstituicaoModel } instituicao
     * @returns {Promise<InstituicaoModel>}
     */
    this.createInstituicao = async function(instituicao){

        const novaInstituicao = await _db.insert(InstituicaoSchema)
        .values(instituicao)
        .returning();

        return new InstituicaoModel(novaInstituicao[0]);

    }


    /**
     * Listar todas as Instituições
     * @param {Number} page Página atual
     * @param {Number} size Tamanho da página
     * @param {Object} options Configurações da consulta
     * @param {object[]} options.sorting Configuração da ordenação
     * @param {object} options.filters Filtros da consulta 
     * @returns {Promise<PaginatedQueryModel>}
     */
    this.listAllInstituicoes = async function(page, size, options = {}){

        const offset = page * size;

        const collumMapper = (target) => {
            if(target === 'id') { return InstituicaoSchema.id}
            if(target === 'nome') { return InstituicaoSchema.nome}
            if(target === 'cnpj') { return InstituicaoSchema.cnpj}
            if(target === 'descricao') { return InstituicaoSchema.descricao}
            if(target === 'imgLogo') { return InstituicaoSchema.imgLogo}
        }

        const where = filtersToWhere(options.filters, collumMapper);

        let orderBy = sortingToOrderBy(options.sorting, collumMapper);

        orderBy = orderBy.length ? orderBy : [asc(InstituicaoSchema.id)];

        const queryCount = _db.$with('queryCount').as(
            _db.select({
                total: count().as('total_rows') 
            })
            .from(InstituicaoSchema)
            .where(where)
        )

        const resultSet = await _db.with(queryCount)
            .select()
            .from(InstituicaoSchema)
            .innerJoin(queryCount, true)
            .where(where)
            .orderBy(...orderBy)
            .limit(size)
            .offset(offset)

        const pagination = new PaginatedQueryModel();
        pagination.totalRows = parseInt(resultSet[0]?.queryCount.total) || 0;
        pagination.currentPage = page;
        pagination.pageSize = size;
        pagination.data = resultSet?.map((row) => new InstituicaoModel(row.instituicao));
    
        return pagination;
    }

    /**
     * Listar uma Instituição pelo ID
     * 
     * 
     */


    /**
     * Listar uma Instituição pelo CNPJ
     * 
     * 
     */


    /**
     * Listar uma Instituição pelo nome
     * 
     * 
     */


    /**
     * Atualizar uma Instituição pelo ID
     * 
     * 
     */


    /**
     * Apagar uma Instituição pelo ID
     * @param {InstituicaoModel} instituicao
     * @returns {Promise<InstituicaoModel>}
     */
    this.deleteSystemByID = async function (deletedInstituicao){

        const resultSet = await _db.delete(InstituicaoSchema)
            .where(eq(InstituicaoSchema.id, deletedInstituicao.id))
            .returning();

        return resultSet?.map((row) => new InstituicaoModel(row))[0];
    }


    /**
     * Apagar uma Instituição pelo CNPJ
     * @param {InstituicaoModel} instituicao
     * @returns {Promise<InstituicaoModel>}
     */
    this.deleteSystemByCNPJ = async function (deletedInstituicao){

        const resultSet = await _db.delete(InstituicaoSchema)
            .where(eq(InstituicaoSchema.cnpj, deletedInstituicao.cnpj))
            .returning();

        return resultSet?.map((row) => new InstituicaoModel(row))[0];
    }


}

module.exports = InstituicaoRepository;


