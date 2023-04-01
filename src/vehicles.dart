void main(List<String> args) {}

abstract class Vehicles {
  late String make;
  late String type;
  late int rodas;

  void on();

  void off();
}

class Car implements Vehicles {
  @override
  late String make;

  @override
  int rodas = 4;

  @override
  late String type;

  late int tanque;

  Car(this.make, this.tanque, this.type);

  @override
  void off() {
    print('carro OFF');
  }

  @override
  void on() {
    print('carro ON');
  }
}

class Motorcycle implements Vehicles {
  late int tanque;
  @override
  late String make;

  @override
  int rodas = 2;

  @override
  late String type;

  @override
  void off() {
    print('Motorcycle desligada');
  }

  @override
  void on() {
    print('Motorcycle desligada');
  }

  Motorcycle(this.make, this.tanque, this.type);
}

class Truck implements Vehicles {
  @override
  late int tanque;
  late String make;

  @override
  int rodas = 6;

  @override
  late String type;

  Truck(this.make, this.tanque, this.type);

  @override
  void off() {
    print('Truck OFF');
  }

  @override
  void on() {
    print('Truck ON');
  }
}

// Crie uma hierarquia de classes que represente diferentes tipos de veículos (por exemplo, carro, caminhão, Motorcyclecicleta). Cada subclasse deve ter seus próprios atributos e métodos.

// Create a class hierarchy that represents different types of Vehicles (e.g. car, truck, Motorcyclercycle). Each subclass should have its own attributes and methods.