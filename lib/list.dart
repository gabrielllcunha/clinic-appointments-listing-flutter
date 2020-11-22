import 'package:flutter/material.dart';
import 'dart:math';

class List extends StatefulWidget {
  final String text;

  Lista({Key key, @required this.text}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
   
class _HomeState extends State<List>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Patients List:"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:  ListView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          
      children: <Widget>[               
        Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            ListTile(
              title: Text('Name: Cláudia Freitas', style: TextStyle(color: Colors.black, fontSize: 35.0)),  
            ),        
            ListTile(
              title: Text('Date: 08/01/21', style: TextStyle(color: Colors.black, fontSize: 35.0)),
            ),
            ListTile(
              title: Text('Hour: 08:00', style: TextStyle(color: Colors.black, fontSize: 35.0)),
            ),
            ListTile(
              title: Text('Doctor: Luisa L.', style: TextStyle(color: Colors.black, fontSize: 35.0)),
            ),
            ListTile(
              title: Text('Phone Number: (55)999045-44320', style: TextStyle(color: Colors.black, fontSize: 35.0)),
            ),
            ListTile(
              title: Text('Email: claudiafreitas09@terra.com.br', style: TextStyle(color: Colors.black, fontSize: 35.0)),
            ),
            ],
            ),
          ],
      ),
    );
  }
}