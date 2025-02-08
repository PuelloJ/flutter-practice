import 'package:flutter/material.dart';
import 'package:taskify/presentation/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseño Bento en Flutter',
      darkTheme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class BentoLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Primera fila
          Expanded(
            flex: 2, // Ocupa 2 partes de la fila
            child: Row(
              children: [
                Expanded(
                  flex: 2, // Ocupa 2 partes de la columna
                  child: BentoItem(
                    color: Colors.amber,
                    text: 'Sección 1',
                  ),
                ),
                Expanded(
                  flex: 1, // Ocupa 1 parte de la columna
                  child: BentoItem(
                    color: Colors.redAccent,
                    text: 'Sección 2',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10), // Espacio entre filas
          // Segunda fila
          Expanded(
            flex: 1, // Ocupa 1 parte de la fila
            child: Row(
              children: [
                Expanded(
                  flex: 1, // Ocupa 1 parte de la columna
                  child: BentoItem(
                    color: Colors.lightBlue,
                    text: 'Sección 3',
                  ),
                ),
                Expanded(
                  flex: 2, // Ocupa 2 partes de la columna
                  child: BentoItem(
                    color: Colors.lightGreen,
                    text: 'Sección 4',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10), // Espacio entre filas
          // Tercera fila
          Expanded(
            flex: 1, // Ocupa 1 parte de la fila
            child: BentoItem(
              color: Colors.purpleAccent,
              text: 'Sección 5',
            ),
          ),
        ],
      ),
    );
  }
}

class BentoItem extends StatelessWidget {
  final Color color;
  final String text;

  const BentoItem({
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4), // Espacio entre los módulos
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}