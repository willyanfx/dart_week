import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'package:backend/Controllers/login/login_request.dart';
import 'package:backend/repository/usuario_repository.dart';

import '../backend.dart';

class UsuarioService {
  UsuarioService(this.context) : usuarioRepository = UsuarioRepository(context);

  final ManagedContext context;
  final UsuarioRepository usuarioRepository;

  Future<String> login(LoginRequest request) async {
    final String login = request.login;
    final String senha = request.senha;

    final senhaBytes = utf8.encode(senha);
    final String senhaCriptografada = sha256.convert(senhaBytes).toString();

    final usuario = await usuarioRepository.recuperarUsuarioPorLoginESenha(
        login, senhaCriptografada);

    return usuario?.login;
  }
}
