import 'dart:math';

import 'package:flutter/material.dart';


class RadialProgress extends StatefulWidget {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

  const RadialProgress({
    @required this.porcentaje, 
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
    this.grosorPrimario = 10,
    this.grosorSecundario = 4,
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {
  AnimationController controller;
  double porcentajeAnterior;
  @override
  void initState() {
    
    porcentajeAnterior = widget.porcentaje;
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 200));


    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    
    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;


    return AnimatedBuilder(
      animation: controller,
      // child: child,
      builder: (BuildContext context, Widget child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadiaProgress((widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value), widget.colorPrimario, widget.colorSecundario,widget.grosorPrimario,widget.grosorSecundario ),
          ),
        );
      },
    );

    // return Container(
    //   padding: EdgeInsets.all(10),
    //   width: double.infinity,
    //   height: double.infinity,
    //   child: CustomPaint(
    //     painter: _MiRadiaProgress(widget.porcentaje),
    //   ),
    // );
  }
}

class _MiRadiaProgress extends CustomPainter{
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;


  _MiRadiaProgress(
    this.porcentaje,
    this.colorPrimario, 
    this.colorSecundario, 
    this.grosorPrimario,
    this.grosorSecundario
  );
  @override
  void paint(Canvas canvas, Size size) {
    // final porcentaje = 80;

    // CIRCULO COMPLETADO
    final paint = new Paint()
    ..strokeWidth = grosorSecundario
    ..color = colorSecundario
    ..style = PaintingStyle.stroke;

    Offset center = new Offset(size.width * 0.5, size.height * 0.5);
    double radio = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radio, paint);

    //ARCO
    final paintArco = new Paint()
    ..strokeWidth = grosorPrimario
    ..color = colorPrimario
    ..strokeCap = StrokeCap.round
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