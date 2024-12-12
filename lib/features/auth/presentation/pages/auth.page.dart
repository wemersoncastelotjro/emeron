import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:emeron/core/utils/constants/constants.dart';
import 'package:emeron/core/utils/widgets/default_stack.widgets.dart';
import 'package:emeron/features/auth/presentation/controllers/auth.controller.dart';

class AuthPage extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultStack(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: Image.asset(AppImages.logo),
                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 286,
                  height: 286,
                )
              ],
            )),
      ),
    );
  }
}
