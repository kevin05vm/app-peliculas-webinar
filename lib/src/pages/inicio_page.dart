
import 'package:app_peliculas/src/models/pelicula_model.dart';
import 'package:app_peliculas/src/provider/pelicula_provider.dart';
import 'package:flutter/material.dart';

class InicioPage extends StatelessWidget {

  final PeliculasProvider _peliculasProvider = new PeliculasProvider();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas'),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => print('Buscar')
          )
        ]
      ),
      body: Container(
        child: _cargarPeliculas()
      )
    );
  }

  Widget _cargarPeliculas() {
    /*List<Pelicula> _listaPeliculas = new List();

    Pelicula pelicula = new Pelicula();
    pelicula.title = 'Sonic';
    pelicula.voteAverage = 7.5;
    pelicula.overview = 'Descripción Descripción Descripción Descripción';
    pelicula.posterPath = 'https://image.tmdb.org/t/p/w500/jYbANSoj6qGTbDkstq9J5Vy8fRF.jpg';
    pelicula.backdropPath = 'https://image.tmdb.org/t/p/w500/stmYfCUGd8Iy6kAMBr6AmWqx8Bq.jpg';
    _listaPeliculas.add(pelicula);*/
    
    return FutureBuilder(
      future: _peliculasProvider.getPeliculas(),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if(snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              Pelicula pelicula = snapshot.data[index];
              return _cardPelicula(pelicula, context);
            }
          );
        }
        else {
          return Center(
            child: CircularProgressIndicator()
          );
        }
      }
    );

    /*return ListView.builder(
      itemCount: _listaPeliculas.length,
      itemBuilder: (context, index) {
        Pelicula pelicula = _listaPeliculas[index];
        return _cardPelicula(pelicula);
      }
    );*/
  }

  Widget _cardPelicula(Pelicula pelicula, BuildContext context) {
    final style1 = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold
    );
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'detalle-page', arguments: pelicula),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          children: <Widget>[
            Hero(
              tag: pelicula.posterPath,
              child: FadeInImage(
                image: NetworkImage(pelicula.posterPath),
                placeholder: AssetImage('assets/no-image.jpg'),
                fadeInDuration: Duration(milliseconds: 150),
                fit: BoxFit.cover,
                height: 250.0,
                width: double.infinity
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              child: Row(
                children: <Widget>[
                  Text(pelicula.title, style: style1),
                  Icon(Icons.star, color: Colors.yellow),
                  Text(pelicula.voteAverage.toString())
                ]
              )
            )
          ]
        )
      ),
    );
  }

}