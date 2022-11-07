class Usuario {
  String _nome = "";
  String _email = "";
  String _senha = "";

  Usuario(
      String nome,
      String email,
      String senha,
      ) {
    this._nome = nome;
    this._email = email;
    this._senha = senha;
  }



  String getNome() {
    return this._nome;
  }

  String getEmail() {
    return this._email;
  }

  String getSenha() {
    return this._senha;
  }

  void setNome(String nome) {
    this._nome = nome;
  }

  void setEmail(String email) {
    this._email = email;
  }

  void setSenha(String senha) {
    this._senha = senha;
  }

  String toString() {
    return "Usuario:nome: ${_nome} - email: ${_email} - senha: ${_senha}";
  }
}
