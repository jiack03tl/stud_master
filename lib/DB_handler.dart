import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DB_handler{
  Database? db;
  Future<Database?> create_db() async{
    if(db !=null){
      return db;
    }
    else{
      Directory dir = await getApplicationDocumentsDirectory();
      String path = join(dir.path,"stud_mast");
      var db = await openDatabase(path, version: 1, onCreate: create_tb);
      return db;
    }

  }
  create_tb(Database db , int version)async{
 db.execute(
     " create table student (SID INTEGER PRIMARY KEY autoincrement, S_NAME TEXT, EMAIL TEXT, GENDER TEXT, SUB1 DOUBLE, SUB2 DOUBLE, SUB3 DOUBLE, TOTAL DOUBLE, PERCENT DOUBLE )"
  );
  print("table created!");
  }

  addStudent(name_,email_,gender,sub1_,sub2_,sub3_,total,per)async{
var db =await create_db();
var id = db!.rawInsert("insert into student (S_NAME,EMAIL,GENDER,SUB1,SUB2,SUB3,TOTAL,PERCENT)"
    "values(?,?,?,?,?,?,?,?)",[name_,email_,gender,sub1_,sub2_,sub3_,total,per]);
return id;

  }
  Future<List<dynamic>>viewStudent() async {
    var db =await create_db();
    var data =await db!.rawQuery("select * from student");
    return data;
  }
  Future<int>deleteStudent(id) async {
    var db = await create_db();
    var data = await db!.rawDelete("delete from student where SID=?",[id]);
    return data;
  }
  Future<int>updateStudent(id,name,_email,gender) async{
    var db = await create_db();
    var data = await db!.rawUpdate(" update student set S_NAME=? , EMAIL=?,GENDER=?",[id,name,_email,gender]);
    return data;
    
}
Future<List<Map<String,Object?>>>getSin
  gleData(id)async{
  var db = await create_db();
  var data = await db!.rawQuery("select * from student  where SID=? ",[id]);
  return data;
}

}