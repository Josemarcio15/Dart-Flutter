class AutenticarService {
  String textLogin = '';
  String textSenha = '';

  AutenticarService(this.textLogin, this.textSenha);
  void autenticar() {
    if (textLogin == 'marcio' && textSenha == '1234') {
    } else {
      print("usuario incoreto");
    }
  }
}
