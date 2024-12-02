var database = require("../database/config");

function buscarUltimasMedidas(idEmpresa, limite_linhas) {
  var instrucaoSql = `SELECT
    temperatura as temperatura,
     umidade as umidade,
      dataHora FROM
      (SELECT idSensor FROM sensor WHERE fkEmpresa = ${idEmpresa}) as empresa
        JOIN leitura ON fkSensor = idSensor
        ORDER BY idLeitura DESC LIMIT ${limite_linhas}
    `;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idEmpresa) {
  var instrucaoSql = `SELECT 
        temperatura as temperatura,
        umidade as umidade,
                        DataHora
                        FROM 
        (SELECT idSensor FROM sensor WHERE fkEmpresa = ${idEmpresa}) as empresa 
        JOIN leitura ON fkSensor = idSensor
                    ORDER BY idLeitura DESC LIMIT 1`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function calcularMedidas(idEmpresa) {
  var instrucaoSql = `select max(temperatura) as maxTemp, max(umidade) as maxUmid, round(avg(temperatura)) as mediaTemp, round(avg(umidade)) as mediaUmid   FROM 
        (SELECT idSensor FROM sensor WHERE fkEmpresa = ${idEmpresa}) as empresa 
        JOIN leitura ON fkSensor = idSensor;`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

module.exports = {
  buscarUltimasMedidas,
  buscarMedidasEmTempoReal,
  calcularMedidas,
};
