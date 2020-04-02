import 'package:backend/model/categoria_model.dart';
import 'package:backend/repository/categoria_repository.dart';

import '../backend.dart';

class CategoriaService {
  CategoriaService(this.context) : repository = CategoriaResposity(context);

  final ManagedContext context;
  final CategoriaResposity repository;

  Future<List<CategoriaModel>> buscarCategoriaPorTipo(TipoCategoria tipo) {
    return repository.buscarCategoriaPorTipo(tipo);
  }
}
