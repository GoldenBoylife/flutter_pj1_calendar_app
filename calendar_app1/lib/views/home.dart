import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../components/my_inc_dec_numInput.dart';
import '../model/dayInform.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  /*Property */
  DateTime selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue,
              width: 1240,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("1-0행",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                  SizedBox(width: 15,),
                  Text("1-1행",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                
                ],
              ),
            ),
            SizedBox(height: 50),
            Container(
              color:Colors.red,
              width: 1300,

              child: Row(
                children: [
                  // Text("2025",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white),),
                Container(
                  color: Colors.blue,
                  width: 120,
                  height: 80,
                  // child: My_inc_dec_numberInput(input_text: "2024",)),
                  child: My_inc_dec_numberInput(input_text: "2555")),
                  Text(DayInform.year)

                ],
              ),
            ),
            SizedBox(height: 50),


            Container(
              color: Colors.yellow,
              width: 1000,
              height: 500,
              child: 
                TableCalendar(
                  focusedDay: selectedDay,
                  firstDay: DateTime(1989),
                  lastDay: DateTime(2150),

                    
                  ),
                )

            ,
            Row(
              children: [
                Icon(
                  Icons.mode_comment,
                  size:50
                ),
                Icon(
                  Icons.add_circle_outline_outlined,
                  size:50
                )

              ],
            ),
    
          ]
        )
    
      
        
      ),
    );
  }
}