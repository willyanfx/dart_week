import 'package:backend/Controllers/login/login_controller.dart';
import 'package:backend/Controllers/usuario/usuario_controller.dart';
import 'package:backend/backend.dart';

class UsuarioRouter {
  static void configurar(Router router, ManagedContext context) {
    router.route('/login').link(() => LoginController(context));
    router.route('/usuario').link(() => UsuarioController(context));
  }
}
