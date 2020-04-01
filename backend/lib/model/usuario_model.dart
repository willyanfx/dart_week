import 'package:backend/backend.dart';
import 'movimentacao_model.dart';

class UsuarioModel extends ManagedObject<_UsuarioModel>
    implements _UsuarioModel {}

@Table(name: 'usuario')
class _UsuarioModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Column(unique: true)
  String login;

  @Column()
  String senha;

  ManagedSet<MovimentacaoModel> movimentacoes;
}
