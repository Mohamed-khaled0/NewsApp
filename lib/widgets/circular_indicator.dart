import 'package:flutter/material.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.black,
        strokeWidth: 5,
        backgroundColor: Color.fromARGB(255, 216, 202, 202),
      ),
    );
  }
}
