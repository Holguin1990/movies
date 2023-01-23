
import 'package:flutter/material.dart';
import 'package:movies_app/widgets/widgets.dart';

// ignore: use_key_in_widget_constructors
class DetailScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    //Todo: Cambiar luego por una instancia de movie
  final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';


    return Scaffold(
      body: CustomScrollView(
         slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _OverView(),
              _OverView(),
              _OverView(),
              CastingCards()
             
            ])
            )
         ], 

      ) ,
      
    );
  }
}


class _CustomAppBar extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    //SliverAppBar es un widget para crear appbars pero con diferentes propiedades
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only( bottom: 10 ),
          color: Colors.black12,
          child: const Text(
            'movie.tittle',
             style: TextStyle( fontSize: 16 ), 
            ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
          ),
      ),


    );
  }
}


class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    
    return Container(
      margin: const EdgeInsets.only( top: 20),
      padding: const EdgeInsets.symmetric( horizontal: 20 ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 200,
            ),
          ),

          const SizedBox( width: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('movie.title',style:textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2),
              Text('movie.originalTitle',style: Theme.of(context).textTheme.subtitle1, overflow: TextOverflow.ellipsis),

              Row(
                children: [
                   const Icon(Icons.star_border_outlined, size: 20, color: Colors.grey),
                  const SizedBox( width: 5 ),
                  Text('movie.voteaverage', style: Theme.of(context).textTheme.caption)
                ],
              )
            ],
          )
        ],
      ),

    );
  }
}


class _OverView extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Text('Nostrud qui labore laborum mollit aute ullamco voluptate tempor eu. In labore est aute minim in deserunt sint veniam laboris. Reprehenderit Lorem ex nostrud nisi ex tempor est in in elit commodo enim excepteur enim. Cillum laborum minim nulla aliquip veniam incididunt excepteur proident cupidatat. Ipsum reprehenderit ex labore cillum aliquip consectetur incididunt nostrud incididunt fugiat et do do laborum. Laboris voluptate aliquip esse culpa id exercitation nisi aliqua ea quis enim adipisicing elit. Lorem eiusmod est sit occaecat enim magna exercitation ullamco do. Elit elit duis ex proident dolor Lorem reprehenderit id ex. Proident id ut ipsum laboris excepteur ullamco magna.',
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.subtitle1,
      )
      
    );
  }
}
