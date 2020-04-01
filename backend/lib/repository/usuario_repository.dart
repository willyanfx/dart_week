import 'package:backend/backend.dart';
import 'package:backend/model/usuario_model.dart';

class UsuarioRepository {
  UsuarioRepository(this.context);
  final ManagedContext context;

  Future<UsuarioModel> recuperarUsuarioPorLoginESenha(
      String login, String senha) {
    final query = Query<UsuarioModel>(context)
      ..where((usuario) => usuario.login).equalTo(login)
      ..where((usuario) => usuario.senha).equalTo(senha);

    return query.fetchOne();
  }
}
