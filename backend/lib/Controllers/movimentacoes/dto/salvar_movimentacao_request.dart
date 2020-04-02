import 'package:backend/backend.dart';

class SalvaMovimentacaoRequest extends Serializable {
  int categoria;
  String descricao;
  double valor;
  DateTime dataMovimentacao;

  @override
  Map<String, dynamic> asMap() {
    return {
      'categoria': categoria,
      'descricao': descricao,
      'dataMovimentacao': dataMovimentacao,
      'valor': valor
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    categoria = object['categoria'] as int;
    descricao = object['descricao'] as String;
    final dataMovimentacaoStr = object['dataMovimentacao'] as String;
    dataMovimentacao = dataMovimentacaoStr != null
        ? DateTime.parse(dataMovimentacaoStr)
        : null;
    valor = object['valor'] as double;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};

    if (categoria == null) {
      validateResult['categoria'] = 'Categoria nao informada';
    }
    if (valor == null) {
      validateResult['valor'] = 'Valor nao informado';
    }
    if (dataMovimentacao == null) {
      validateResult['dataMovimentacao'] = 'Data da Movimentacao nao informada';
    }

    return validateResult;
  }
}
