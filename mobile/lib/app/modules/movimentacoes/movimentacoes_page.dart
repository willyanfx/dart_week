import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile/app/modules/movimentacoes/components/movimentacao_item.dart';
import 'package:mobile/app/modules/movimentacoes/components/painel_saldo/painel_saldo_widget.dart';
import 'package:mobile/app/utils/size_utils.dart';
import 'movimentacoes_controller.dart';

class MovimentacoesPage extends StatefulWidget {
  final String title;
  const MovimentacoesPage({Key key, this.title = "Movimentacoes"})
      : super(key: key);

  @override
  _MovimentacoesPageState createState() => _MovimentacoesPageState();
}

class _MovimentacoesPageState
    extends ModularState<MovimentacoesPage, MovimentacoesController> {
  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text(widget.title),
      centerTitle: true,
      actions: <Widget>[
        PopupMenuButton<String>(
          icon: Icon(Icons.add),
          itemBuilder: (_) {
            return [
              PopupMenuItem(child: Text('Receita'), value: 'receita'),
              PopupMenuItem(child: Text('Despesa'), value: 'despesa')
            ];
          },
        ),
        IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {})
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: Container(
          height: SizeUtils.heightScreen,
          child: Stack(
            children: <Widget>[
              _makeContent(),
              PainelSaldoWidget(
                appBarHeight: appBar.preferredSize.height,
              )
            ],
          )),
    );
  }

  _makeContent() {
    return Column(children: <Widget>[
      Expanded(
          child: ListView.separated(
              itemBuilder: (_, index) => MovimentacaoItem(),
              separatorBuilder: (_, index) => Divider(color: Colors.black45),
              itemCount: 10)),
      SizedBox(
        height: (SizeUtils.heightScreen * .08),
      )
    ]);
  }
}
