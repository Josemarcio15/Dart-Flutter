class Moto {
  String marca;
  String modelo;

  Moto(this.marca, this.modelo);
}

void main() {
  var moto = Moto('honda', 'cbx');
  print(moto.marca + moto.modelo);
}
