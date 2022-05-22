class User {
  final int id;
  final String name;
  final int accountNumber;
  final String cpf;
  final double balance;
  String? username;
  String? password;

  User(this.id, this.name, this.accountNumber, this.cpf, this.balance,
      {this.username, this.password});
}
