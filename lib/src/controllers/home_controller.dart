import 'package:flutter/material.dart';
import 'package:busca_cep/src/models/cep_model.dart';
import 'package:busca_cep/src/services/back4app_service.dart';
import 'package:busca_cep/src/services/viacep_service.dart';

class HomeController extends ChangeNotifier {
  final Back4AppService _back4AppService = Back4AppService();
  final ViaCEPService _viaCEPService = ViaCEPService();

  List<CEPModel> ceps = [];

  Future<void> consultarCEP(String cep) async {
    try {
      final cepData = await _viaCEPService.fetchCEP(cep);

      ceps.add(
        CEPModel(
          cep: cepData['cep'],
          logradouro: cepData['logradouro'],
          complemento: cepData['complemento'],
          bairro: cepData['bairro'],
          localidade: cepData['localidade'],
          uf: cepData['uf'],
          objectId: '',
        ),
      );

      notifyListeners();
      // ignore: empty_catches
    } catch (error) {}
  }

  Future<void> cadastrarCEP() async {
    try {
      await _back4AppService.cadastrarCEP(ceps.first as Map<String, dynamic>);

      notifyListeners();
      // ignore: empty_catches
    } catch (error) {}
  }

  Future<void> fetchCEP(String cep) async {}

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
