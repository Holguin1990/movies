
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';


class CardSwiper extends StatelessWidget {
  
  final List<Movie> movies;

  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {

    /*variable en la cual se contiene el mediaquery que me trae las dimensiones de la pantalla que tiene,
     en el dispositivo que estoy usando en mi caso es un redmi 9t
    */
    final size = MediaQuery.of(context).size;


    return Container(
      width: double.infinity,
      height: size.height * 0.5,//aqui tomo el 50% de alto de la pantalla
      child: Swiper(
        itemCount: movies.length,
        layout   : SwiperLayout.STACK,
        itemWidth: size.width * 0.5,
        itemHeight: size.height * 0.4,
        itemBuilder: ( _ , int index ){

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',arguments: ''),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/300x400'),
                fit: BoxFit.cover,
                ),
            ),
          );
          
        }
      ),
    );
  }
}