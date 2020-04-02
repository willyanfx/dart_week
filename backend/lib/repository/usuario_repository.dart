import 'package:backend/Controllers/usuario/dto/cadastrar_usuario_request.dart';
import 'package:backend/backend.dart';
import 'package:backend/model/usuario_model.dart';
import 'package:backend/utils/criptografia_util.dart';

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

  Future<void> salvarUsuario(CadastrarUsuarioRequest request) async {
    final usuarioSave = UsuarioModel()..read(request.asMap());
    usuarioSave.senha = CriptografiaUtils.criptografarSenha(request.senha);

    await context.insertObject(usuarioSave);
  }

  Future<UsuarioModel> buscarPorId(int id) async {
    final query = Query<UsuarioModel>(context)
      ..where((usuario) => usuario.id).equalTo(id);

    return await query.fetchOne();
  }
}
