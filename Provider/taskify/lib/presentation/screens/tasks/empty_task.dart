import 'package:flutter/material.dart';
import 'package:taskify/presentation/presentation.dart';

class EmpityTask extends StatelessWidget {
  const EmpityTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 30,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Animación o imagen ilustrativa
        // Image.asset(
        //   'assets/images/add_task.png', // Usa una animación Lottie
        //   fit: BoxFit.cover,
        // ),

        Icon(
          Icons.add_task_rounded,
          size: 70,
        ),

        Column(
          children: [
            const Text(
              "¡Nada por hacer!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
            const Text(
              "Empieza agregando tu primera tarea 🎯",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white60,
              ),
            ),
          ],
        ),

        // Botón para agregar tareas
        TextButton(
          onPressed: () => showModalBottomSheet(
            backgroundColor: Colors.amber,
            context: context,
            isScrollControlled: true,
            // useSafeArea: true,
            builder: (context) => BuildFormTaskSection(),
          ),
          // icon: const Icon(Icons.add, size: 24),
          child: const Text("Agregar tarea"),
        ),
      ],
    );
  }
}
