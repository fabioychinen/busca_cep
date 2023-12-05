import 'package:busca_cep/src/view/list_page.dart';
import 'package:flutter/material.dart';
import 'package:busca_cep/src/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  final HomeController controller = HomeController();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _cepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta e Cadastro de CEPs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _cepController,
              decoration: const InputDecoration(labelText: 'CEP'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                widget.controller.consultarCEP(_cepController.text);
              },
              child: const Text('Consultar CEP'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                widget.controller.cadastrarCEP();
              },
              child: const Text('Cadastrar CEP'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPage()),
                );
              },
              child: const Text('Ver Lista de CEPs'),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: widget.controller.ceps.length,
                itemBuilder: (context, index) {
                  final cep = widget.controller.ceps[index];
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
