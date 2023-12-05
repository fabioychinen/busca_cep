class CEPModel {
  String objectId;
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;

  CEPModel({
    required this.objectId,
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
  });

  factory CEPModel.fromJson(Map<String, dynamic> json) {
    return CEPModel(
      objectId: json['objectId'],
      cep: json['cep'],
      logradouro: json['logradouro'],
      complemento: json['complemento'],
      bairro: json['bairro'],
      localidade: json['localidade'],
      uf: json['uf'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'objectId': objectId,
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
    };
  }
}
