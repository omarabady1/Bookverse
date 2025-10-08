import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/splash/presentation/views/widgets/sliding_texts.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController slidingAnimationController;
  late AnimationController scaleAnimationController;
  late Animation<Offset> slidingAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    slidingAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    scaleAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    slidingAnimation = Tween<Offset>(begin: Offset(0, 9), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: slidingAnimationController,
            curve: Curves.decelerate,
          ),
        );

    scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: scaleAnimationController, curve: Curves.easeOutBack),
    );

    slidingAnimationController.forward();
    slidingAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        scaleAnimationController.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    slidingAnimationController.dispose();
    scaleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: Image.asset(AssetsData.logo),
        ),
        FirstSlidingText(slidingAnimation1: slidingAnimation),
        SecondSlidingText(slidingAnimation2: scaleAnimation),
      ],
    );
  }
}
