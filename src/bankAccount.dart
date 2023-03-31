void main(List<String> args) {
  var nubank = account(123);
  print(nubank);
  nubank.deposit(100);
  nubank.withdraw(100);
  print(nubank);
  nubank.deposit(100);
}

class account {
  late int number;
  double balance = 0;
  double rate = 0.1;

  account(this.number);

  void deposit(double value) {
    this.balance = value + this.balance;
    print('Seu saldo é: ${this.balance}');
  }

  void withdraw(double value) {
    this.balance = this.balance - (value + (value * this.rate));
    print('Seu saldo é: ${this.balance}');
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Seu saldo é: ${this.balance}, Numero da conta ${this.number}';
  }
}

// Crie uma classe que represente uma conta bancária. A classe deve ter atributos como número da conta, saldo e taxa de juros, bem como métodos para depositar e sacar dinheiro.