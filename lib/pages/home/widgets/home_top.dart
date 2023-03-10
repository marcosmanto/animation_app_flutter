import 'package:flutter/material.dart';

import 'category_view.dart';

class HomeTop extends StatelessWidget {
  final Animation<double> containerGrow;
  const HomeTop({super.key, required this.containerGrow});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * .4,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Bem vindo, Marcos!',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
          Container(
            width: containerGrow.value * 120,
            height: containerGrow.value * 120,
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/perfil.png'),
              ),
            ),
            child: Container(
              width: containerGrow.value * 35,
              height: containerGrow.value * 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.secondary,
              ),
              margin: EdgeInsets.only(left: 80),
              child: Text(
                '2',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: containerGrow.value * 15,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          CategoryView()
        ],
      )),
    );
  }
}
