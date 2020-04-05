import 'package:mobile/app/modules/movimentacoes/components/painel_saldo/painel_saldo_controller.dart';
import 'package:mobile/app/modules/movimentacoes/movimentacoes_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile/app/modules/movimentacoes/movimentacoes_page.dart';
import 'package:mobile/app/repositories/categorias_repository.dart';
import 'package:mobile/app/repositories/movimentacoes_repository.dart';

import 'components/cadastrar_movimentacao/cadastrar_movimentacao_controller.dart';

class MovimentacoesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CadastrarMovimentacaoController()),
        Bind((i) => PainelSaldoController(i.get<MovimentacoesRepository>())),
        Bind((i) => MovimentacoesRepository()),
        Bind((i) => CategoriaRepository()),
        Bind((i) => MovimentacoesController(
            i.get<MovimentacoesRepository>(), i.get<PainelSaldoController>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MovimentacoesPage()),
      ];

  static Inject get to => Inject<MovimentacoesModule>.of();
}
