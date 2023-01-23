import 'package:flutter/material.dart';
 

 class MovieSlider extends StatelessWidget {

 
   @override
   Widget build(BuildContext context) {
     return Container(
      width: double.infinity,
      height: 250,
      child: Column(
        //ubicación del texto que es el children
        crossAxisAlignment: CrossAxisAlignment.start,
        //texto
        children: [
           const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Populares', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold ))
            ),
           //expanded es un widget para que el contenido tome el espacio disponible 
          //widget para crear la lista de tarjetas que se veran horizontalmente

         const SizedBox( height: 5),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: ( _ , int index) => _MoviePoster()
            ),
          ),
        ],
        ),
     );
   }
 }


//widget privado para sacar el expanded de el column
 class _MoviePoster extends StatelessWidget {
  
   @override
   Widget build(BuildContext context) {
     return Container(
        width: 130,
        height: 190,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [

            GestureDetector(
              onTap:  () => Navigator.pushNamed(context, 'details',arguments: ''),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: const FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'), 
                  image: NetworkImage('https://via.placeholder.com/300x400'),
                  width: 130,
                  height: 180,
                  fit: BoxFit.cover
                  ),
              ),
            ),

            const SizedBox( height: 5),

            const Text(
              'Harry potter y las reliquias de la muerte parte 2',
              maxLines: 2,  
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
        ]
      ),
    ) ;
   }
 }