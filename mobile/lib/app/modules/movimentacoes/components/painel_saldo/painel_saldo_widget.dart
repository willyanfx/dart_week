import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile/app/modules/movimentacoes/components/painel_saldo/painel_saldo_controller.dart';
import 'package:mobile/app/utils/size_utils.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PainelSaldoWidget extends StatefulWidget {
  final double appBarHeight;

  const PainelSaldoWidget({Key key, this.appBarHeight}) : super(key: key);

  @override
  _PainelSaldoWidgetState createState() => _PainelSaldoWidgetState();
}

class _PainelSaldoWidgetState
    extends ModularState<PainelSaldoWidget, PainelSaldoController> {
  @override
  Widget build(BuildContext context) {
    return SlidingSheet(
        elevation: 16,
        shadowColor: Color.fromRGBO(0, 0, 0, 0.2),
        cornerRadius: 30,
        snapSpec: SnapSpec(
            snap: true,
            snappings: [0.1, 0.4],
            positioning: SnapPositioning.relativeToAvailableSpace),
        headerBuilder: (_, state) {
          return Container(
            width: 60,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.black45, borderRadius: BorderRadius.circular(20)),
          );
        },
        builder: (_, state) {
          return _makeContent();
        });
  }

  Widget _makeContent() {
    return Container(
        width: SizeUtils.widthScreen,
        height: SizeUtils.heightScreen * .4 - widget.appBarHeight,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.arrow_back_ios)),
                    Text(
                      'janeiro 2020',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    IconButton(icon: Icon(Icons.arrow_forward_ios))
                  ]),
              SizedBox(height: 60),
              Column(children: <Widget>[
                Text('Saldo'),
                Text(
                  'R\$ 3000',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ]),
              Expanded(child: Container()),
              Container(
                  margin: EdgeInsets.only(bottom: 30),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: CircleAvatar(
                                backgroundColor: Colors.amber,
                                foregroundColor: Colors.white,
                                child: Icon(Icons.arrow_upward),
                              )),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Receitas',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.green),
                                ),
                                Text(
                                  'R\$ 4000',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.green),
                                )
                              ])
                        ]),
                        Row(children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: CircleAvatar(
                                backgroundColor: Colors.amber,
                                foregroundColor: Colors.white,
                                child: Icon(Icons.arrow_upward),
                              )),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Despesas',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.red),
                                ),
                                Text(
                                  'R\$ 4000',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.red),
                                )
                              ])
                        ])
                      ]))
            ]));
  }
}
