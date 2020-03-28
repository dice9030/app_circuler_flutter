// import 'package:app_circule_chart/src/widget/circular_progress.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double porcentaje = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: CiruclarProgress(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          porcentaje +=10;
          if(porcentaje == 10){
            porcentaje=0;
          }
          setState(() {
            
          });
        },
      ),
    );
  }
}