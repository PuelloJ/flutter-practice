import 'package:flutter/material.dart';

class BuildTaskCard extends StatelessWidget {
  const BuildTaskCard({
    super.key,
    required this.title,
    required this.time,
    required this.progress,
    required this.priority,
    required this.priorityColor,
    required this.dueDate,
    required this.avatars,
  });

  final String title;
  final String time;
  final int progress;
  final String priority;
  final Color priorityColor;
  final String dueDate;
  final List<String> avatars;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Prioridad y progreso
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: priorityColor.withAlpha(20),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(priority, style: TextStyle(color: priorityColor, fontSize: 12)),
              ),
              Text("$progress%", style: const TextStyle(color: Colors.white)),
            ],
          ),
          const SizedBox(height: 10),
          // Título
          Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          // Hora
          Row(
            children: [
              const Icon(Icons.access_time, color: Colors.white70, size: 14),
              const SizedBox(width: 5),
              Text(time, style: const TextStyle(color: Colors.white70)),
            ],
          ),
          const SizedBox(height: 10),
          // Fecha de entrega y avatares
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Due Date: $dueDate",
                  style: const TextStyle(color: Colors.amber)),
              Row(
                children: avatars
                    .map((avatar) => Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(avatar),
                            radius: 12,
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
