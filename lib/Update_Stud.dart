import 'package:flutter/material.dart';
import 'package:stud_master/DB_handler.dart';
import 'package:stud_master/viewStudent.dart';

class Update_Stud extends StatefulWidget {
var sid;

   Update_Stud({super.key, this.sid} );

  @override
  State<Update_Stud> createState() => _Update_StudState();
}

class _Update_StudState extends State<Update_Stud> {

Future<List<dynamic>>? get_all_data;

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();

  var gender;
  get_data()async{
    DB_handler obj = DB_handler();
    var updateStudent_ = await obj.getSingleData(widget.sid);
    setState(() {
      _name.text =updateStudent_[0]["S_NAME"].toString();
      _email.text =updateStudent_[0]["EMAIL"].toString();
      gender.text =updateStudent_[0]["GENDER"].toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Center(child: Text("Update Student",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
      ),
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
                          "Update student",
                          style: TextStyle(fontSize: 30, color: Colors.blue),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _name,
                          decoration: InputDecoration(
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
                            activeColor: Colors.blueAccent,
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
                            activeColor: Colors.blueAccent,
                            onChanged: (val) {
                              setState(() {
                                gender = val!;
                                print(gender);
                              });
                            },
                          ),

                        ]),

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
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>viewStudent()));
                                var name_ = _name.text.toString();
                                var email_ = _email.text.toString();
                                var gender_ = gender;
                                DB_handler obj = DB_handler();

                                obj.updateStudent(widget.sid,_name,email_,gender_);
                                print(_email);


                              },
                              child: Text(
                                "Update!",
                                style: TextStyle(color: Colors.green[700],fontSize: 18),
                              )
                          ),

                        ),
                        SizedBox(
                          height: 10,
                        ),

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
