class Veiculo {
  void acelerar() {
    print("acelerando");
  }

  void freiar() {
    print("freiando");
  }
}

class Motocicleta implements Veiculo {
  @override
  void acelerar() {
    print("moto acelerando");
  }

  void freiar() {
    print("moto freando");
  }
}

main() {
  var moto = Motocicleta();

  moto.acelerar();
  moto.freiar();
}
