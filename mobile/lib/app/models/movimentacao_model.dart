import 'dart:convert';

import 'package:mobile/app/models/categoria_model.dart';

class MovimentacaoModel {
  int id;
  DateTime dataMovimentacao;
  String descricao;
  double valor;
  CategoriaModel categoria;

  MovimentacaoModel({
    this.id,
    this.dataMovimentacao,
    this.descricao,
    this.valor,
    this.categoria,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dataMovimentacao': dataMovimentacao.millisecondsSinceEpoch,
      'descricao': descricao,
      'valor': valor,
      'categoria': categoria.toMap(),
    };
  }

  static MovimentacaoModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MovimentacaoModel(
      id: map['id'],
      dataMovimentacao:
          DateTime.fromMillisecondsSinceEpoch(map['dataMovimentacao']),
      descricao: map['descricao'],
      valor: map['valor'],
      categoria: CategoriaModel.fromMap(map['categoria']),
    );
  }

  String toJson() => json.encode(toMap());

  static MovimentacaoModel fromJson(String source) =>
      fromMap(json.decode(source));
}
