import 'package:backend/routers/categoria_router.dart';
import 'package:backend/routers/movimentacoes_router.dart';
import 'package:backend/routers/usuario_router.dart';

import 'backend.dart';
import 'package:backend/model/usuario_model.dart';
import 'package:backend/model/categoria_model.dart';
import 'package:backend/model/movimentacao_model.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class BackendChannel extends ApplicationChannel {
  ManagedContext context;

  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final config = BackendConfiguration(options.configurationFilePath);
    context = contextWithConnectionInfo(config.database);
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    UsuarioRouter.configurar(router, context);
    CategoriaRouter.configurar(router, context);
    MovimentacoesRouter.configurar(router, context);

    return router;
  }

  /*
   * Helper methods
   */

  ManagedContext contextWithConnectionInfo(
      DatabaseConfiguration connectionInfo) {
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final psc = PostgreSQLPersistentStore(
        connectionInfo.username,
        connectionInfo.password,
        connectionInfo.host,
        connectionInfo.port,
        connectionInfo.databaseName);

    return ManagedContext(dataModel, psc);
  }
}

/// An instance of this class reads values from a configuration
/// file specific to this application.
///
/// Configuration files must have key-value for the properties in this class.
/// For more documentation on configuration files, see https://aqueduct.io/docs/configure/ and
/// https://pub.dartlang.org/packages/safe_config.
class BackendConfiguration extends Configuration {
  BackendConfiguration(String fileName) : super.fromFile(File(fileName));

  DatabaseConfiguration database;
}
