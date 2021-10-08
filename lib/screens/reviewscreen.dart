import 'package:flutter/material.dart';

//to be continued later

class reviewscreen extends StatelessWidget {
  var TITLE;
  var DESCRIPTION ;
  var  DONE;
  var DATE ;
  reviewscreen({this.DATE,this.DESCRIPTION,this.TITLE,this.DONE});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 8,
        shadowColor: Colors.white,
        centerTitle: true,
        // ignore: prefer_const_constructors
        title:Padding(
          padding: const EdgeInsets.only(bottom:6.0),
          // ignore: prefer_const_constructors
          child: Text("Stuff Done", textAlign: TextAlign.center, style: TextStyle(
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
            onPressed: () { Navigator.pop(context); },
            icon: Icon(Icons.arrow_back_ios,size: 25, color: Colors.white,),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            height: 200,
            width: 300,
            child: Card(
              color: Colors.pinkAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.
                  circular(20),
              ),
              shadowColor: Colors.white,
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("$TITLE",style: TextStyle(
                    fontSize: 25,color: Colors.white
                  ),),
                  Text("$DESCRIPTION",style: TextStyle(
                  fontSize: 25,color: Colors.white
                  ),),
                  Text("$DATE",style: TextStyle(
                      fontSize: 25,color: Colors.white
                  ),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
