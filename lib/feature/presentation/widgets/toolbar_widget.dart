import 'package:flutter/material.dart';

class ToolbarWidget extends StatelessWidget {
  const ToolbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      width: double.infinity,
      height: 150.0,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 30,
              height: 30,
              color: Colors.blue,
            ),
            Container(
              width: 30,
              height: 30,
              color: Colors.green,
            ),
            Container(
              width: 30,
              height: 30,
              color: Colors.red,
            ),
            Container(
              width: 30,
              height: 30,
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
