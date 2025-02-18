import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({super.key});

  @override
  State<CustomDropdownButton> createState() => CustomDropdownButtonState();
}

class CustomDropdownButtonState extends State<CustomDropdownButton> {
  final List<DropdownMenuItem<String>> items = [
    DropdownMenuItem(
      value: 'Garden Task',
      child: Text('Garden Task'),
    ),
    DropdownMenuItem(
      value: 'Home Task',
      child: Text('Home Task'),
    ),
    DropdownMenuItem(
      value: 'Work Task',
      child: Text('Work Task'),
    ),
    DropdownMenuItem(
      value: 'School Task',
      child: Text('School Task'),
    ),
   
  ];

  final String value = 'Garden Task';

  @override
  Widget build(BuildContext context) {
    final border =
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.black54));
        final colors = Theme.of(context).colorScheme;

    return DropdownButtonFormField(
      value: value,
      items: items,
      style: TextStyle(color: Colors.white),
      dropdownColor: colors.surface,
      iconEnabledColor: Colors.black,
      decoration: InputDecoration(
        border: border,
        enabledBorder: border,
        focusedBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.black)),
      ),
      hint: Text('Select Task Category'),
      onChanged: (value) {
        setState(() {
          value = value;
        });
      },
    );
  }
}