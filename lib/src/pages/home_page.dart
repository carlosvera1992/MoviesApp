import 'package:flutter/material.dart';
import 'package:peliculas/src/provides/peliculas_provider.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  
  // const HomePage({Key key}) : super(key: key);
  
  final peliculasProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Películas en cines'),
          backgroundColor: Colors.indigoAccent,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {})
          ],
        ),
        body: Container(
            child: Column(
          children: <Widget>[_swiperTarjetas()],
        )));
  }

  Widget _swiperTarjetas() {
    
      return FutureBuilder(
        future: peliculasProvider.getEncines(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        
          if ( snapshot.hasData ){
            return CardSwiper( peliculas: snapshot.data); 
          }else{
            return Container(
              height: 450.0,
              child: Center(
                child: CircularProgressIndicator()
              )
            );
          }

          
        },
      );

    // peliculasProvider.getEncines();

    
  }
}
