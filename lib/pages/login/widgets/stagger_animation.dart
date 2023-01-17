import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> buttonSqueeze;
  final Animation<double> buttonZoomOut;

  StaggerAnimation({super.key, required this.controller})
      : buttonSqueeze = Tween<double>(begin: 320, end: 60).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0, .150, curve: Curves.easeOutExpo),
          ),
        ),
        buttonZoomOut = Tween<double>(begin: 60, end: 1000).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 1, curve: Curves.easeOutExpo),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: _buildAnimation);
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 50,
      ),
      child: InkWell(
        onTap: () {
          controller.forward();
        },
        child: Hero(
          tag: 'fade',
          child: buttonZoomOut.value <= 60
              ? Container(
                  width: buttonSqueeze.value.clamp(0, double.infinity),
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(247, 64, 106, 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: _buildInside(context),
                )
              : Container(
                  width: buttonZoomOut.value,
                  height: buttonZoomOut.value,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(247, 64, 106, 1.0),
                    shape: buttonZoomOut.value < 500
                        ? BoxShape.circle
                        : BoxShape.rectangle,
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildInside(BuildContext context) {
    if (buttonSqueeze.value > 100) {
      return Text(
        'Sign in',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w300,
          letterSpacing: .3,
        ),
      );
    } else {
      return CircularProgressIndicator(
        strokeWidth: 1,
      );
    }
  }
}
