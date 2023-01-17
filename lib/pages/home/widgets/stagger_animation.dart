import 'package:flutter/material.dart';

import 'home_top.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> containerGrow;

  StaggerAnimation({super.key, required this.controller})
      : containerGrow = CurvedAnimation(parent: controller, curve: Curves.ease);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedBuilder(
          animation: controller,
          builder: _buildAnimation,
        ),
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [HomeTop(containerGrow: containerGrow)],
    );
  }
}