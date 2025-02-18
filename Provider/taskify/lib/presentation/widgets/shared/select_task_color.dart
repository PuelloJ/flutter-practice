import 'package:flutter/material.dart';

class SelectTaskColor extends StatelessWidget {
  const SelectTaskColor({super.key});

  static const List<Color> taskColorsSelect = [
    Colors.blueAccent,
    Colors.redAccent,
    Colors.yellowAccent,
    Colors.pinkAccent,
    Colors.greenAccent,
    Colors.deepPurpleAccent,
    Colors.indigoAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 10,
        children: taskColorsSelect
            .map(
              (color) => InkWell(
                onTap: () {},
                child: Card(
                  color: color,
                  child: SizedBox(
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
