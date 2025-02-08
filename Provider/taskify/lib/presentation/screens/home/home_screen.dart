import 'package:flutter/material.dart';
import 'package:taskify/presentation/widgets/card_task.dart';
import 'package:taskify/presentation/widgets/card_task_category.dart';

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
            width: 20.0,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Text(
              'Manage Your Task 📝',
              style: textStyle.displayLarge,
            ),
            Expanded(
              flex: 2,
              child: Row(
                spacing: 16,
                children: [
                  Expanded(
                    flex: 2,
                    child: ItemTaskCategorySection(
                      color: Colors.blueAccent.shade100,
                      title: 'Garden Task',
                      subtitle: '20 task',
                      imagePath: 'assets/images/seed.png',
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      spacing: 16,
                      children: [
                        Expanded(
                          child: ItemTaskCategorySection(
                            color: Colors.deepOrangeAccent,
                            title: 'Home Task',
                            subtitle: '15 task',
                            imagePath: 'assets/images/plant.png',
                            isHorizontal: true,
                          ),
                        ),
                        Expanded(
                          child: ItemTaskCategorySection(
                            color: Colors.greenAccent.shade200,
                            title: 'Office Task',
                            subtitle: '20 task',
                            imagePath: 'assets/images/fence.png',
                            isHorizontal: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ongoing',
                  style: textStyle.titleLarge,
                ),
                TextButton(onPressed: () {}, child: Text('See all'))
              ],
            ),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    BuildTaskCard(
                      title: "Salon App Wireframe",
                      time: "10:00 AM - 06:00 PM",
                      progress: 82,
                      priority: "High",
                      priorityColor: Colors.red,
                      dueDate: "August 25",
                      avatars: ["assets/avatar1.png", "assets/avatar2.png"],
                    ),
                    BuildTaskCard(
                      title: "Marketing Website",
                      time: "02:00 PM - 05:00 PM",
                      progress: 64,
                      priority: "Medium",
                      priorityColor: Colors.orange,
                      dueDate: "August 30",
                      avatars: ["assets/avatar3.png", "assets/avatar4.png"],
                    ),
                    BuildTaskCard(
                      title: "Marketing Website",
                      time: "02:00 PM - 05:00 PM",
                      progress: 64,
                      priority: "Medium",
                      priorityColor: Colors.orange,
                      dueDate: "August 30",
                      avatars: ["assets/avatar3.png", "assets/avatar4.png"],
                    ),
                    BuildTaskCard(
                      title: "Marketing Website",
                      time: "02:00 PM - 05:00 PM",
                      progress: 64,
                      priority: "Medium",
                      priorityColor: Colors.orange,
                      dueDate: "August 30",
                      avatars: ["assets/avatar3.png", "assets/avatar4.png"],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_sharp),
      ),
    );
  }
}
