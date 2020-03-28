import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PinterestButton{
  final Function onPressed;
  final IconData icon;
  PinterestButton({ 
    @required this.onPressed,
    @required this.icon 
  });
}

class PinterestMenu extends StatelessWidget {
  
  final bool mostrar;

  final Color backgroundColor;
  final Color activveColor;
  final Color inactiveColor;
  final List<PinterestButton> items;
  


  PinterestMenu({
    this.mostrar = true,
    this.backgroundColor = Colors.white,
    this.activveColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    @required this.items,
    });
  
  
  
  @override
  Widget build(BuildContext context) {
    // final List items =[] ;
    
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: ( mostrar ) ? 1 : 0,
        child: Builder(
          builder: (BuildContext context){
            Provider.of<_MenuModel>(context).backgroundColor = this.backgroundColor;
            Provider.of<_MenuModel>(context).activveColor = this.activveColor;
            Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;

            return _PinterestMenuBackground(
              child: _MenuItems( items),
            );
          },
        ),
      )
      );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;  
  _PinterestMenuBackground({@required  this.child});

  @override
  Widget build(BuildContext context) {

    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: <BoxShadow>[
          BoxShadow( 
            color: Colors.black38,
            // offset: Offset(10,10),
            blurRadius: 10,
            spreadRadius: -5
          ),
          
        ],
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  
  final List<PinterestButton> menuItems;
  _MenuItems(this.menuItems);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (i) => _PinterestMenuButton(i,menuItems[i])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _PinterestMenuButton(this.index, this.item);

 
  @override
  Widget build(BuildContext context) {

    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;
    final activveColor = Provider.of<_MenuModel>(context).activveColor;
    final inactiveColor = Provider.of<_MenuModel>(context).inactiveColor;
    return GestureDetector(
          onTap: (){
            Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = index;
          },
          behavior: HitTestBehavior.translucent,
          child: Container(
        child: Icon(
          item.icon,
          size: (itemSeleccionado == index) ? 35 : 25,
          color: (itemSeleccionado == index) ? activveColor : inactiveColor,
          ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier{

  int _itemSeleccionado = 0;

  Color _backgroundColor = Colors.white;
  Color _activveColor = Colors.black;
  Color _inactiveColor = Colors.blueGrey;

  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado (int index){
    this._itemSeleccionado = index;
    notifyListeners();
  }

  Color get backgroundColor => this._backgroundColor;

  set backgroundColor (Color backgroundColor){
    this._backgroundColor = backgroundColor;
    // notifyListeners();
  }

  Color get activveColor => this._activveColor;

  set activveColor (Color activveColor){
    this._activveColor = activveColor;
    // notifyListeners();
  }

  Color get inactiveColor => this._inactiveColor;

  set inactiveColor (Color inactiveColor){
    this._inactiveColor = inactiveColor;
    // notifyListeners();
  }
}