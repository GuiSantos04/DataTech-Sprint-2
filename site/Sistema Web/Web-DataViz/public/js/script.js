var user = "";
var passwd = "";

function logar() {
  var login = ipt_login.value;
  var senhaLogin = ipt_senha_login.value;
  var mensagem = "";

  if (login == "Frizza" && senhaLogin == "Frizza@12345") {
    estrutura_login.innerHTML = `
    <header>
        <img src="./img/logo-png.png" class="logo">
    </header>
    <div class="container-login">
        <div class="card cadastro">
            <h1>Bem vindo ${login}!</h1>
            <a href="Dash-Teste.html"><img width="100px" src="./img/verificar.png"></a>
            <div class=cadastro_realizado>
                <span>Clique no botão verde para ser redirecionado a sua página.</span>
            </div>
        </div>
    </div>
    <footer>
        <span> &copy; 2024 DataTech Security </span>
    </footer>`;
  } else {
    alert("Algo deu errado! \nCredenciais devem ser iguais a do cadastro!");
  }

  fetch("/usuarios/autenticar", {
    method: "POST",
    headers: {
        "Content-Type": "application/json"
    },
    body: JSON.stringify({
        usuarioServer: usuario,
        senhaServer: senha
    })
}).then(function (resposta) {
    console.log("ESTOU NO THEN DO entrar()!")

    if (resposta.ok) {
        console.log(resposta);

        resposta.json().then(json => {
            console.log(json);
            console.log(JSON.stringify(json));
            sessionStorage.USER_USUARIO = json.usuario;
            sessionStorage.NOME_USUARIO = json.nome;
            sessionStorage.ID_USUARIO = json.id;

            setTimeout(function () {
                window.location = "formulario.html";
            }, 1000); // apenas para exibir o loading

        });

    } else {

        console.log("Houve um erro ao tentar realizar o login!");

        resposta.text().then(texto => {
            console.error(texto);
            finalizarAguardar(texto);
        });
    }

}).catch(function (erro) {
    console.log(erro);
})

return false;
}

function sumirMensagem() {
cardErro.style.display = "none"
}


function cadastrar1(){
  var cep = ipt_cep.value;
  var num = ipt_num.value;
  var cidade = ipt_cidade.value;
  var estado = ipt_estado.value;
  var tam_cep = cep.length;
  var tam_num = num.length;
  var tam_cidade = cidade.length;
  var tam_estado = estado.length;
  var cep_int = parseInt(cep);
  var num_int = parseInt(num);




  if (
    tam_num == 0 ||
    tam_cep == 0 ||
    tam_cidade == 0 ||
    tam_estado == 0
  ) {
    alert("Todos os campos devem ser inseridos!");
  } else if (tam_cep < 8 || cep_int != cep || cep < 0) {
    alert("O CEP deve ser um número inteiro com 8 digítos!");
  } else if (num_int != num || num < 0) {
    alert("O número deve ser um valor inteiro!");
  } else{
    estrutura.innerHTML = `
       <header>
           <img src="./img/logo-png.png" class="logo">
       </header>
       <div class="container-login">
           <div class="card cadastro">
               <h1>Cadastro realizado com sucesso!</h1>
               <a href="login.html"><img width="100px" src="./img/verificar.png"></a>
               <div class=cadastro_realizado>
                   <span>Clique no botão verde para ser redirecionado a tela tela de login.</span>
               </div>
           </div>
       </div>
       <footer>
           <span> &copy; 2024 DataTech Security </span>
       </footer>`;
  }


}
// 
