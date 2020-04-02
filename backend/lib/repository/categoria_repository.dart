import 'package:backend/backend.dart';
import 'package:backend/model/categoria_model.dart';

class CategoriaResposity {
  CategoriaResposity(this.context);
  final ManagedContext context;

  Future<List<CategoriaModel>> buscarCategoriaPorTipo(
      TipoCategoria tipoCategoria) {
    final query = Query<CategoriaModel>(context)
      ..where((c) => c.tipoCategoria).equalTo(tipoCategoria);

    return query.fetch();
  }

  Future<CategoriaModel> buscarPorId(int id) {
    final query = Query<CategoriaModel>(context)
      ..where((c) => c.id).equalTo(id);

    return query.fetchOne();
  }
}
