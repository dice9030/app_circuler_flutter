// import 'package:app_circule_chart/src/models/slider_model.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;

  final double bulletPrimario;
  final double bulletSecundario;

  SlideShow({
    @required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.green,
    this.colorSecundario = Colors.grey,
    this.bulletPrimario = 12.0,
    this.bulletSecundario = 12.0
  });
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SliderModel(),
      child: SafeArea(
              child: Center(
            child: Builder(
              builder: (BuildContext context) {
                
                Provider.of<_SliderModel>(context).colorPrimario = this.colorPrimario;
                Provider.of<_SliderModel>(context).colorSecundario = this.colorSecundario;
                Provider.of<_SliderModel>(context).bulletPrimario = this.bulletPrimario;
                Provider.of<_SliderModel>(context).bulletSecundario = this.bulletSecundario;
                return _CrearEstructuraSlideShow(puntosArriba: puntosArriba, slides: slides);
              },
            ),
          ),
      ),
    );
  }
}

class _CrearEstructuraSlideShow extends StatelessWidget {
  const _CrearEstructuraSlideShow({
    Key key,
    @required this.puntosArriba,
    @required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // if(this.puntosArriba) _Dots(this.slides.length,this.colorPrimario,this.colorSecundario),
        if(this.puntosArriba) _Dots(this.slides.length),
        Expanded(                
          child: _Slides(this.slides)
        ),
        // if(!this.puntosArriba) _Dots(this.slides.length,this.colorPrimario,this.colorSecundario),
        if(!this.puntosArriba) _Dots(this.slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {

  final totalSlides;
  // final Color colorPrimario;
  // final Color colorSecundario;
  // _Dots(this.totalSlides,this.colorPrimario,this.colorSecundario);
  _Dots(this.totalSlides);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // children: List.generate(this.totalSlides, (i) => _Dot(i,this.colorPrimario,this.colorSecundario)),
        children: List.generate(this.totalSlides, (i) => _Dot(i)),
        // children: <Widget>[
        //   _Dot(0),
        //   _Dot(1),
        //   _Dot(2),
        // ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;
  // final Color colorPrimario;
  // final Color colorSecundario;
  // _Dot(this.index,this.colorPrimario,this.colorSecundario);
  _Dot(this.index);
  @override
  Widget build(BuildContext context) {

    // final pageViewIndex = Provider.of<_SliderModel>(context).currentPage;
    final ssModel = Provider.of<_SliderModel>(context);
      double tamano = 0;
      Color color;

    if(ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5 ){
      tamano = ssModel.bulletPrimario;
      color = ssModel.colorPrimario;
      
    }else{
      tamano = ssModel.bulletSecundario;
      color = ssModel.colorSecundario;
    }


    // final tamano = (ssModel.currentPage == index ) ? ssModel.bulletPrimario : ssModel.bulletSecundario;
    
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: tamano,
      height: tamano,
      decoration: BoxDecoration(
        color: color,//(ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5 ) ? ssModel.colorPrimario : ssModel.colorSecundario,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget { 
 final List<Widget> slides;

  const _Slides( this.slides);
 
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final pageViewController = new PageController();

  @override
  void initState() {
    
    super.initState();

    pageViewController.addListener((){
      Provider.of<_SliderModel>(context,listen: false).currentPage = pageViewController.page;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        // children: <Widget>[
        //   _Slide('assets/svgs/undraw1.svg'),
        //   _Slide('assets/svgs/undraw2.svg'),
        //   _Slide('assets/svgs/undraw3.svg'),
         
        // ],
        children: widget.slides.map((slide)=> _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  _Slide(this.slide);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SliderModel with ChangeNotifier{

  double _currentPage = 0;
  Color _colorPrimario = Colors.green;
  Color _colorSecundario = Colors.grey;

  double _bulletPrimario = 12.0;
  double _bulletSecundario = 12.0;



  double get currentPage => this._currentPage;

  set currentPage(double currentPage){
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;

  set colorPrimario(Color colorPrimario){
    this._colorPrimario = colorPrimario;
    
  }

  Color get colorSecundario => this._colorSecundario;

  set colorSecundario(Color colorSecundario){
    this._colorSecundario = colorSecundario;
    
  }

  double get bulletPrimario => this._bulletPrimario;

  set bulletPrimario(double bulletPrimario){
    this._bulletPrimario = bulletPrimario;
    
  }
  double get bulletSecundario => this._bulletSecundario;

  set bulletSecundario(double bulletSecundario){
    this._bulletSecundario = bulletSecundario;
    
  }
}