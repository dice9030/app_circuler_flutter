import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CiruclarProgress extends StatefulWidget {
//  final double porcentaje;
  // CiruclarProgress(this.porcentaje);
//  const CiruclarProgress({ Key key , this.porcentaje }) : super(key: key);
  @override
  _CiruclarProgressState createState() => _CiruclarProgressState();
}

class _CiruclarProgressState extends State<CiruclarProgress>  with SingleTickerProviderStateMixin{
  
  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;
  AnimationController controller;

  @override
  void initState() { 

    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 800) );
    controller.addListener((){
      // print('valor del controller ${ controller.value } ');
        setState(() {
          porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value);
          
        });
    });
    super.initState();
    
  }

  @override
  void dispose() { 
    controller.dispose();  
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(5),
            width: 300,
            height: 300,
            // color: Colors.red,
            child: CustomPaint(
              painter: _MiRadiaProgress(porcentaje),
            ),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          porcentaje = nuevoPorcentaje;
          nuevoPorcentaje +=10;
          if(nuevoPorcentaje > 100){
            nuevoPorcentaje = 0;
            porcentaje = 0;
          }

          controller.forward(from: 0.0);

          setState(() {
            
          });
        },
      ),
    );
  }
}

class _MiRadiaProgress extends CustomPainter{
  final porcentaje;

  _MiRadiaProgress(this.porcentaje);
  @override
  void paint(Canvas canvas, Size size) {
    // final porcentaje = 80;

    // CIRCULO COMPLETADO
    final paint = new Paint()
    ..strokeWidth = 4
    ..color = Colors.grey
    ..style = PaintingStyle.stroke;

    Offset center = new Offset(size.width * 0.5, size.height * 0.5);
    double radio = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radio, paint);

    //ARCO
    final paintArco = new Paint()
    ..strokeWidth = 10
    ..color = Colors.red
    ..style = PaintingStyle.stroke;
    //Parte que se debera estar llenaddo

    double arcAngle = 2* pi* (porcentaje /100);

    canvas.drawArc(
      Rect.fromCircle(center: center,radius: radio),
      -pi/2,
      arcAngle,
      false,
      paintArco
      );


    // Offset center = new Offset(size.width * 0.5, size.height * 0.5);
    // double radio = min(size.width * 0.5, size.height * 0.5);
    // canvas.drawCircle(center, radio, paintArco);



  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate)  => true;
}