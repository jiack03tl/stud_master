import 'package:flutter/material.dart';
import 'package:stud_master/DB_handler.dart';
import 'package:stud_master/viewStudent.dart';

class Add_Student extends StatefulWidget {
  const Add_Student({super.key});

  @override
  State<Add_Student> createState() => _Add_StudentState();
}

class _Add_StudentState extends State<Add_Student> {

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();

  var gender;

  TextEditingController _sub1 = TextEditingController();
  TextEditingController _sub2 = TextEditingController();
  TextEditingController _sub3 = TextEditingController();


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: Colors.cyan,
        body: SingleChildScrollView(
          child: Container(
            height: 920,
            width: 900,
            child: Stack(
              children: [
                Positioned(
                  left: 60,
                  top: 130,
                  child: Container(
                    height: 950,
                    width: 950,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white70, offset: Offset(-25, -8))
                        ]),
                  ),
                ),
                Positioned(
                  left: 170,
                  top: 120,
                  child: Container(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage("assets/img.png"),
                    ),
                    decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(color: Colors.black12, spreadRadius: 14),
                    ]),
                  ),
                ),
                Positioned(
                  left: 70,
                  top: 10,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                  ),
                ),
                Positioned(
                  left: 300,
                  top: 10,
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                  ),
                ),
                Positioned(
                  top: 300,
                  left: 120,
                  child: Container(
                    height: 600,
                    width: 300,
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Text(
                          "Registration",
                          style: TextStyle(fontSize: 30, color: Colors.blue),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _name,
                          decoration: InputDecoration(
                              hintText: "name",
                              hintStyle: TextStyle(color: Colors.blue),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 3),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _email,
                          decoration: InputDecoration(
                              hintText: "email",
                              hintStyle: TextStyle(color: Colors.blue),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 3),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(children: [
                          Text("Male"),
                          Radio(
                            groupValue:gender,
                            value: "male",

                            onChanged: (val) {
                              setState(() {
                                gender = val!;
                                print(gender);
                              });
                            },
                          ),
                          Text("Female"),
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

                        ]),
                        TextField(
                          controller: _sub1,
                          decoration: InputDecoration(
                              hintText: "sub 1",
                              hintStyle: TextStyle(color: Colors.blue),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 3),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _sub2,
                          decoration: InputDecoration(
                              hintText: "sub 2",
                              hintStyle: TextStyle(color: Colors.blue),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 3),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _sub3,
                          decoration: InputDecoration(
                              hintText: "sub 3",
                              hintStyle: TextStyle(color: Colors.blue),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 3),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          height: 40,
                          width: 180,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                var name_ = _name.text.toString();
                                var email_ = _email.text.toString();
                                var sub1_ = _sub1.text.toString();
                                var sub2_ = _sub2.text.toString();
                                var sub3_ = _sub3.text.toString();
                                int.parse(_sub1.text);
                                var  total = (int.parse(sub1_) + int.parse(sub2_) + int.parse(sub3_)).toString();
                                var per = double.parse(total)/3;
                                print(per);
                                DB_handler obj = DB_handler();
                                obj.addStudent(name_,email_,gender,sub1_,sub2_,sub3_,total,per);
                                print(total);
                                // print("lotal is $total");
                                // print("average is:$per");
                              },
                              child: Text(
                                "Submit",
                                style: TextStyle(color: Colors.blue),
                              )
                          ),
                          
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 40,
                            width: 180,
                            child: ElevatedButton(onPressed: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>viewStudent()));
                            }, child: Text("Display")))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
