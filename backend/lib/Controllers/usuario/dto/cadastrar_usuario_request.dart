import 'package:backend/backend.dart';

class CadastrarUsuarioRequest extends Serializable {
  String login;
  String senha;

  @override
  Map<String, dynamic> asMap() {
    return {'login': login, 'senha': senha};
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    login = object['login'] as String;
    senha = object['senha'] as String;
  }

  Map<String, String> validate() {
    final Map<String, String> mapValidate = {};
    if (login == null || login.isEmpty) {
      mapValidate['login'] = 'login obrigatorio';
    }
    if (senha == null || senha.isEmpty) {
      mapValidate['senha'] = 'senha obrigatorio';
    }
    return mapValidate;
  }
}
