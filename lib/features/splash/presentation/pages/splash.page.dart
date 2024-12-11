import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:emeron/core/utils/constants/constants.dart';
import 'package:emeron/core/utils/widgets/default_stack.widgets.dart';
import 'package:emeron/features/splash/presentation/controllers/splash.controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultStack(
        child: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
