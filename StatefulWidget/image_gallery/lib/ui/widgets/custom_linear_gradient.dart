import 'package:flutter/material.dart';

class CustomLinearGradient extends StatelessWidget {
  const CustomLinearGradient({
    super.key,
    required this.begin,
    required this.end,
    this.stops = const [0.4, 1.0],
    this.colors = const [Colors.transparent, Colors.black54],
  });

  final Alignment begin;
  final Alignment end;
  final List<double>? stops; // [0.4, 1.0];
  final List<Color> colors; //  [Colors.transparent, Colors.black54];

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            stops: stops,
            begin: begin,
            end: end,
          ),
        ),
      ),
    );
  }
}
