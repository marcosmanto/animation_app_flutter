import 'package:flutter/material.dart';

import 'animated_list_view.dart';
import 'home_top.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> containerGrow;
  final Animation<EdgeInsets> listSlidePosition;

  StaggerAnimation({super.key, required this.controller})
      : containerGrow = CurvedAnimation(
          parent: controller,
          curve: Curves.ease,
        ),
        listSlidePosition = EdgeInsetsTween(
          begin: EdgeInsets.only(bottom: 0),
          end: EdgeInsets.only(
            bottom: 80,
          ),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(.325, .8, curve: Curves.easeInOutExpo),
          ),
        );

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
      children: [
        HomeTop(containerGrow: containerGrow),
        AnimatedListView(
          listSlidePosition: listSlidePosition,
        )
      ],
    );
  }
}
