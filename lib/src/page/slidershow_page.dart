import 'package:app_circule_chart/src/widget/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SliderShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: _MiSlideShow()),
          Expanded(child: _MiSlideShow()),
        ],
      ),
    );
  }
}

class _MiSlideShow extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return SlideShow(
      bulletPrimario:20,
      bulletSecundario: 10,
      colorPrimario: Colors.black,
      colorSecundario: Colors.blue,
      puntosArriba: false,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/undraw1.svg'),
        SvgPicture.asset('assets/svgs/undraw2.svg'),
        SvgPicture.asset('assets/svgs/undraw3.svg'),
        SvgPicture.asset('assets/svgs/undraw4.svg'),
        SvgPicture.asset('assets/svgs/undraw5.svg'),
        Text('data'),
        Container(
          width: 200,
          height: 200,
          color: Colors.red,
        )
      ],
    );
  }
}



