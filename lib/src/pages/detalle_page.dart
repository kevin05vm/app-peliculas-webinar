import 'package:app_peliculas/src/models/pelicula_model.dart';
import 'package:flutter/material.dart';

class DetallePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Pelicula pelicula = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            _crearAppBar(pelicula),
            SliverList(
              delegate: SliverChildListDelegate([
                _crearContenido(pelicula)
              ])
            )
          ]
        )
      )
    );
  }

  Widget _crearAppBar(Pelicula pelicula) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: 200.0,
      elevation: 4.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0)
        ),
        background: FadeInImage(
          image: NetworkImage(pelicula.backdropPath),
          placeholder: AssetImage('assets/no-image.jpg'),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover
        )
      )
    );
  }

  Widget _crearContenido(Pelicula pelicula) {
    final style1 = TextStyle(
      fontSize: 16.0
    );
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: pelicula.posterPath,
                child: Image(
                  image: NetworkImage(pelicula.posterPath),
                  height: 130.0,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(pelicula.title, style: style1),
                    Row(
                      children: <Widget>[
                        Icon(Icons.star, color: Colors.yellow),
                        Text(pelicula.voteAverage.toString())
                      ]
                    )
                  ]
                )
              )
            ]
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            child: Text(pelicula.overview)
          ),
          SizedBox(
            height: 500.0,
          )
        ]
      )
    );
  }

}