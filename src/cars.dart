void main(List<String> args) {
  var gol = Car('Reno', 'urbano', '2010');
  print(gol);
  gol.on();
}

class Car {
  late String make;
  late String model;
  late String yars;

  Car(this.make, this.model, this.yars);

  void on() {
    print('ON');
  }

  void off() {
    print('OFF');
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Marca: ${this.make}, Modelo: ${this.model}, Ano: ${this.yars}';
  }
}
