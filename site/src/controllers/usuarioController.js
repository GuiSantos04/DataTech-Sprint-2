var usuarioModel = require("../models/usuarioModel");


function autenticar(req, res) {
    var usuario = req.body.usuarioServer;
    var senha = req.body.senhaServer;

    if (usuario == undefined) {
        res.status(400).send("Seu usuario está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {

        usuarioModel.autenticar(usuario, senha)
            .then(
                function (resultadoAutenticar) {
                    console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`); // transforma JSON em String

                    if (resultadoAutenticar.length == 1) {
                        console.log(resultadoAutenticar);

                        res.json({
                            id: resultadoAutenticar[0].id_usuario,
                            nome: resultadoAutenticar[0].nome,
                            senha: resultadoAutenticar[0].senha
                        });
                            
                    } else if (resultadoAutenticar.length == 0) {
                        res.status(403).send("Usuario e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

}




function cadastrar(req, res) {

    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nome = req.body.nomeServer;
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;
    var repre = req.body.repreServer;
    var cnpj = req.body.cnpjServer;
    var empresa = req.body.empresaServer;
    var usuario = req.body.usuarioServer;
    var unidade = req.body.unidadeServer;
    var tam = req.body.tamanhoServer;

    // Faça as validações dos valores
    if (nome == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está undefined!");
    } else{

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrar(empresa, nome, repre, cnpj, unidade, tam, email, usuario, senha)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

function cadastrarendereco(req, res) {
    console.log('Passando na controller-endereço')
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
 
    var cep = req.body.cepServer;
    var num = req.body.numServer;
    var cidade = req.body.cidadeServer;
    var estado = req.body.estadoServer;

    // Faça as validações dos valores
    if (cep == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else if (cidade == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (estado == undefined) {
        res.status(400).send("Sua senha está undefined!");
    } else if (estado == undefined) {
        res.status(400).send("Sua senha está undefined!");
    } else{

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrarendereco(cep, num, cidade, estado)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}


module.exports = {
    autenticar,
    cadastrar,
    cadastrarendereco
}