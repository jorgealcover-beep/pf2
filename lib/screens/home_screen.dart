import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

    @override
    Widget build(BuildContext context){
      return Scaffold(
          appBar: AppBar(
              title: Text('DevProfile M3'),
              backgroundColor: Color(0xFF9FCFFA),
          ),
          body: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              profileCard()]
          ),
      );
    }      
}

Widget profileCard(){
  return Card(
    margin: EdgeInsets.all(16.0),
    color: Color.fromARGB(255, 250, 200, 159),
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person, color: Colors.black),
              SizedBox(width: 8.0),
              Text(
                'Jorge Alcover Escanero',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          
          Row(
            children: [
              Icon(Icons.email, color: Colors.black),
              SizedBox(width: 8.0),
              Text('jorgealcover@paucasesnovescifp.cat',
              style: TextStyle(
                fontSize: 13.0,
                color: Colors.grey[600],
              ),
            ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(children: [
            Icon(Icons.calendar_month, color: Colors.black),
            SizedBox(width: 8.0),
            Text('Fecha de nacimiento: 11/07/2004',
              style: TextStyle(
                fontSize: 13.0,
                color: Colors.grey[600],
              ),
            ),
          ],)
        ],
      ),
    ),
  );
}