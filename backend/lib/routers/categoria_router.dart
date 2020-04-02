import 'package:backend/Controllers/categorias/categorias_controller.dart';
import 'package:backend/config/jwt_authentication.dart';

import '../backend.dart';

class CategoriaRouter {
  static void configurar(Router router, ManagedContext context) {
    router
        .route('/categorias/:tipo')
        .link(() => JwtAuthentication(context))
        .link(() => CategoriasController(context));
  }
}
