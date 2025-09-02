class Moto {
  String marca;
  String modelo;

  Moto(this.marca, this.modelo);
}

class Piloto extends Moto {
  String nomePiloto;

  Piloto(String marca, String modelo, this.nomePiloto) : super(marca, modelo);
}

void main() {
  var moto = Moto('honda', 'cbx');
  var piloto = Piloto('yamaha', 'ybr', 'james');

  print(moto.marca + moto.modelo);
  print(piloto.nomePiloto);
}
