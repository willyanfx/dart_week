import 'package:backend/model/categoria_model.dart';
import 'package:backend/model/usuario_model.dart';

import '../backend.dart';

class MovimentacaoModel extends ManagedObject<_MovimentacaoModel>
    implements _MovimentacaoModel {}

@Table(name: 'movimentacao')
class _MovimentacaoModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Column()
  String descricao;

  @Column()
  double valor;

  @Column()
  DateTime dataMovimentacao;

  @Relate(#movimentacoes)
  UsuarioModel usuario;

  @Relate(#movimentacoes)
  CategoriaModel categoria;
}
