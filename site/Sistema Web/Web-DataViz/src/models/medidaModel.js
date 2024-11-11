var database = require("../database/config");

function buscarUltimasMedidas(idAquario, limite_linhas) {

    var instrucaoSql = `SELECT 
        temperatura as temperatura, 
        umidade as umidade,
                        DataHora
                        FROM leitura
                    WHERE fkSensor = ${idAquario}
                    ORDER BY idLeitura DESC LIMIT ${limite_linhas}`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idAquario) {

        var instrucaoSql = `SELECT 
        temperatura as temperatura, 
        umidade as umidade,
                        DataHora
                        FROM leitura
                    WHERE fkSensor = ${idAquario}
                    ORDER BY idLeitura DESC LIMIT 1`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}
