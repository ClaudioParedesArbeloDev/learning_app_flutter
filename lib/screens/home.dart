import 'package:flutter/material.dart';
import 'package:learning_app/utils/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Code & Lens',
              style: TextStyle(
                color: ColorsUser.textPrimary,
                fontFamily: 'SpaceGrotesk',
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
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                _buildButton(
                  context: context,
                  image: 'assets/images/curso.png',
                  text: 'cursos',
                  route: '/cursos',
                  width: 320,
                  height: 100,
                  imageTop: -45,
                  imageLeft: -40,
                ),
                const SizedBox(height: 20),
                _buildButton(
                  context: context,
                  image: 'assets/images/blog.png',
                  text: 'blogs',
                  route: '/blogs',
                  width: 320,
                  height: 100,
                  imageTop: -45,
                  imageLeft: -40,
                ),
                const SizedBox(height: 20),
                _buildButton(
                  context: context,
                  image: 'assets/images/about.png',
                  text: 'sobre nosotros',
                  route: '/about',
                  width: 320,
                  height: 100,
                  imageTop: -45,
                  imageLeft: -40,
                ),
                const SizedBox(height: 20),
                _buildButton(
                  context: context,
                  image: 'assets/images/contact.png',
                  text: 'contacto',
                  route: '/contact',
                  width: 320,
                  height: 100,
                  imageTop: -45,
                  imageLeft: -40,
                ),
                const SizedBox(height: 20),
                _buildButton(
                  context: context,
                  image: 'assets/images/login.png',
                  text: 'Iniciar Sesion',
                  route: '/login',
                  width: 320,
                  height: 100,
                  imageTop: -45,
                  imageLeft: -40,
                ),
            ]
          ),
        )
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String image,
    required String text,
    required String route,
    required double width,
    required double height,
    required double imageTop,
    required double imageLeft,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: ColorsUser.primaryVariant,
          border: Border.all(
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Positioned(
              top: imageTop,
              left: imageLeft,
              child: Image.asset(
                image,
                width: 180,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              left: imageLeft + 120 + width * 0.3,
              right: 0,
              bottom: 0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  text,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: ColorsUser.surface,
                    fontFamily: 'SpaceGrotesk',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}