import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/dayInform.dart';
class My_inc_dec_numberInput extends StatefulWidget {
  /*Property */
  String input_text;


   My_inc_dec_numberInput({
    super.key,
    required this.input_text,

    
  });

  @override
  State<My_inc_dec_numberInput> createState() => _My_inc_dec_numberInputState();
}

class _My_inc_dec_numberInputState extends State<My_inc_dec_numberInput> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    
    _controller.text =widget.input_text; //여기에 default값 넣기.


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            width: 160.0,
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: Colors.blueGrey,
                width: 2.0,
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    controller: _controller,
                    
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: false,
                      signed: true,
                    ),
                    inputFormatters: <TextInputFormatter>[
                      // WhitelistingTextInputFormatter.digitsOnly//이줄 때문에 실행안됨.
                      
                    ],
                  ),
                ),
                Container(
                  height: 38.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: InkWell(
                          child: Icon(
                            Icons.arrow_drop_up,
                            size: 18.0,
                          ),
                          onTap: () {
                            int currentValue = int.parse(_controller.text);
                            setState(() {
                              currentValue++;
                              _controller.text = (currentValue).toString(); // incrementing value
                              
                              DayInform.year = _controller.text ;
                              // DayInform dayInform = DayInform(year: _controller.text);
                              // print ("알고 싶은 것: ${DayInform.year}");
                          
                              //여기에서 year가 업뎃되고, home에서 쓰면된다. 

                            });
                          },
                        ),
                      ),
                      InkWell(
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: 18.0,
                        ),
                        onTap: () {
                          int currentValue = int.parse(_controller.text);
                          setState(() {
                            print("Setting state");
                            currentValue--;
                            _controller.text =
                                (currentValue > 0 ? currentValue : 0).toString(); // decrementing value
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}