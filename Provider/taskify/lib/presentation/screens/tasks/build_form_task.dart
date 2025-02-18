import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:taskify/core/constants/taskify_copys.dart';
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
    final TextStyle textInputTitle =
        TextTheme.of(context).displayLarge!.copyWith(color: Colors.black87);
    final TextStyle textInput =
        TextTheme.of(context).bodyLarge!.copyWith(color: Colors.black87);

    return Padding(
      padding: EdgeInsets.all(20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            spacing: 20,
            children: [
              const SizedBox(),
              Row(
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
              Form(
                key: _formKey,
                child: Column(
                  spacing: 30,
                  children: [
                    // * Form field Title
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        Text(
                          TaskifyCopys.title,
                          style: TextStyle(color: Colors.black),
                        ),
                        CustomTextFormField(
                          hint: TaskifyCopys.titleHintText,
                          keyboardType: TextInputType.multiline,
                          style: textInputTitle,
                        ),
                      ],
                    ),
                    // * Form field Description
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        Text(
                          TaskifyCopys.description,
                          style: TextStyle(color: Colors.black),
                        ),
                        CustomTextFormField(
                          hint: TaskifyCopys.descriptionHintText,
                          keyboardType: TextInputType.multiline,
                          style: textInput,
                          maxLength: 255,
                          maxLine: 4,
                        ),
                      ],
                    ),
                    Row(
                      spacing: 20,
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            controller: _startDateController,
                            hint: TaskifyCopys.startDateHintText,
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
                            hint: TaskifyCopys.endDateHintText,
                            keyboardType: TextInputType.datetime,
                            readOnly: true,
                            selectDate: _selectEndDate,
                            style: textInput,
                            suffixIcon: Icon(Icons.calendar_month_outlined),
                          ),
                        ),
                      ],
                    ),
                    // * Form select category
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        Text(
                          TaskifyCopys.taskCategory,
                          style: TextStyle(color: Colors.black),
                        ),
                        Row(
                          spacing: 20,
                          children: [
                            Expanded(flex: 2, child: CustomDropdownButton()),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () => showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) => AddCategoryDialog(),
                                ),
                                icon: Icon(Icons.add),
                                label: Text('Add'),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        Text(
                          TaskifyCopys.taskPriority,
                          style: TextStyle(color: Colors.black),
                        ),
                        const CustomSegmentedButton(),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Text(
                          TaskifyCopys.taskColorSelect,
                          style: TextStyle(color: Colors.black),
                        ),
                        const SelectTaskColor(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50)),
              onPressed: () {},
              child: Text('Guardar Tarea'),
            ),
          )
        ],
      ),
    );
  }
}

class AddCategoryDialog extends StatelessWidget {
  const AddCategoryDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle textInputTitle =
        TextTheme.of(context).displayLarge!.copyWith(color: Colors.black87);

    return ZoomIn(
      duration: Duration(milliseconds: 200),
      child: AlertDialog(
        insetPadding: EdgeInsets.all(20),
        scrollable: true,
        backgroundColor: Colors.amberAccent,
        titleTextStyle: TextStyle(color: Colors.black87, fontSize: 30),
        title: Text('Add Category'),
        content: Column(
          spacing: 40,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                Text(
                  TaskifyCopys.categoryTitle,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                CustomTextFormField(
                  hint: TaskifyCopys.categoryHintText,
                  style: textInputTitle,
                  maxLine: 1,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  TaskifyCopys.categoryColorSelect,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SelectTaskColor(),
              ],
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Exit'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Save Category'),
          ),
        ],
      ),
    );
  }
}
