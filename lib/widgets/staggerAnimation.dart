import 'package:flutter/material.dart';
import 'package:kensa/common/constants/colors.dart';
import 'package:kensa/generated/i10n.dart';
class StaggerAnimation extends StatelessWidget {
  final VoidCallback onTap;
  final String titleButton;

  StaggerAnimation({
    Key key,
    this.buttonController,
    this.onTap,
    this.titleButton = "Sign In",
  })  : buttonSqueezeanimation = Tween(
    begin: 320.0,
    end: 50.0,
  ).animate(
    CurvedAnimation(
      parent: buttonController,
      curve: const Interval(
        0.0,
        0.150,
      ),
    ),
  ),
        containerCircleAnimation = EdgeInsetsTween(
          begin: const EdgeInsets.only(bottom: 30.0),
          end: const EdgeInsets.only(bottom: 0.0),
        ).animate(
          CurvedAnimation(
            parent: buttonController,
            curve: const Interval(
              0.500,
              0.800,
              curve: Curves.ease,
            ),
          ),
        ),
        super(key: key);

  final AnimationController buttonController;
  final Animation<EdgeInsets> containerCircleAnimation;
  final Animation buttonSqueezeanimation;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonSqueezeanimation.value,
        height: 50,
        alignment: FractionalOffset.center,
        decoration: BoxDecoration(
          color: kAmber,
          borderRadius: const BorderRadius.all(Radius.circular(25.0)),
        ),
        child: buttonSqueezeanimation.value > 75.0
            ? Text(
          S.of(context).loginCapitalization,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.3,
          ),
        )
            : const CircularProgressIndicator(
          value: null,
          strokeWidth: 1.0,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: buttonController,
    );
  }
}