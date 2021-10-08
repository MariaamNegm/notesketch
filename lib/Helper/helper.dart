import 'package:flutter/material.dart';
import 'dart:io' as io;
import'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist/model/todomodel.dart';
//this file could help us in the form of the database


class Note{
static Database? _db;
//defining the kind of the database
 Future<Database?> get db async{
  // ignore: prefer_conditional_assignment
  if(_db==null)
  //checking the database if it is null or not
    {
      _db=await initialdata();
      // calling this method if there is not database file
    }
  else
    {
      return _db;
      // if exists so returning back
    }



}
   initialdata() async{
   io.Directory d1=await getApplicationDocumentsDirectory();
   // getting the path of the path of the app on the mobile
   String path =join(d1.path,"todolist.db");
   //create the path for the database file on the same location as the app
   var mydb=await openDatabase(path,version: 1,onCreate: _onCreated);
   return mydb;
   // version means that there is only one table

}
  _onCreated(Database db, int version) async{
   // calling this method means that there will be  a table created
   await db.execute('CREATE TABLE TODO(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, DESCRIPTION TEXT NOT NULL,TITLE TEXT NOT NULL,DATE TEXT NOT NULL,DONE TEXT NOT NULL )');
  }
  Future<int>insertdb(Map<String ,dynamic>data)async
  {
    //this method is for the insert on the created table
    Database ?db_client = await _db;
    //decalring a variable of the database type
    var result=db_client!.insert('TODO', data);
    // inserting the data in the table
    return result;
    //returning the result
  }
  Future<int>deletedb(int id)async
  {
    // this methid is for deleting a raw on the table
  Database ?db_client = await _db;
  //decalring a variable of the database type
  var result=db_client!.rawUpdate('DELETE FROM TODO WHERE id="$id"');
  //updating the raw on the table
  return result;
  }
  Future<int>updatedb(String note,int id)async
  {
  Database ?db_client = await _db;
  var result=db_client!.rawUpdate('UPDATE TODO SET note="$note" WHERE id="$id" ');
  return result;
}
Future<List<todomodel>>getdata() async{
  Database ?db_client = await _db;
  List<todomodel>l1=[];
  var result = await db_client!.query("TODO");
  // ignore: unused_local_variable
  for(var i in result){
    todomodel t1=todomodel(DESCRIPTION:i["DESCRIPTION"],DATE: i["DATE"],DONE: i["DONE"],id: i["id"],TITLE:i["TITLE"]);
    l1.add(t1);
  }
  return l1;


}
  Future<List> getsinglerow(int id )async
  {// this method is for getting the table with single rows by requesting the query
    Database ?db_client= await _db;
    var result =db_client!.query('TODO',where: 'id="$id"');
    return result;

    
  }
}