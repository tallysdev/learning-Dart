void main(List<String> args) async {
  // Future, async and await

  String nome = "tallys";
  Future<String> cepFuture = getCepByName("Rua JK");
  late String cep;

  // cepFuture.then((value) => cep = value);

  cep = await cepFuture;

  print(cep);
}

Future<String> getCepByName(String name) {
  return Future.value("1234567");
}
