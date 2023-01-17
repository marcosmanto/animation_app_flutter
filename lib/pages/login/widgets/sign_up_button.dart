import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: const EdgeInsets.only(top: 160),
        foregroundColor: Colors.white,
        textStyle: TextStyle(
            fontSize: 16, letterSpacing: .5, fontWeight: FontWeight.w300),
      ),
      child: Text(
        'Não possui uma conta? Cadastre-se',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
