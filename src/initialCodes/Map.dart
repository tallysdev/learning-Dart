void main(List<String> args) {
  Map<int, String> mapa = {1: 'valor'};
  print(mapa);
  mapa.putIfAbsent(2, () => 'valor 2');
  mapa[3] = 'valor 3';
  mapa.remove(3);
  mapa.update(2, (value) => 'valor 2 autalizado');
  mapa.forEach((key, value) => print('ah chave eh: $key e o valor eh: $value'));
  mapa.keys.forEach(print);
  mapa.values.forEach(print);
}
