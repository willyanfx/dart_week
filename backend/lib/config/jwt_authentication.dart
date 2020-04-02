import 'package:backend/services/usuario_service.dart';
import 'package:backend/utils/jwt_utils.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

import '../backend.dart';

class JwtAuthentication extends Controller {
  JwtAuthentication(this.context) : service = UsuarioService(context);

  final ManagedContext context;
  final UsuarioService service;

  @override
  FutureOr<RequestOrResponse> handle(Request request) async {
    final authHeader = request.raw.headers['authorization'];

    if (authHeader == null || authHeader.isEmpty) {
      return Response.unauthorized();
    }

    final authHeaderContent = authHeader[0]?.split(' ');
    if (authHeaderContent.length != 2 || authHeaderContent[0] != 'Bearer') {
      return Response.badRequest(body: {'message': 'token invalido'});
    }

    try {
      final token = authHeaderContent[1];
      final JwtClaim claimSet = JwtUtils.verificarToken(token);
      final userId = int.tryParse(claimSet.toJson()['sub'].toString());

      if (userId == null) {
        throw JwtException;
      }

      final dataAtual = DateTime.now().toUtc();
      if (dataAtual.isAfter(claimSet.expiry)) {
        return Response.unauthorized();
      }

      final usuario = await service.buscarPorId(userId);
      request.attachments['user'] = usuario;

      return request;
    } on JwtException catch (e) {
      print(e);
      return Response.unauthorized();
    }
  }
}
