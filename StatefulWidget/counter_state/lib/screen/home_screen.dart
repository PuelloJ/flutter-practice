import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

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
                style: const TextStyle(fontSize: 90),
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              child: const Icon(Icons.plus_one_rounded),
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  counter--;
                });
              },
              child: const Icon(Icons.exposure_minus_1_rounded),
            ),
          ],
        ));
  }
}
