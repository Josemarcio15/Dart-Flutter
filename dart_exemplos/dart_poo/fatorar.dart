class Carro{
    String modelo = '';
    int ano = 0;

    factory Carro(String modelo, int ano){
        return Carro._(modelo, ano);
    }
    Carro._(this.modelo, this.ano);
}

void main(){
    var carro = Carro('Onix', 2008);

    print(carro.modelo);
}
