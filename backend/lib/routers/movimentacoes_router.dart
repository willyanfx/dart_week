import 'package:backend/Controllers/movimentacoes/movimentacoes_controller.dart';
import 'package:backend/config/jwt_authentication.dart';
import '../backend.dart';

class MovimentacoesRouter {
  static void configurar(Router router, ManagedContext context) {
    router
        .route('/movimentacoes/:anoMes')
        .link(() => JwtAuthentication(context))
        .link(() => MovimentacoesController(context));

    router
        .route('/movimentacoes/total/:totalAnoMes')
        .link(() => JwtAuthentication(context))
        .link(() => MovimentacoesController(context));

    router
        .route('/movimentacoes/')
        .link(() => JwtAuthentication(context))
        .link(() => MovimentacoesController(context));
  }
}
