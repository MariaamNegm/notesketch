
import 'package:flutter/material.dart';
import 'package:todolist/Helper/helper.dart';

import 'homescreen.dart';

class disscreen extends StatelessWidget {
  @override
  String ?TITLE,DESCRIPTION,DATE;
  Note n1= Note();
  // the data wanted to be used on this dart file
  Widget build(BuildContext context) {
    return
        Scaffold(
        backgroundColor:Colors.black38 ,
        appBar: AppBar(
          elevation: 8,
          shadowColor: Colors.white,
          centerTitle: true,
          // ignore: prefer_const_constructors
          title:Padding(
            padding: const EdgeInsets.only(bottom:6.0),
            // ignore: prefer_const_constructors
            child: Text("Getting Stuff Done", textAlign: TextAlign.center, style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30,
            ),),
          ),
          backgroundColor: Colors.pinkAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),


          ),
          leading: Padding(
            padding: const EdgeInsets.only(bottom:8.0,left: 40),
            child: IconButton(
              onPressed: () { Navigator.pop(context);
              // is for going just the previous page
      },
              icon: Icon(Icons.arrow_back_ios,size: 25, color: Colors.white,),
            ),
          ),
        ),
        // ignore: prefer_const_constructors
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView (
            children: [
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                   style: TextStyle(
                     color: Colors.white,fontSize: 20
                   ),
                   // ignore: prefer_const_constructors
                   decoration: InputDecoration(
                     labelText:"Title",
                     labelStyle: TextStyle(
                       color: Colors.white,fontSize: 20
                     ),
                     contentPadding: EdgeInsets.all(20),
                     hintText: "Enter Title",
                     helperStyle: TextStyle(
                        color: Colors.white,fontSize: 20
                      ),
                       fillColor: Colors.purple,
                     // ignore: prefer_const_constructors
                     enabledBorder:OutlineInputBorder(
                       borderRadius: BorderRadius.all(Radius.circular(20)),
                        // ignore: prefer_const_constructors
                        borderSide:BorderSide(
                          color: Colors.pinkAccent
                        )


                     ),
                      disabledBorder:OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(20)),
                         // ignore: prefer_const_constructors
                         borderSide:BorderSide(
                             color: Colors.pinkAccent,
                         )


                     ),
                      focusedBorder:OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(20)),
                         // ignore: prefer_const_constructors
                         borderSide:BorderSide(
                             color: Colors.pinkAccent
                         )


                     ),


                   ) ,
                   onChanged:(value)
                  {
                    TITLE=value;
                  },
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.datetime,
                  style: TextStyle(
                      color: Colors.white,fontSize: 20
                  ),
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    labelText:"Date and Time",
                    labelStyle: TextStyle(
                        color: Colors.white,fontSize: 20
                    ),
                    contentPadding: EdgeInsets.all(20),
                    hintText: "Enter Date and Time",
                    helperStyle: TextStyle(
                        color: Colors.white,fontSize: 20
                    ),
                    fillColor: Colors.purple,
                    // ignore: prefer_const_constructors
                    enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        // ignore: prefer_const_constructors
                        borderSide:BorderSide(
                            color: Colors.pinkAccent
                        )


                    ),
                    disabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        // ignore: prefer_const_constructors
                        borderSide:BorderSide(
                          color: Colors.pinkAccent,
                        )


                    ),
                    focusedBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        // ignore: prefer_const_constructors
                        borderSide:BorderSide(
                            color: Colors.pinkAccent
                        )


                    ),


                  ) ,
                  onChanged:(value)
                  {
                    DATE=value;
                  },
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 9,
                  style: TextStyle(
                      color: Colors.white,fontSize: 20
                  ),
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    labelText:"Note",
                    labelStyle: TextStyle(
                        color: Colors.white,fontSize: 20,
                    ),
                    contentPadding: EdgeInsets.all(20),
                    hintText: "Enter Your Notes",
                    helperStyle: TextStyle(
                        color: Colors.white,fontSize: 20
                    ),
                    fillColor: Colors.purple,
                    // ignore: prefer_const_constructors
                    enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        // ignore: prefer_const_constructors
                        borderSide:BorderSide(
                            color: Colors.pinkAccent
                        )


                    ),
                    disabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        // ignore: prefer_const_constructors
                        borderSide:BorderSide(
                          color: Colors.pinkAccent,
                        )


                    ),
                    focusedBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        // ignore: prefer_const_constructors
                        borderSide:BorderSide(
                            color: Colors.pinkAccent
                        )


                    ),



                  ) ,
                  onChanged:(value)
                  {
                    DESCRIPTION=value;
                  },
                ),
              ),
              SizedBox(height: 10,),
              Center(

                  child: ElevatedButton.icon(
                    // ignore: prefer_const_constructors
                    style: ElevatedButton.styleFrom(elevation: 7,shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),


                    ),primary: Colors.pinkAccent,shadowColor: Colors.white ),
                      onPressed:()
                      {
                        n1.insertdb({
                             'DESCRIPTION': DESCRIPTION,
                             'TITLE': TITLE,
                             'DATE': DATE,
                            'DONE':"done",
                        }).then((value){
                          print("inserted note ");
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) { return homescreen(); }));
                        });


                      },
                      // ignore: prefer_const_constructors
                      icon: Icon(Icons.add), label: Text("ADD",style: TextStyle(
                        color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold
                      ),)),

              )
            ],
          ),
        ),
      );

  }
}
