import 'package:flutter/material.dart';
import 'package:taskify/core/constants/task_priority.dart';
import 'package:taskify/presentation/presentation.dart';

class BuildFormTaskSection extends StatefulWidget {
  const BuildFormTaskSection({
    super.key,
  });

  @override
  State<BuildFormTaskSection> createState() => _BuildFormTaskSectionState();
}

class _BuildFormTaskSectionState extends State<BuildFormTaskSection> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  Future<void> _selectStartDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      helpText: 'Enter start date',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
    );
    if (picked != null) {
      _startDateController.text = picked.toString().split(' ')[0];
    }
  }

  Future<void> _selectEndDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      helpText: 'Select end date',
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
    );
    if (picked != null) {
      _endDateController.text = picked.toString().split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    final textInputTitle =
        TextTheme.of(context).displayLarge!.copyWith(color: Colors.black87);
    final textInput =
        TextTheme.of(context).bodyLarge!.copyWith(color: Colors.black87);

    return SizedBox(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            Column(
              spacing: 30,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton.filledTonal(
                        onPressed: () => Navigator.pop(context),
                        color: Colors.amber,
                        iconSize: 30,
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                        ),
                      ),
                      IconButton.filledTonal(
                        color: Colors.amber,
                        iconSize: 30,
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_horiz_outlined,
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Text(
                      'Title',
                      style: TextStyle(color: Colors.black),
                    ),
                    CustomTextFormField(
                      hint: 'Task Planner Mobile Apps',
                      maxLine: 2,
                      style: textInputTitle,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(color: Colors.black),
                    ),
                    CustomTextFormField(
                      hint:
                          'Task Planner apps for mobile devices that help you manage your daily tasks. It is a simple and easy-to-use app that helps you manage your tasks effectively. It is a simple and easy-to-use app that helps you manage your tasks effectively.',
                      maxLine: 3,
                      style: textInput,
                    ),
                  ],
                ),
                Row(
                  spacing: 20,
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: _startDateController,
                        hint: 'Start Date',
                        keyboardType: TextInputType.datetime,
                        readOnly: true,
                        selectDate: _selectStartDate,
                        style: textInput,
                        suffixIcon: Icon(Icons.calendar_month_outlined),
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        controller: _endDateController,
                        hint: 'End Date',
                        keyboardType: TextInputType.datetime,
                        readOnly: true,
                        selectDate: _selectEndDate,
                        style: textInput,
                        suffixIcon: Icon(Icons.calendar_month_outlined),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Text(
                      'Task priority',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SingleChoice(),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: ElevatedButton.icon(
                onPressed: () {},
                label: Text('Guardar Tarea'),
                icon: Icon(Icons.save_outlined),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  TaskPriority taskPriority = TaskPriority.low;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<TaskPriority>(
      expandedInsets: EdgeInsets.all(0),
      style: SegmentedButton.styleFrom(
        iconColor: Colors.black87,
        foregroundColor:  Colors.black87,
        selectedBackgroundColor: Colors.transparent,
        selectedForegroundColor: Colors.black87,
      ),
      segments: const <ButtonSegment<TaskPriority>>[
        ButtonSegment<TaskPriority>(
          value: TaskPriority.low,
          label: Text('Low'),
          icon: Icon(Icons.low_priority_rounded, color: Colors.green,),
        ),
        ButtonSegment<TaskPriority>(
          value: TaskPriority.medium,
          label: Text('Medium'),
          icon: Icon(Icons.my_library_add_outlined, color: Colors.blueAccent,),
        ),
        ButtonSegment<TaskPriority>(
          value: TaskPriority.high,
          label: Text('High'),
          icon: Icon(Icons.priority_high_rounded, color: Colors.redAccent,),
        ),
      ],
      selected: <TaskPriority>{taskPriority},
      onSelectionChanged: (Set<TaskPriority> newSelection) {
        setState(() {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          taskPriority = newSelection.first;
        });
      },
    );
  }
}
