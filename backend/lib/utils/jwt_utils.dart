import 'package:backend/model/usuario_model.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

class JwtUtils {
  static const String _JWTChavePrivada = 'Ch@v3Pr1v@d4';

  static String gerarTokenJWT(UsuarioModel usuario) {
    final claimSet = JwtClaim(
        issuer: 'http://localhost',
        subject: usuario.id.toString(),
        otherClaims: <String, dynamic>{},
        maxAge: const Duration(days: 1));

    final token = 'Bearer ${issueJwtHS256(claimSet, _JWTChavePrivada)}';

    return token;
  }

  static JwtClaim verificarToken(String token) {
    return verifyJwtHS256Signature(token, _JWTChavePrivada);
  }
}
