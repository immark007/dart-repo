void main() {
  //Aqui eu fiz uma estancia da minha conta corrente, coloquei o nome dela de conta, e ela vai ser igual a minha contaCorrente, e dps passei os valores dentro dela
  ContaCorrente conta = ContaCorrente();
  //Posso acessar meus objetos usando o conta. o objeto que eu quero, e passar o valor que ele recebe
  conta.titular = "Amanda";
  conta.agencia = 123;
  conta.conta = 1;
  print("Titular: ${conta.titular}");
  print("Agência: ${conta.agencia}");
  print("Conta: ${conta.conta}");
  print("Saldo: ${conta.saldo}");

  ContaCorrente contaDoTiago = ContaCorrente();
  contaDoTiago.titular = "Tiago";
  contaDoTiago.agencia = 123;
  contaDoTiago.conta = 2;
  contaDoTiago.saldo = 100.00;
  print("Titular: ${contaDoTiago.titular}");
  print("Agência: ${contaDoTiago.agencia}");
  print("contaDoTiago: ${contaDoTiago.conta}");
  print("Saldo: ${contaDoTiago.saldo}");

  double valor = 300.0;
  double deposito = 50.0;
  contaDoTiago.saque(valor);

  contaDoTiago.tranferir(conta, deposito);

  print(conta.saldo);
}

class ContaCorrente {
  //Classe conta corrente, ela tem 4 objetos, um titular do tipo String, uma agência do tipo inteiro, uma conta do tipo inteiro, e um saldo do tipo double
  String titular = "";
  int agencia = 0;
  int conta = 0;
  double saldo = 0.0;

  //Criando um método para saque
  //a lógica vai ser meu saldo - valor do saque, o meu limite é até o saldo negativo -100, menor que isso já não posso fazer saque
  void saque(double valorDoSaque) {
    // ignore: unnecessary_this
    if (this.saldo - valorDoSaque < -100) {
      //Se o meu saldo, menos o meu valor de saque for menor que -100, ent eu não tenho crédito para o saque
      print("Sem saldo suficiente");
    } else {
      // Se não, o valor do saque vai ser descontado do meu saldo
      print("Sacando $valorDoSaque reais");
      saldo -= valorDoSaque;
    }
  }

  //Método para depositar
  void depositar(double valorDoDeposito) {
    //passando o valor do deposito como parametro
    if (saldo >= 0) {
      // Verificando se o deposito que eu quero fazer é maior que 0, se for eu executo o deposito acrescentando ele no meu saldo
      saldo += valorDoDeposito;
    } else {
      // Se não for eu printo que o deposito tem que ser positivo
      print("O valor do deposito deve ser positivo");
    }
  }

  // Método para transferir
  void tranferir(ContaCorrente contaRecebe, double valor) {
    // Passando como parametro a conta que vai ser recebida essa valor, ela vai ser do tipo contaCorrente, que é minha classe
    if (saldo >= valor) {
      // Verificando se meu saldo é maior ou igual ao valor que eu quero depositar, se for ele diminui esse valor do saldo da minha conta
      // E minha contaRecebe vai receber o deposito desse valor, ou seja, vai ser acrescentado no saldo dela esse valor
      saldo -= valor;
      contaRecebe.depositar(valor);
      print("Tranferido o valor de $valor reais para ${contaRecebe.titular}");
    } else {
      print("Seu saldo é insuficiente");
    }
  }
}
