import 'package:app_circule_chart/src/page/emergency_page.dart';
import 'package:app_circule_chart/src/page/graficas_circulares_page.dart';
import 'package:app_circule_chart/src/page/home_page.dart';
import 'package:app_circule_chart/src/page/pinteres_page.dart';
import 'package:app_circule_chart/src/page/slider_list_page.dart';
import 'package:app_circule_chart/src/page/slidershow_page.dart';

// import 'package:app_circule_chart/src/widget/circular_progress.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'SliderLis',
      routes: {
        'Home' : (BuildContext context) => HomePage(),
        'Progrees' : (BuildContext context) => GraficasCircularesPage(),
        'SlidesShow' : (BuildContext context) => SliderShowPage(),
        'Pinteres': (BuildContext context) => PinteresPage(),
        'Emergency': (BuildContext context) => EmergencyPage(),
        'SliderLis': (BuildContext context) => SliderLisPage(),
//SliderLisPage
      },
    );
  }
}