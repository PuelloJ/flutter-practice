import 'package:flutter/material.dart';

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({
    super.key,
    required this.addCustomValue,
    required this.resetValue,
    required this.counter,
  });

  final void Function(int) addCustomValue;
  final void Function() resetValue;
  final int counter;

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  final TextEditingController valueTextController = TextEditingController();
  bool validate = true;
  int? counterTem;

  @override
  void dispose() {
    valueTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    counterTem = widget.counter;
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Config counter"),
          actions: [
            IconButton(
              onPressed: () {
                // if (!validate) return;
                widget.resetValue();
                setState(() {
                  valueTextController.text = "0";
                  validate = true;
                });
                print(valueTextController.text);
              },
              icon: const Icon(Icons.refresh_rounded),
            )
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  valueTextController.text.isNotEmpty && validate
                      ? valueTextController.text
                      : counterTem.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 100),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: valueTextController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: const Text("Valor personalizado"),
                      errorText: !validate
                          ? "Ingrese solo caracteres numericos enteros"
                          : null,
                      hintText: "0",
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                FilledButton(
                    onPressed: () {
                      int? valueParse = int.tryParse(valueTextController.text);
                      validate = valueParse != null && !valueParse.isNaN;
                      if (validate) {
                        widget.addCustomValue(valueParse!);
                        counterTem = valueParse;
                      }

                      setState(() {});
                    },
                    child: const Text("ACEPTAR")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
