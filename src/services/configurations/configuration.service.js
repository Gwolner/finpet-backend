/** 
 * #################################
 * ###### CRIAR A MINHA VERSÃO #####
 * #################################
 *  */ 
const ConfigurationService = {
    server: {
      env: process.env.NODE_ENV,
      port: process.env.PORT ?? 3000,
      isDevelopment: /development/i.test(process.env.NODE_ENV),
      isProduction: /production/i.test(process.env.NODE_ENV),
    },
    api: {
      name: process.env.API_NAME,
      alias: process.env.API_ALIAS,
      uri: process.env.API_URL,
      users: {
        system: {
          id: parseInt(process.env.SYSTEM_USER_ID),
          username: process.env.SYSTEM_USER_USERNAME,
        },
      },
      dirs:{
        temp: process.env.DIR_TEMP,
        uploads: process.env.DIR_UPLOADS,
      },
      auth: {
        disabled: /true/i.test(process.env.NO_AUTH),
        passwordSaltRounds: parseInt(process.env.PASSWORD_SALT_ROUNDS || 10),
        token: {
          key: process.env.TOKEN_SECRET_KEY,
          expiration: process.env.TOKEN_EXPIRES_IN || "1h",
        },
      },
      crypt: {
        method: process.env.ECNRYPTION_METHOD,
        key: process.env.ECNRYPTION_SECRET_KEY,
        iv: process.env.ECNRYPTION_SECRET_IV,
      },
      sip: {
        uri: process.env.SIP_URL,
        accessKey: process.env.SIP_ACCESS_KEY,
        systemId: process.env.SIP_SYSTEM_ID,
        systemAcronym: process.env.SIP_SYSTEM_ACRONYM,
        systemOrganAcronym: process.env.SIP_SYSTEM_ORGAN_ACRONYM,
      },
    },
    app: {
      uri: process.env.APP_URL,
    },
    db: {
      connectionString: process.env.DB_CONNECTION_STRING,
      ssl: /true/i.test(process.env.DB_SSL),
    },
    smtp: {
      enabled: /true/i.test(process.env.SMTP_ENABLED),
      auth: {
        user: process.env.SMTP_AUTH_USER,
        pass: process.env.SMTP_AUTH_PASS,
      },
      host: process.env.SMTP_HOST,
      port: process.env.SMTP_PORT,
      secure: /true/i.test(process.env.SMTP_SECURE),
      from: process.env.SMTP_FROM,
    },
    cache:{
      host: process.env.CACHE_HOST,
      port: process.env.CACHE_PORT,
    },
  };
  
  module.exports = ConfigurationService;
  