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
  late TextEditingController valueTextController;
  bool validate = true;
  int? previousValue;

  @override
  void initState() {
    super.initState();
    valueTextController =
        TextEditingController(text: widget.counter.toString());
    previousValue = widget.counter;
  }

  @override
  void dispose() {
    valueTextController.dispose();
    super.dispose();
  }

  void _resetCounter() {
    widget.resetValue();
    setState(() {
      valueTextController.text = "0";
      validate = true;
    });
  }

  void _updateCounter() {
    final value = int.tryParse(valueTextController.text);
    if (value == null) {
      setState(() {
        validate = false;
      });
      return;
    }
    widget.addCustomValue(value);
    setState(() {
      validate = true;
      previousValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Config counter"),
          actions: [
            IconButton(
              onPressed: _resetCounter,
              icon: const Icon(Icons.refresh_rounded),
            )
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    valueTextController.text.isNotEmpty && validate
                        ? valueTextController.text
                        : previousValue.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 100),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  TextField(
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
                  const SizedBox(
                    height: 40,
                  ),
                  FilledButton(
                    onPressed: _updateCounter,
                    child: const Text("Actualizar contador"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
