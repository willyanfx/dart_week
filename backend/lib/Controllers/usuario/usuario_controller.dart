import 'package:backend/backend.dart';
import 'package:backend/services/usuario_service.dart';

import 'dto/cadastrar_usuario_request.dart';

class UsuarioController extends ResourceController {
  UsuarioController(this.context) : usuarioService = UsuarioService(context);

  final ManagedContext context;
  final UsuarioService usuarioService;

  @Operation.post()
  Future<Response> salvar(@Bind.body() CadastrarUsuarioRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }

    try {
      await usuarioService.salvarUsuario(request);

      return Response.ok({'message': 'User cadastrado com sucesso'});
    } catch (e) {
      print(e);
      return Response.serverError(
          body: {'message': 'Error ao salvar user', 'exception': e.toString()});
    }
  }
}
