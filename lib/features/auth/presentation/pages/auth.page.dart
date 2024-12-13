import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emeron/core/utils/constants/constants.dart';
import 'package:emeron/core/utils/widgets/default_stack.widgets.dart';
import 'package:emeron/features/auth/presentation/controllers/auth.controller.dart';
import 'package:emeron/core/utils/helpers/validators/formatters/cpf_input.formatter.dart';

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
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.25),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'login'.tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Obx(
                      () => TextInputWidget(
                        label: 'user',
                        errorText: controller.errorMessage.value,
                        controller: controller.cpfController,
                        onChanged: (value) => controller.validateCPF(value),
                        inputFormatters: [CPFInputFormatter()],
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Obx(() {
                      return TextInputWidget(
                        label: 'password',
                        errorText: controller.errorMessage.value,
                        controller: controller.passwordController,
                        obscureText: !controller.obscureText.value,
                        onPressed: () => controller.obscureText.toggle(),
                      );
                    }),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: OutlinedButton(
                        onPressed: () => controller.signIn(),
                        child: const Text('Login'),
                      ),
                    )
                  ]),
                )
              ],
            )),
      ),
    );
  }
}

class TextInputWidget extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String errorText;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onPressed;
  final bool password;
  final TextInputType? keyboardType;

  const TextInputWidget({
    super.key,
    this.obscureText = false,
    this.controller,
    this.onChanged,
    required this.errorText,
    this.inputFormatters,
    this.onPressed,
    required this.label,
    this.password = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label.tr,
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            obscureText: obscureText,
            controller: controller,
            style: TextStyle(
              color: Colors.blue.shade900,
            ),
            keyboardType: keyboardType,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: InputBorder.none,
              errorText: errorText,
              suffix: password
                  ? IconButton(
                      onPressed: onPressed,
                      icon: obscureText
                          ? Icon(
                              Icons.visibility,
                              color: Colors.blue.shade900,
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: Colors.blue.shade900,
                            ),
                    )
                  : null,
            ),
            inputFormatters: inputFormatters,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
