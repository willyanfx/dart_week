import 'package:backend/model/categoria_model.dart';
import 'package:backend/services/categoria_service.dart';

import '../../backend.dart';

class CategoriasController extends ResourceController {
  CategoriasController(this.context) : service = CategoriaService(context);
  final ManagedContext context;
  final CategoriaService service;

  @Operation.get('tipo')
  Future<Response> buscarCategoriasPorTipo() async {
    try {
      final tipo = request.path.variables['tipo'];
      final tipoCategoria = TipoCategoria.values
          .firstWhere((t) => t.toString().split('.').last == tipo);
      return service
          .buscarCategoriaPorTipo(tipoCategoria)
          .then((res) => res.map((c) => {'id': c.id, 'nome': c.nome}).toList())
          .then((date) => Response.ok(date));
    } catch (e) {
      print(e);
      return Response.serverError(body: {'message': e.toString()});
    }
  }
}
