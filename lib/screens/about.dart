import 'package:flutter/material.dart';
import 'package:learning_app/utils/colors.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Code & Lens - Sobre Nosotros',
              style: TextStyle(
                color: ColorsUser.textPrimary,
                fontFamily: 'SpaceGrotesk',
                fontSize: 15,
              ),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: ColorsUser.textSecondary,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            )
          ]
        ),
        backgroundColor: ColorsUser.background,
      ),
      backgroundColor: ColorsUser.surface,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Mi Historia',
                style: TextStyle(
                  color: ColorsUser.textPrimary,
                  fontFamily: 'Lexend',
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Me llamo Claudio, soy un apasionado desarrollador de software, fotógrafo y filmmaker. Cuento con más de 24 años de experiencia como profesor, dedicados a enseñar y compartir conocimientos en diversas áreas creativas y tecnológicas.',
                        style: TextStyle(
                          color: ColorsUser.textSecondary,
                          fontFamily: 'Lexend',
                          fontSize: 14,
                        ),
                    ),
                    SizedBox(height: 10),
                    Text('Como desarrollador FullStack, domino tanto el FrontEnd como el BackEnd, trabajando con tecnologías como HTML5, CSS3, JavaScript, SCSS y frameworks como ReactJS y Angular para crear interfaces modernas y atractivas. En el BackEnd, tengo experiencia con NodeJS, ExpressJS, PHP, Laravel, y Spring Boot, tambien para el desarrollo de aplicaciones moviles utilizo tecnologías como Flutter y Kotlin, además de gestionar bases de datos SQL y NoSQL como MySQL y MongoDB.',
                      style: TextStyle(
                        color: ColorsUser.textSecondary,
                        fontFamily: 'Lexend',
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('En el ámbito visual, como fotógrafo y filmmaker, combino creatividad y técnica para capturar y contar historias únicas, lo que refleja mi interés por resolver desafíos complejos con soluciones innovadoras.',
                      style: TextStyle(
                        color: ColorsUser.textSecondary,
                        fontFamily: 'Lexend',
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('Mi objetivo es claro: compartir todo lo que he aprendido a lo largo de mi carrera y ayudar a otros a desarrollar sus habilidades en programación, fotografía y video. ¡Estoy aquí para guiarte en este emocionante viaje de aprendizaje y creación!',
                      style: TextStyle(
                        color: ColorsUser.textSecondary,
                        fontFamily: 'Lexend',
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}