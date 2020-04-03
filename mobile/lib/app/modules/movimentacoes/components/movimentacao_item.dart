import 'package:flutter/material.dart';

class MovimentacaoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('23/12/2020'),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
              backgroundColor: Colors.amber,
              child: Icon(Icons.money_off, color: Colors.white)),
          title: Text('Conta de Luz'),
          subtitle: Text('Despesa casa'),
          trailing: Container(
            padding: EdgeInsets.only(right: 10),
            child: Text('R\$ 200', style: TextStyle(color: Colors.red)),
          ),
        ),
      )
    ]);
  }
}
