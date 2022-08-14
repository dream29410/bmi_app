import 'package:bmi/constant/App_constant.dart';
import 'package:bmi/widget/left_bar.dart';
import 'package:bmi/widget/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _wightController = TextEditingController();
  double _emailResult =0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculater",
          style: TextStyle(color: accentHexColor,fontWeight: FontWeight.w300),

        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor

                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      helperStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.0)
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _wightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor

                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Width",
                      helperStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.0)
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_wightController.text);
                setState(() {
                  _emailResult = _w / (_h * _h);
                  if(_emailResult > 25){
                    _textResult = "you\'re over weight";

                  }else if (_emailResult >= 18.5 && _emailResult <= 25){
                    _textResult = "you have normal wight";

                  } else{
                    _textResult = "you\'re under wight";

                  }
                });
              },
            ),
            Container(
              child: Text('Calculater',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: accentHexColor),),

            ),
            SizedBox(height: 50,),
            Container(
              child: Text(_emailResult.toStringAsFixed(2), style: TextStyle(fontSize: 90,fontWeight: FontWeight.bold, color: accentHexColor) ,),
            ),
            SizedBox(height: 30,),

            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: accentHexColor) ,
                ),
              ), ),
            SizedBox(height: 10,),
            SizedBox(height: 20,),

            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}
