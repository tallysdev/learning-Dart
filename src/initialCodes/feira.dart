// Definition of the Vendas class
class Vendas {
  final String? date; // sale date, optional (?)
  final List<Itens>? itens; // list of Itens, optional (?)
  final double res = 0; // fixed value of 0, not used elsewhere
  double get nota {
    // getter that calculates the total sale
    final double valor = itens?.fold(0, (prev, item) => prev! + item.total) ??
        0; // uses the fold method to sum the values of the Itens in the list (if there are Itens in the list), otherwise returns 0
    return valor; // returns the total sale value
  }

  Vendas(this.date,
      this.itens); // constructor that receives the sale date and the list of Itens
  @override // toString method override
  String toString() {
    // TODO: implement toString
    return 'Venda, Data da venda: $date,\n Itens: $itens,\n Total da compra: $nota'; // returns a string that represents the Vendas object
  }
}

// Definition of the Produto class
class Produto {
  final double preco; // product price
  final String descricao; // product description
  final String validade; // product expiration date

  Produto(this.preco, this.descricao,
      this.validade); // constructor that receives the price, description, and expiration date of the product

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

  Itens(this.quant,
      this.produto); // constructor that receives the item quantity and the associated product

  double get total {
    // getter that calculates the total cost of the item
    return (quant *
        produto
            .preco); // returns the product price multiplied by the item quantity
  }

  @override
  String toString() {
    // toString method override
    return '\n Quantidade: $quant,\n\t Produto: $produto, Total: $total'; // returns a string that represents the Itens object
  }
}

void main(List<String> args) {
  // Create some Produto objects
  var feijao = Produto(3, "feijhao macassa", "10/03/2003");
  var arroz = Produto(3, "arroz vermelho", "10/03/2003");
  var carne = Produto(3, "carne de porco", "10/03/2003");

  // Create some Itens objects with the Produto objects created above
  var feijoada = Itens(10, feijao);
  var arrozDeLeite = Itens(10, arroz);
  var carneDePorco = Itens(10, carne);

  // Create a Vendas object with the Itens objects created above
  var janta = Vendas("10/0534", [feijoada, arrozDeLeite, carneDePorco]);

  // Print the Vendas object using its toString method
  print(janta);
}
