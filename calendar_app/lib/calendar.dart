import 'package:calendar_app/event.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  /*Property */
  late Map<DateTime,List<Event>> selectedEvents ;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedEvents = {};


  }
  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date]?? [];
    //? 이건 무슨 문법이지?
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar!!"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: selectedDay, 
            firstDay: DateTime(1990), 
            lastDay: DateTime(2150),
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              },
              );
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            //calendar에서 시작 요일 정하기
            daysOfWeekVisible: true, 

            /*Day changed */
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
                
              });
              print(focusedDay);
              // print(selectedDay);
            },
              /*아래 2줄 쓰면, calendar 클릭했을 때 파란색 원 나타남 */
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },
            
            eventLoader: _getEventsfromDay,

            /*Style */
            calendarStyle: CalendarStyle(
              isTodayHighlighted : true,
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
            ),
            /*day가 선택되지 않았을 때 기본 바탕색 */
            defaultDecoration: BoxDecoration(

                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
            ),
            weekendDecoration: BoxDecoration(

                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
            ),

          ),
          /*화면 우상단쪽 Month라고 되어 있는 곳  */
          headerStyle: HeaderStyle(
            formatButtonVisible: true,
            titleCentered: true,
            formatButtonShowsNext: false,
            
            formatButtonDecoration: 
              BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(5.0),
              //바탕 색이 바뀜
              ),
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
                //글자색
              ),
          ),
  
          ),
          ..._getEventsfromDay(selectedDay).map((Event event) => ListTile(title: Text(event.title))),
        ],
      ),
      /*우하단에 버튼 하나 생김 */
      floatingActionButton: FloatingActionButton.extended(
        /*버튼 누르면 창 뜸 */
        onPressed: (){
          showDialog(
            context : context, 
            builder: (context) => AlertDialog(
              title: Text("Add Event"),
              content: TextFormField(controller: _eventController,),
              actions: [
                TextButton(onPressed: () {
                  /*TextEditing 안에 아무 값도 없을 때 */
                  if(_eventController.text.isEmpty){
                    Navigator.pop(context);
                    return;
                  }else{
                    /*선택한 날 */
                    if(selectedEvents[selectedDay] != null){
                      selectedEvents[selectedDay]?.add(
                        //? 여기 왜 ? 넣을까?
                        Event(title: _eventController.text),
                      );
                    } else{
                      selectedEvents[selectedDay] = [
                        Event(title: _eventController.text)
                      ];
                    }

                  }
                  Navigator.pop(context);
                  _eventController.clear();
                  setState(() {
                    
                  });
                  return ;
                },child: Text("OK"))
                ,
                TextButton(onPressed: ()=> Navigator.pop(context),child: Text("Cancel"))
              ]
            ),
          );
        },
          label: Text("Add Event"),
          icon: Icon(Icons.add),
      ), 
    
    
    );
  }
}