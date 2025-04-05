mixin Cilindrada {
  int potencia = 0;
  int potenciaDaMoto(int cm) {
    return this.potencia;
  }
}

abstract class Veiculo {
  void ligar() => print("Ligando veiculo");
  void acelerar() => print("veiculo acelerando");
}

class Moto extends Veiculo with Cilindrada {
  @override
  void acelerar() => print("moto acelerando");
}

void main() {
  var moto = Moto();
  // Isso demonstra a principal diferença entre abstract e implements.
  // var carro = Veiculo(); // Erro: classes abstratas não podem ser instanciadas.
  // carro.acelerar(); // Não é possível, pois Veiculo não pode ser instanciada.

  moto.ligar(); //classes abstrata tambem possui implementacao dentro dos metodos
  moto.acelerar();
  print(moto.potencia = 250);
}
