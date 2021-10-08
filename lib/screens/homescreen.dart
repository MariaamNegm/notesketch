import 'package:flutter/material.dart';
import 'package:todolist/Helper/helper.dart';
import 'package:todolist/screens/reviewscreen.dart';
import 'disscreen.dart';
 class homescreen extends StatefulWidget {
   @override
   _homescreenState createState() => _homescreenState();
 }

 class _homescreenState extends State<homescreen> {
   @override
   void initState(){
     super.initState();
     Note().db.then((value){
       print("value$value");
     });
   }

   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor:Colors.black38 ,
       appBar: AppBar(
         elevation: 8,
         shadowColor: Colors.white,
         centerTitle: true,
         // ignore: prefer_const_constructors
         title:Padding(
           padding: const EdgeInsets.only(bottom:20.0),
           // ignore: prefer_const_constructors
           child: Text("NOTEBOOK", textAlign: TextAlign.center, style: TextStyle(
             fontWeight: FontWeight.bold,
             color: Colors.white,
             fontSize: 30,
           ),),
         ),
         backgroundColor: Colors.pinkAccent,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(40),


         ),


       ),
       // ignore: prefer_const_constructors
       body:FutureBuilder(
         future:Note().getdata(),
         builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
           if(snapshot.hasData)
             {
               if(snapshot.data.length==0){
               return  Center(
                 // ignore: prefer_const_constructors
                 child: Text("your NoteBook Is empty",style: TextStyle(
                     fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold
                 ),),
                 // ignore: prefer_const_constructors

               );

             }
               else
                 {
                   return ListView.builder(
                     itemCount: snapshot.data.length,
                     itemBuilder: (BuildContext context, int i) {
                       return Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Card(
                             color: Colors.pinkAccent,
                             shadowColor :Colors.white,
                             elevation: 10,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(40),
                             ),
                             child: ListTile(
                               onTap:(){
                                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return reviewscreen(TITLE:snapshot.data[i].TITLE,DESCRIPTION: snapshot.data[i].DESCRIPTION,DATE: snapshot.data[i].DATE,DONE: snapshot.data[i].DONE,); }));
                               },
                               title:Text("${snapshot.data[i].TITLE}",style: TextStyle(
                                   fontSize: 15,
                                   color: Colors.white,
                                   fontWeight: FontWeight.bold
                               ),) ,
                               subtitle: Text("${snapshot.data[i].DATE}",style: TextStyle(
                                   fontSize: 15,
                                   color: Colors.white,
                                   fontWeight: FontWeight.bold
                               ),),
                               trailing:IconButton(
                                 onPressed: () {
                                   Note().deletedb(snapshot.data[i].id).then((value){
                                     setState(() {
                                       print("value");
                                     });

                                   });
                                 },
                                 icon:Icon(Icons.delete, size: 30,color: Colors.white,),

                               ) ,
                             ),
                           ),
                         ),
                       );

                     },);
                 }
             }
           else{
             return
             Center(
               // ignore: prefer_const_constructors
               child: Text("your NoteBook Is empty",style: TextStyle(
                   fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold
               ),),
               // ignore: prefer_const_constructors

             );
           }
         },

       ),

       floatingActionButton: FloatingActionButton(
         onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context){
             return disscreen();
           }));
         },
         backgroundColor: Colors.pinkAccent,
         child: Icon(Icons.add,color:Colors.white,size: 30),

       )
       ,
     );
   }
 }

