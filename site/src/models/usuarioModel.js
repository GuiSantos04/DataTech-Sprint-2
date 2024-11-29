var database = require("../database/config")

function autenticar(usuario, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", usuario, senha)
    var instrucaoSql = `
        SELECT idEmpresa, Usuario, Senha FROM empresa WHERE Usuario = '${usuario}' AND Senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function cadastrar(empresa, nome, repre, cnpj, email, usuario, senha, unidade, tam, cep, num, cidade, estado) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", empresa, nome, repre, cnpj, email, usuario, senha);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        INSERT INTO endereco (cep, numero, cidade, estado) VALUES ('${cep}', '${num}', '${cidade}', '${estado}');
        `;
        
        var instrucaoSql2 = `
        INSERT INTO empresa (RazaoSocial, NomeFantasia, Representante, CNPJ, Email, Usuario, Senha) VALUES ('${empresa}', '${nome}', '${repre}', '${cnpj}', '${email}', '${usuario}', '${senha}');
        `;
        
        var instrucaoSql3 = `
        INSERT INTO datacenter (unidade, tamanhoDC) VALUES ('${unidade}', '${tam}');
        `


    console.log("Executando a instrução SQL: \n" + instrucaoSql + instrucaoSql2 + instrucaoSql3);
    return database.executar(instrucaoSql), database.executar2(instrucaoSql2), database.executar3(instrucaoSql3);
}



module.exports = {
    autenticar,
    cadastrar
};