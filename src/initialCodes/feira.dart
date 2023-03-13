// Definition of the Vendas class
class Vendas {
  final String date; // sale date, optional (?)
  final List<Itens> itens; // list of Itens, optional (?)
  final double res = 0; // fixed value of 0, not used elsewhere

  // calculates the total sale
  double nota() => itens.fold(0, (prev, item) => prev + item.total());

  Vendas(
      {required this.date,
      required this.itens}); // constructor that receives the sale date and the list of Itens
  @override // toString method override
  String toString() {
    // TODO: implement toString
    return 'Venda, Data da venda: $date,\n Itens: $itens,\n Total da compra: ${this.nota()}'; // returns a string that represents the Vendas object
  }
}

// Definition of the Produto class
class Produto {
  final double preco; // product price
  final String descricao; // product description
  final String validade; // product expiration date

  Produto(
      {required this.preco,
      required this.descricao,
      required this.validade}); // constructor that receives the price, description, and expiration date of the product

  @override
  String toString() {
    // toString method override
    // TODO: implement toString
    return 'Preço do produto: $preco, Descrição: $descricao, Validade $validade'; // returns a string that represents the Produto object
  }
}

// Definition of the Itens class
class Itens {
  final double quant; // item quantity
  final Produto produto; // product associated with the item

  Itens(
      {required this.quant,
      required this.produto}); // constructor that receives the item quantity and the associated product

  double total() =>
      quant *
      produto
          .preco; // returns the product price multiplied by the item quantity

  // double total() => this.quant * this.produto.preco;

  @override
  String toString() {
    // toString method override
    return '\n Quantidade: $quant,\n\t Produto: $produto, Total: ${this.total()}'; // returns a string that represents the Itens object
  }
}

void main(List<String> args) {
  // Create some Produto objects
  var feijao =
      Produto(preco: 3, descricao: "feijhao macassa", validade: "10/03/2003");
  var arroz =
      Produto(preco: 3, descricao: "arroz vermelho", validade: "10/03/2003");
  var carne =
      Produto(preco: 3, descricao: "carne de porco", validade: "10/03/2003");

  // Create some Itens objects with the Produto objects created above
  var feijoada = Itens(quant: 10, produto: feijao);
  var arrozDeLeite = Itens(quant: 10, produto: arroz);
  var carneDePorco = Itens(quant: 10, produto: carne);

  // Create a Vendas object with the Itens objects created above
  var janta =
      Vendas(date: "10/0534", itens: [feijoada, arrozDeLeite, carneDePorco]);

  // Print the Vendas object using its toString method
  print(janta);
}
