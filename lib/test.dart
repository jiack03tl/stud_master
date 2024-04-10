import 'package:flutter/material.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  var gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Radio(value: "male", groupValue: gender, onChanged: (val){
            setState(() {
              gender = val!;
            });
          }),
          Radio(
            groupValue:gender,
            value: "female",
            activeColor: Colors.redAccent,
            onChanged: (val) {
              setState(() {
                gender = val!;
                print(gender);
              });
            },
          ),
        ],
      ),
    );
  }
}
