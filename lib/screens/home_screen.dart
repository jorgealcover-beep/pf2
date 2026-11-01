import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pf2/screens/personal_screen.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  
  @override
  State<HomePage> createState()=> HomePageState();
}

class HomePageState extends State<HomePage>{
  static Persona persona = new Persona('Jorge', 'Alcover', 'jorgealcover@paucasesnovescifp.cat','contrasenya1234', DateTime(2004, 07, 11));
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
              profileCard(persona),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final result = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => PersonalScreen(persona: persona),
                        ),
                      );

                      if (result != null && result is Persona) {
                        setState(() {
                          persona = result;
                        });
                      }
                    },
                    child: Text('Edit profile'),
                  ),
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/widget');

                    },
                    child: Text('Widgets'),
                  ),
                ]
              ),
            ],
          ),
              
        );
    }      
}

Widget profileCard(Persona persona){
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
                '${persona.name} ${persona.lastName}',
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
              Text(persona.emailAdress,
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
            Text(DateFormat('dd/MM/yyyy').format(persona.birthDate),
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

class Persona{
  late String name;
  late String lastName;
  late String emailAdress;
  late String password;
  late DateTime birthDate;

  Persona(this.name, this.lastName, this.emailAdress, this.password, this.birthDate);
}