import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/home/presentation/views/homeview.dart';
import 'package:bookly/features/splash/presentation/views/widgets/sliding_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    super.initState();
    initializeAnimations();
    navigateToHome();
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

  void initializeAnimations() {
    slidingAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    scaleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    slidingAnimation = Tween<Offset>(begin: Offset(0, 9), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: slidingAnimationController,
            curve: Curves.easeOutBack,
          ),
        );

    scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: scaleAnimationController,
        curve: Curves.easeOutBack,
      ),
    );

    slidingAnimationController.forward();
    slidingAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 200), () {
          scaleAnimationController.forward();
        });
      }
    });
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(
        () => HomeView(),
        transition: Transition.fade,
        duration: kTransitionDuration,
      );
    });
  }
}
