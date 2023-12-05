import 'package:flutter/material.dart';
import 'package:busca_cep/src/controllers/home_controller.dart';

class ListPage extends StatelessWidget {
  final HomeController controller = HomeController();

  ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de CEPs Cadastrados'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.ceps.length,
                itemBuilder: (context, index) {
                  final cep = controller.ceps[index];
                  return ListTile(
                    title: Text('CEP: ${cep.cep}'),
                    subtitle: Text('Logradouro: ${cep.logradouro}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
