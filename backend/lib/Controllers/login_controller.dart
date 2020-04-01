import 'package:backend/Controllers/login/login_request.dart';
import 'package:backend/services/usuario_service.dart';
import '../backend.dart';

class LoginController extends ResourceController {
  LoginController(this.context) : usuarioService = UsuarioService(context);
  final ManagedContext context;
  final UsuarioService usuarioService;

  @Operation.post()
  Future<Response> login(@Bind.body() LoginRequest request) async {
    print(request.asMap());

    final token = await usuarioService.login(request);
    return Response.ok({'auth': token != null, 'token': token});
  }
}
