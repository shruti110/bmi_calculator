import 'package:bmi/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi/widgets/left_bar.dart';
import 'package:bmi/widgets/right_bar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
 
class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double res=0;
  String res1="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator",
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
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                double _h=double.parse(_heightController.text);
                double _w=double.parse(_weightController.text);
                setState(() {
                  res = _w / (_h*_h) * 10000;
                  if(res > 25){
                    res1="You're overweight";
                  }
                  else if(res >= 18.5 && res<=25 ){
                    res1="You have normal weight";
                  }
                  else{
                    res1="You're underweight";
                  }
                });

              },
              child: Container( width: 120,
                height: 50,
                decoration: BoxDecoration(

                border: Border.all(
                  color: Colors.grey,


                ),
                borderRadius: BorderRadius.circular(15),
              ),
                child: Text("CALCULATE",textAlign: TextAlign.center, style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color:accentHexColor),),
              ),
            ),
            SizedBox(height: 50,),
            Container(
              child: Text(res.toStringAsFixed(2),style: TextStyle(fontSize: 90,color:accentHexColor),),
            ),
            SizedBox(height: 30,),
            Visibility(
              visible: res1.isNotEmpty,
                child: Container(
              child: Text(res1,style: TextStyle(fontSize: 32,fontWeight: FontWeight.w400,color:accentHexColor),),
            )),
            SizedBox(height: 10,),
            LeftBar(barWidth: 40),
            SizedBox(height: 20,),
            LeftBar(barWidth: 70),
            SizedBox(height: 20,),
            LeftBar(barWidth: 40),
            SizedBox(height: 20,),
            RightBar(barWidth: 70),
            SizedBox(height: 50,),
            RightBar(barWidth: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow, width: 5.0),
                        ),
                      labelText: "Height in cm",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 19,
                        color:Colors.white.withOpacity(.8)
                      )

                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow, width: 5.0),
                        ),
                        labelText: "Weight in kg",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 19,
                            color:Colors.white.withOpacity(.8)
                        )

                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

