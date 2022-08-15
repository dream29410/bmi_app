
import 'package:bmi/widget/right_bar.dart';
import 'package:flutter/material.dart';
import 'package:bmi/widget/left_bar.dart';

class HomeScreen extends StatefulWidget {


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _wightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculater",
          style: TextStyle(color: Colors.white , fontWeight: FontWeight.w300),

        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.blue,
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
                        color: Colors. white,

                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      helperStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8)
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _wightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors .white ,

                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Width",
                      helperStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8)
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 50,),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_wightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult > 25) {
                    _textResult = "you\'re over weight";
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = "you have normal wight";
                  } else {
                    _textResult = "you\'re under wight";
                  }
                });
              },

            ),
            SizedBox(height: 50,),
            Container(
              child: Text('Calculater', style: TextStyle(fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white ),),

            ),
            SizedBox(height: 70,),
            Container(
              child: Text(_bmiResult.toStringAsFixed(2), style: TextStyle(
                  fontSize: 90,
                  fontWeight: FontWeight.bold,
                  color: Colors .white ),),
            ),
            SizedBox(height: 50,),

            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: Colors.white ),
                ),
              )),

               SizedBox(height: 30,),
               Leftbar(barwidth: 40),
            SizedBox(height: 30,),
            Leftbar(barwidth:  70,),
            SizedBox(height: 30,),
            Leftbar(barwidth: 40),
            SizedBox(height: 30,),
            Rightbar(barwidth: 70,),
            SizedBox(height: 30,),
            Rightbar(barwidth: 70,),

          ],
        ),
      )
    );
  }
}

