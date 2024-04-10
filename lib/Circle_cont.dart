import 'package:flutter/material.dart';

class Circle_cont extends StatefulWidget {
  const Circle_cont({super.key});

  @override
  State<Circle_cont> createState() => _Circle_contState();
}

class _Circle_contState extends State<Circle_cont> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 400,
        width: 800,
        child: Stack(
          children: [
            Container(
              height: 400,
              width: 400,
              color: Colors.black,
            )
          ],
        ),
      )
    );
  }
}
