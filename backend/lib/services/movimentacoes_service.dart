import 'package:backend/Controllers/movimentacoes/dto/salvar_movimentacao_request.dart';
import 'package:backend/model/categoria_model.dart';
import 'package:backend/model/movimentacao_model.dart';
import 'package:backend/model/usuario_model.dart';
import 'package:backend/repository/movimentacoes_repository.dart';

import '../backend.dart';

class MovimentacoesService {
  MovimentacoesService(this.context)
      : repository = MovimentacoesRepository(context);

  final ManagedContext context;
  final MovimentacoesRepository repository;

  Future<List<MovimentacaoModel>> buscarMovimantacoes(
      UsuarioModel usuario, String anoMes) {
    return repository.buscarMovimentacoes(usuario, anoMes);
  }

  Future<Map<String, dynamic>> recuperarTotalMovimentacaoPorTipo(
      UsuarioModel usuario, String anoMes) async {
    final receitas = await repository.recuperarTotalMesAno(
        usuario, TipoCategoria.receita, anoMes);
    final despesas = await repository.recuperarTotalMesAno(
        usuario, TipoCategoria.despesa, anoMes);

    return {
      'receitas': receitas,
      'despesas': despesas,
      'total': (receitas['total'] ?? 0) + (despesas['total'] ?? 0),
      'saldo': (receitas['total'] ?? 0) + (despesas['total'] * -1 ?? 0)
    };
  }

  Future<void> salvarMovimentacao(
      UsuarioModel usuario, SalvaMovimentacaoRequest request) async {
    return await repository.salvarMovimentacao(usuario, request);
  }
}
