import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:convert';
import 'model/User.dart';

class DAO {
  Future<Database> _recuperarBancoDados() async {
    final path = await getDatabasesPath();
    final localBD = join(path, "Usuarios.db");

    var retorno = await openDatabase(
      localBD,
      version: 1,
      onCreate: (db, dbVersaoRecente) {
        String sql =
            "CREATE TABLE usuarios(email VARCHAR PRIMARY KEY,nome VARCHAR,senha VARCHAR);";
        db.execute(sql);
      },
    );

    print(retorno.isOpen.toString());
    return retorno;
  }

  Future<String> salvarDadosUsuario(
      String nome, String email, String senha) async {
    Database db = await _recuperarBancoDados();
    Map<String, dynamic> dadosUsuario = {
      "email": email,
      "nome": nome,
      "senha": senha,
    };

    await db.insert("usuarios", dadosUsuario);
    await db.close();
    return "email inserido";
  }

  listarUsuarios() async {
    Database db = await _recuperarBancoDados();
    String sql = "SELECT * FROM usuarios";

    List usuarios = await db.rawQuery(sql);

    for (var elm in usuarios) {
      print(
          "nome: ${elm["nome"]}   email: ${elm["email"]}   senha: ${elm["senha"]}");
    }
    await db.close();
  }

  Future<Usuario> listarUnicoUsuario(String email) async {
    Database db = await _recuperarBancoDados();
    Usuario user = new Usuario(" ", " ", " ");
    List usuario = await db.query("usuarios",
        columns: ["nome", "email", "senha"],
        where: "email = ?",
        whereArgs: [email]);

    if (!usuario.isEmpty) {
      user = new Usuario(
          usuario[0]["nome"], usuario[0]["email"], usuario[0]["senha"]);
    }

    print("${user.toString()}");

    await db.close();
    return user;
  }

  Future<Usuario> listarUnicoUsuarioByEmail(String email) async {
    Database db = await _recuperarBancoDados();
    Usuario user = new Usuario("", "", "");
    List usuario = await db.query("usuarios",
        columns: ["nome", "email", "senha"],
        where: "email = ?",
        whereArgs: [email]);

    if (!usuario.isEmpty) {
      user = new Usuario(
          usuario[0]["nome"], usuario[0]["email"], usuario[0]["senha"]);
    }

    print("${user.toString()}");

    await db.close();
    return user;
  }

  updateUsuario(String nome, String email, String senha) async {
    Database db = await _recuperarBancoDados();
    Map<String, dynamic> dadosUsuario = {
      "nome": nome,
      "email": email,
      "senha": senha
    };

    int retorno = await db.update(
      "usuarios",
      dadosUsuario,
      where: "email = ?",
      whereArgs: [email],
    );

    print("UPDATEUsuario: ${retorno}");
    await db.close();
  }

  updateUsuarioNome(String nome, String email) async {
    Database db = await _recuperarBancoDados();
    Map<String, dynamic> dadosUsuario = {
      "nome": nome,
    };

    int retorno = await db.update(
      "usuarios",
      dadosUsuario,
      where: "email = ?",
      whereArgs: [email],
    );

    print("UPDATENomeUsuario: ${retorno}");
    await db.close();
  }

  updateUsuarioEmail(String email) async {
    Database db = await _recuperarBancoDados();
    Map<String, dynamic> dadosUsuario = {
      "email": email,
    };

    int retorno = await db.update(
      "usuarios",
      dadosUsuario,
      where: "email = ?",
      whereArgs: [email],
    );
    await db.close();
    print("UPDATEEmailUsuario: ${retorno}");
  }

  updateUsuarioSenha(String email, String senha) async {
    Database db = await _recuperarBancoDados();
    Map<String, dynamic> dadosUsuario = {
      "senha": senha,
    };

    int retorno = await db.update(
      "usuarios",
      dadosUsuario,
      where: "email = ?",
      whereArgs: [email],
    );
    await db.close();
    print("UPDATESenhaUsuario: ${retorno}");
  }

  excluirUsuario(String email) async {
    print("Excluir user: ${email}");
    Database db = await _recuperarBancoDados();
    int retorno = await db.delete(
      "usuarios",
      where: "email = ?",
      whereArgs: [email],
    );
    print("Item excluido: ${retorno}");
    await db.close();
  }
}
