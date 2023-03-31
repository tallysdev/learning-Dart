void main(List<String> args) {
  var poo = classe("Tallys", 19, "3 periodo");
  print(poo);
  print('${poo.gpa([3,5,9])}');
}

class classe {
  late String nome;
  late int idade;
  late String serie;

  classe(this.nome, this.idade, this.serie);

  double gpa(List<int> materias) {
    double values = 0;
    double gpa;
    for (var i = 0; i < materias.length; i++) {
      values = materias[i] + values;
    }
    gpa = values / materias.length;
    return gpa;
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Nome: ${this.nome}, Idade:${idade}, Serie:${this.serie}';
  }
}
