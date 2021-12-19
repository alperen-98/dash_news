import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 7,
            color: Colors.pink,
            child: const SizedBox(height: 0),
          ),
          const SizedBox(width: 7),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
