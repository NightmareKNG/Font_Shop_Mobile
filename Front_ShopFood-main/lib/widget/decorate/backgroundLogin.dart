import 'package:flutter/material.dart';

class BackgroundLogin extends StatelessWidget {
  const BackgroundLogin({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 150,
          left: 150,
          child: Image.asset(
            "assets/images/LoginLogo.png",
            fit: BoxFit.cover,
            width: 142,
            height: 142,
          ),
        ),
        Positioned(
          top: 40,
          left: 157,
          child: Image.asset(
            "assets/images/burger.png",
            fit: BoxFit.cover,
            width: 120,
            height: 120,
          ),
        ),
        Positioned(
          left: 89,
          bottom: 50,
          child: Image.asset(
            "assets/images/bakery.png",
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
        ),
        Positioned(
          right: 98,
          bottom: 100,
          child: Image.asset(
            "assets/images/spaghetti.png",
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
        ),
        child,
      ],
    );
  }
}
