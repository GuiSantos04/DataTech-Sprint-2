const { GoogleGenerativeAI } = require("@google/generative-ai");
const app = require("../app");
var n3Model = require("../models/n3Model");

async function pergunta(req, res){
  const chatIA = new GoogleGenerativeAI(app.CHAVE_ACESSO_BOB);
  const mensagem = req.body.mensagem;

  const modeloIA = chatIA.getGenerativeModel({ model: "gemini-pro" });


      n3Model.pergunta(mensagem,modeloIA).then((resposta)=> {
        if(resposta.length > 0){
          return res.status(200).json(resposta);
        }else{
          return res.status(201).json({});
        }
      }).catch((error)=> {
        console.error(error);
        throw error;
      })
}

module.exports = {
  pergunta
}