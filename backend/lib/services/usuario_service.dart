import 'dart:convert';
import 'package:backend/Controllers/login/dto/login_request.dart';
import 'package:backend/Controllers/usuario/dto/cadastrar_usuario_request.dart';
import 'package:backend/model/usuario_model.dart';
import 'package:backend/utils/criptografia_util.dart';
import 'package:backend/utils/jwt_utils.dart';
import 'package:crypto/crypto.dart';

import 'package:backend/repository/usuario_repository.dart';

import '../backend.dart';

class UsuarioService {
  UsuarioService(this.context) : usuarioRepository = UsuarioRepository(context);

  final ManagedContext context;
  final UsuarioRepository usuarioRepository;

  Future<String> login(LoginRequest request) async {
    final String login = request.login;
    final String senha = request.senha;

    final String senhaCriptografada =
        CriptografiaUtils.criptografarSenha(senha);

    final usuario = await usuarioRepository.recuperarUsuarioPorLoginESenha(
        login, senhaCriptografada);

    if (usuario != null) {
      return JwtUtils.gerarTokenJWT(usuario);
    }

    return null;
  }

  Future<void> salvarUsuario(CadastrarUsuarioRequest request) async {
    return await usuarioRepository.salvarUsuario(request);
  }

  Future<UsuarioModel> buscarPorId(int id) async {
    return await usuarioRepository.buscarPorId(id);
  }
}
