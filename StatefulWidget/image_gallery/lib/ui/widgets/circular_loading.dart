import 'package:flutter/material.dart';

class CircularLoading extends StatelessWidget {
  const CircularLoading({
    required this.loading,
    required this.child,
    super.key,
  });

  final bool loading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!loading) {
      return child;
    }

    return Stack(
      children: [
        child,
        const ColoredBox(
          color: Colors.black54,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}