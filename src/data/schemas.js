const {} = require('drizzle-orm');
const { pgTable, serial, integer, varchar, boolean, timestamp, text } = require('drizzle-orm/pg-core');
const {} = require('drizzle-orm/mysql-core');

// Schema da Instituição
// `nome`, `cnpj`, `tipo`, `descricao`, `img_logo`
const InstituicaoSchema = pgTable("instituicao",{
    id: integer("id").primaryKey(),
    cnpj: varchar("cnpj", { length: 45 }).notNull(),
    tipo: varchar("tipo", { length: 45 }).notNull(),
    descricao: varchar("descricao", {length: 45 }).notNull(),
    imgLogo: varchar("img_logo", { length: 45 }).notNull(),
});


// Schema do Grupo
// `id`, `nome`, `descricao`
const GrupoSchema = pgTable("grupo",{
    id: integer("id").primaryKey(),
    nome: varchar("nome", { length: 45 }).notNull(),
    descricao: varchar("descricao", { length: 100 }).notNull(),
})


// Schema da Conta
// `id`, `agencia`, `numero`, `tipo`, `saldo`, `fgc_conta`, `conta_ativa`, `instituicao_ìd`, `grupo_id`
const ContaSchema = pgTable("conta", {
    id: integer("id").primaryKey(),
    agencia: varchar("agencia", { length: 45 }).notNull(),
    numero: varchar("numero", { length: 45 }).notNull(),
    tipo: varchar("tipo", { length: 45 }).notNull(),
    saldo: varchar("saldo", { length: 45 }).notNull(),
    fgcConta: varchar("fgc_conta", { length: 45 }).notNull(),
    contaAtiva: varchar("conta_ativa", { length: 45 }).notNull(),
    instituicaoId: varchar("instituicao_ìd", { length: 45 }).notNull(),
    grupoId: varchar("grupo_id", { length: 45 }).notNull(),
})