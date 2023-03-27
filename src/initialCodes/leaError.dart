void main(List<String> args) {
  Login login = Login();

  try {
    login.logar();
  } on PasswordLength catch (e) {
    // rethrow;
    // throw Exception("Ocorreu um erro");
    // throw CustomError('Erro customizado');
    print('Falhou ao logar');
  } catch (e) {
    print('Outro erro');
  }
}

class Login {
  void logar() {
    String user = 'Tallys';
    String password = '123';

    if (password.length <= 6) throw PasswordLength();
  }
}

class PasswordLength implements Exception {
  PasswordLength();
}
