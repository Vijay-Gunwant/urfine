import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ur_fine/services/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;
  final double circle = 2 * 3.141;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _rotationAnimation = Tween<double>(
      begin: circle / 6, // Start rotation angle
      end: 0, // End rotation angle (2 * pi for a full circle)
    ).animate(_animationController);

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1,
    ).animate(_animationController);

    _animationController.forward();
    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed) {
        _animationController.stop();
      }
    });

    _checkLogin();
    super.initState();
  }
  _checkLogin() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        Future.delayed(const Duration(seconds: 4), () {
          Navigator.pushReplacementNamed(context, RouteGenerator.login);
        });
      } else {
        Future.delayed(const Duration(seconds: 4), () {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteGenerator.dashboard, ((route) => false),
              arguments: user.uid);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: Align(
          alignment: const Alignment(0.0, 0.0),
          child: ClipOval(
            child: AnimatedBuilder(
              animation: _rotationAnimation,
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _rotationAnimation.value,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: 200,
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}
