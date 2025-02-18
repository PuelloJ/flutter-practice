import 'package:flutter/material.dart';
import '../../../core/constants/task_priority.dart';

class CustomSegmentedButton extends StatefulWidget {
  const CustomSegmentedButton({super.key});

  @override
  State<CustomSegmentedButton> createState() => _CustomSegmentedButtonState();
}

class _CustomSegmentedButtonState extends State<CustomSegmentedButton> {
  TaskPriority taskPriority = TaskPriority.low;
  final List<Color> colors = [
    Colors.blueAccent,
    Colors.orange,
    Colors.redAccent
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SegmentedButton<TaskPriority>(
      expandedInsets: EdgeInsets.all(0),
      
      showSelectedIcon: false,
      style: SegmentedButton.styleFrom(
        iconColor: Colors.black87,
        foregroundColor: Colors.black87,
        selectedBackgroundColor: colors.surface,
        selectedForegroundColor: Colors.amber,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        // side: BorderSide(color: Colors.transparent),
      ),
      segments: const <ButtonSegment<TaskPriority>>[
        ButtonSegment<TaskPriority>(
          value: TaskPriority.low,
          label: Text('Low'),
        ),
        ButtonSegment<TaskPriority>(
          value: TaskPriority.medium,
          label: Text('Medium'),
        ),
        ButtonSegment<TaskPriority>(
          value: TaskPriority.high,
          label: Text('High'),
        ),
      ],
      selected: <TaskPriority>{taskPriority},
      onSelectionChanged: (Set<TaskPriority> newSelection) {
        setState(() {
          taskPriority = newSelection.first;
        });
      },
    );
  }
}