void main(List<String> args) {
  String nome = "tallys";

  print(Utils().toFirstChar(nome));
  print(nome.toUpperCaseExtencion());
  print(EnumTest.enumValue.toValue());
  print(EnumTest.newEnum.toValue());
}

enum EnumTest {
  enumValue,
  newEnum;
}

extension ExtensionTest on Enum {
  String toValue() {
    Map map = {EnumTest.enumValue: 'value', EnumTest.newEnum: 'newValue'};

    return map[this];
  }
}

extension ExtensionString on String {
  String toUpperCaseExtencion() {
    return this[0].toUpperCase() + this.substring(1);
  }
}

class Utils {
  toFirstChar(String value) {
    return value[0].toUpperCase() + value.substring(1);
  }
}
