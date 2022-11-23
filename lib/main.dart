import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:getx_intro/value_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final textController = TextEditingController();

  final valueController = ValueController();

  @override
  Widget build(BuildContext context) {
    debugPrint('construiu');
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        //valor
        GetBuilder<ValueController>(
          init: valueController, //
          builder: (ctrl) {
            debugPrint('getx');
            return Text('Valor definido: ${ctrl.definedValue}');
          },
        ),

        //campo
        TextField(
          controller: textController,
        ),

        //botão
        GetBuilder<ValueController>(
          init: valueController,
          builder: (ctrl) {
            return ctrl.isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      String value = textController.text;

                      valueController.setValue(value);
                    },
                    child: const Text('Confirmar'),
                  );
          },
        ),
      ]),
    ));
  }
}
/*
control + shift + p
procurar: Preferences: configure language specific settings...
dart

executar flutter clean


*/