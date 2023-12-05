import 'package:busca_cep/src/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await Parse().initialize(
    keyApplicationId,
    keyParseServerUrl,
    clientKey: keyClientKey,
    autoSendSessionId: true,
  );

  runApp(const BuscaCep());
}

class BuscaCep extends StatelessWidget {
  const BuscaCep({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busca Cep',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}
