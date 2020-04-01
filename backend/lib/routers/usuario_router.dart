import 'package:backend/Controllers/login_controller.dart';
import 'package:backend/backend.dart';

class UsuarioRouter {
  static void configurar(Router router, ManagedContext context) {
    router.route('/login').link(() => LoginController(context));
  }
}
