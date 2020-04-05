import 'package:mobile/app/core/store_state.dart';
import 'package:mobile/app/models/movimentacao_model.dart';
import 'package:mobile/app/repositories/movimentacoes_repository.dart';
import 'package:mobile/app/utils/store_utils.dart';
import 'package:mobx/mobx.dart';

import 'components/painel_saldo/painel_saldo_controller.dart';

part 'movimentacoes_controller.g.dart';

class MovimentacoesController = _MovimentacoesControllerBase
    with _$MovimentacoesController;

abstract class _MovimentacoesControllerBase with Store {
  final MovimentacoesRepository repository;
  final PainelSaldoController painelSaldoController;

  _MovimentacoesControllerBase(
    this.repository,
    this.painelSaldoController,
  );

  @observable
  String errorMessage;

  @observable
  ObservableFuture<List<MovimentacaoModel>> _movimentacoesFuture;

  @observable
  ObservableList<MovimentacaoModel> movimentacoes;

  @computed
  StoreState get movimentacoesState =>
      StoreUtils.statusCheck(_movimentacoesFuture);

  @action
  Future<void> buscarMovimentacoes() async {
    try {
      _movimentacoesFuture = ObservableFuture(
          repository.getMovimentacoes(painelSaldoController.anoMes));
      List<MovimentacaoModel> movimentacoesResultado =
          await _movimentacoesFuture;
      movimentacoes = movimentacoesResultado.asObservable();
    } catch (e) {
      errorMessage = 'Erro ao buscar movimentações';
      print(e);
    }
  }
}
