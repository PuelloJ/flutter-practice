import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Font Style
    final TextTheme textStyle = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello 👋'),
        actions: [
          IconButton.filledTonal(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          spacing: 16,
          children: [
            Flexible(
              flex: 1,
              child: Text(
                'Manage Your Daily Tas 📝',
                style: textStyle.titleLarge!.copyWith(fontSize: 50),
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: _ItemTaskCategorySection(
                      color: Colors.blueAccent,
                      title: 'task one',
                      subtitle: 'Subtitle task',
                      imagePath: 'assets/images/seed.png',
                    ),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 16,
                      children: [
                        Expanded(
                          child: _ItemTaskCategorySection(
                            color: Colors.blueAccent,
                            title: 'task one',
                            subtitle: 'Subtitle task',
                            imagePath: 'assets/images/seed.png',
                          ),
                        ),
                        Expanded(
                          child: _ItemTaskCategorySection(
                            color: Colors.blueAccent,
                            title: 'task one',
                            subtitle: 'Subtitle task',
                            imagePath: 'assets/images/seed.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
                flex: 2,
                child: Column(
                  children: [
                    _BuildTaskCard(
                      title: "Salon App Wireframe",
                      time: "10:00 AM - 06:00 PM",
                      progress: 82,
                      priority: "High",
                      priorityColor: Colors.red,
                      dueDate: "August 25",
                      avatars: ["assets/avatar1.png", "assets/avatar2.png"],
                    ),
                    _BuildTaskCard(
                      title: "Marketing Website",
                      time: "02:00 PM - 05:00 PM",
                      progress: 64,
                      priority: "Medium",
                      priorityColor: Colors.orange,
                      dueDate: "August 30",
                      avatars: ["assets/avatar3.png", "assets/avatar4.png"],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class _ItemTaskCategorySection extends StatelessWidget {
  const _ItemTaskCategorySection({
    required this.color,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  final Color color;
  final String title;
  final String subtitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Image.asset(imagePath)),
            Column(
              spacing: 5,
              children: [
                Text(
                  title,
                  style: textTheme.titleLarge,
                ),
                Text(
                  subtitle,
                  style: textTheme.bodyMedium,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _BuildTaskCard extends StatelessWidget {
  const _BuildTaskCard({
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
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Prioridad y progreso
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: priorityColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(priority,
                    style: TextStyle(color: priorityColor, fontSize: 12)),
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
