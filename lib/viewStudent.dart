import 'package:flutter/material.dart';
import 'package:stud_master/DB_handler.dart';
import 'package:stud_master/Update_Stud.dart';

class viewStudent extends StatefulWidget {
  const viewStudent({super.key});

  @override
  State<viewStudent> createState() => _viewStudentState();
}

class _viewStudentState extends State<viewStudent> {
  Future<List<dynamic>>? get_all_data;

  Future<List<dynamic>?>? get_data() async {
    // DB_handler obj = DB_handler();
    DB_handler obj1 = new DB_handler();
    setState(() {
      get_all_data = obj1.viewStudent();
    });
  }

  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    get_data();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("view data"),
        ),
        body: FutureBuilder(
          future: get_all_data,

          builder: (context,snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.length <= 0) {
                return Text("no data");
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      // return Text(snapshot.data![index]["S_NAME"].toString());
                      return Column(
                        children: [
                          Container(

                            height: 80,
                            width:400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blueAccent,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(snapshot.data![index]["S_NAME"].toString(),style: TextStyle(fontSize: 20),),
                                    Text(snapshot.data![index]["EMAIL"].toString(),style: TextStyle(fontSize: 20),),
                                    Text(snapshot.data![index]["GENDER"].toString(),style: TextStyle(fontSize: 20),),
                                    Text(snapshot.data![index]["SUB1"].toString(),style: TextStyle(fontSize: 20),),



                                    SizedBox(width: 30),
                                    GestureDetector(
                                        onTap: (){
                                          var id = snapshot.data![index]["SID"].toString();
                                          DB_handler obj = DB_handler();
                                          obj.deleteStudent(id);
                                          get_data();

                                        },
                                        child: Icon(Icons.delete)),
                                    SizedBox(width: 20),
                                    GestureDetector(
                                        onTap: (){
                                          var id = snapshot.data![index]["SID"].toString();
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Update_Stud(sid:id)));
                                        },
                                        child: Icon(Icons.edit)),

                                  ],
                                ),

                                Row(
                                  children: [
                                    Text(snapshot.data![index]["SUB2"].toString(),style: TextStyle(fontSize: 20),),
                                    Text(snapshot.data![index]["SUB3"].toString(),style: TextStyle(fontSize: 20),),
                                    Text(snapshot.data![index]["TOTAL"].toString(),style: TextStyle(fontSize: 20),),
                                    Text(snapshot.data![index]["PERCENT"].toString(),style: TextStyle(fontSize: 20),),
                                  ],
                                )
                              ],
                            ),

                          ), SizedBox(height: 10),
                        ],
                      );

                    });
              }
            } else {
             return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}








// builder: (context, snapshot) {
//   if (snapshot.hasData) {
//     if (snapshot.data!.length <= 0) {
//       Text("no");
//     } else {
//       return ListView.builder(
//         itemCount: snapshot.data!.length,
//         itemBuilder: (context, index) {
//           return ListView(
//             children: [
//               Text(
//                 snapshot.data![index]["S_NAME"].toString(),
//                 style: TextStyle(fontSize: 20),
//               )
//             ],
//           );
//         },
//       );
//     }
//   } else {
//     return Center(
//       child: CircularProgressIndicator(),
//     );
//   }
// }),