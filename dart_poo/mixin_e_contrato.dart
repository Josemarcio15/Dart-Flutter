mixin Cilindrada {
  int potencia = 0;
  int potenciaDaMoto(int cm) {
    return this.potencia;
  }
}

class Veiculo {
  //void ligar() {}; geraria um erro, pois sairia da norma contrato.
  void acelerar() {}
}

class Moto with Cilindrada implements Veiculo {
  @override
  void acelerar() => print("moto acelerando");
}

void main() {
  var moto = Moto();

  var carro = Veiculo();
  carro.acelerar();
  //moto.ligar(); //nao herda de Veiculo
  moto.acelerar();
  print(moto.potencia = 250);
}
