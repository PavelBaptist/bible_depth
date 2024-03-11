import 'package:flutter/material.dart';

class BlockWidget extends StatelessWidget {
  String? header;
  Widget child;
  Color? color;

  BlockWidget({super.key, required this.child, this.header, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color ?? Colors.amber.shade50,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 10,
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (header != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  header!,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
          child,
        ],
      ),
    );
  }
}
