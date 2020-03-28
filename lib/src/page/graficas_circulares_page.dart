import 'package:app_circule_chart/src/widget/radial_progress.dart';
import 'package:flutter/material.dart';


class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          setState(() {
            porcentaje+=10;
            if(porcentaje >100){
              porcentaje=0;
            }
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadioProgress(porcentaje: porcentaje,color: Colors.red,),
              CustomRadioProgress(porcentaje: porcentaje,color: Colors.blue,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadioProgress(porcentaje: porcentaje,color: Colors.yellow),
              CustomRadioProgress(porcentaje: porcentaje,color: Colors.orange),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomRadioProgress extends StatefulWidget {
  final porcentaje;
  final Color color;
  const CustomRadioProgress({ 
    @required this.porcentaje,
    @required this.color});
 
  @override
  _CustomRadioProgressState createState() => _CustomRadioProgressState();
}

class _CustomRadioProgressState extends State<CustomRadioProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      child: RadialProgress(
              porcentaje: widget.porcentaje,
              colorPrimario: widget.color,
              colorSecundario: Colors.grey,
              grosorPrimario:10,
              grosorSecundario:4
          ),
    );
  }
}