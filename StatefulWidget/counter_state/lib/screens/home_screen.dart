import 'package:counter_state/screens/config_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  void addCustomValue(int value) {
    setState(() {
      counter = value;
    });
  }

  void resetValue() {
    setState(() {
      counter = 0;
    });
  }

  Widget _buildIncrementButton() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          counter++;
        });
      },
      heroTag: "increment",
      tooltip: "Incrementar contador",
      child: const Icon(Icons.plus_one_rounded),
    );
  }

  Widget _buildDecrementButton() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          counter--;
        });
      },
      heroTag: "decrement",
      tooltip: "Decrementar contador",
      child: const Icon(Icons.exposure_minus_1_rounded),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Counter State"),
        leading: IconButton(
          onPressed: () {
            setState(() {
              counter = 0;
            });
          },
          icon: const Icon(Icons.refresh_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConfigScreen(
                    addCustomValue: addCustomValue,
                    resetValue: resetValue,
                    counter: counter,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "contador",
              style: TextStyle(fontSize: 40),
            ),
            Text(
              "$counter",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 90),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildIncrementButton(),
          const SizedBox(height: 10),
          _buildDecrementButton(),
        ],
      ),
    );
  }
}
