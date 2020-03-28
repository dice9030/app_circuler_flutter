import 'package:app_circule_chart/src/page/graficas_circulares_page.dart';
import 'package:app_circule_chart/src/page/home_page.dart';
// import 'package:app_circule_chart/src/widget/circular_progress.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'Progrees',
      routes: {
        'Home' : (BuildContext context) => HomePage(),
        'Progrees' : (BuildContext context) => GraficasCircularesPage(),
      },
    );
  }
}