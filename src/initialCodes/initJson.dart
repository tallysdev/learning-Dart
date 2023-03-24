import 'dart:convert';

void main(List<String> args) {
  String json = '''
  {    
    "usuario": "tallys",
    "senha": 123456,
    "permissoes": [
      "owner", "admin"
    ]
  } 
  ''';

  print(json);

  Map resultMapa = jsonDecode(json);
  print(resultMapa['permissoes'][1]);

  Map mapa = {
    'user': 'aureliano',
    'pass': 23445,
    'role': ["owner", "admin"]
  };

  print(mapa);

  var resultJson = jsonEncode(mapa);
  print(resultJson);
}
