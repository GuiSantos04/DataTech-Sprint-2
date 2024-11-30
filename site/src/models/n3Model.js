async function pergunta(mensagem, modeloIA) {
  try {
      var resultado = await modeloIA.generateContent(`Em um curto paragrafo responda: ${mensagem}`);
      
      if (resultado && resultado.response) {
          
          if (Array.isArray(resultado.response.candidates) && resultado.response.candidates.length > 0) {
              const candidato = resultado.response.candidates[0];
              
              const respostaTexto = candidato.content?.parts?.[0]?.text;
              
              if (respostaTexto) {
                  console.log("Resposta gerada:", respostaTexto);
                  return respostaTexto; 
              } else {
                  throw new Error("Texto não encontrado no candidato");
              }
          } else {
              throw new Error("Candidatos não encontrados ou não estão no formato esperado");
          }
      } else {
          throw new Error("Resposta do modelo não encontrada ou mal formatada");
      }
  } catch (error) {
      console.error("Erro ao obter resposta do modelo:", error);
      throw error;
  }
}

module.exports = {
  pergunta
}
