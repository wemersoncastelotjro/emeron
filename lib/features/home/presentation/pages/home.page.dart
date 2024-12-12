import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emeron/core/utils/constants/image.constants.dart';
import 'package:emeron/core/utils/widgets/default_stack.widgets.dart';
import 'package:emeron/features/home/presentation/controllers/home.controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultStack(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 64),
                  child: Image.asset(AppImages.logo),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.horizontal,
                  spacing: 10,
                  runSpacing: 10,
                  children: controller.menuList
                      .map(
                        (menu) => GestureDetector(
                          onTap: () => menu.external
                              ? Get.showSnackbar(
                                  const GetSnackBar(
                                    titleText: Text('Rota Externa'),
                                    messageText: Text('Essa rota vai para um browser'),
                                    duration: Durations.extralong4,
                                    backgroundColor: Colors.white,
                                    snackPosition: SnackPosition.TOP,
                                  ),
                                )
                              : Get.toNamed(menu.route),
                          child: Container(
                            width: 135,
                            height: 135,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.25),
                              borderRadius: BorderRadius.circular(19),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  menu.icon,
                                  size: 48,
                                  color: Colors.white,
                                ),
                                Text(
                                  menu.label,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.clip,
                                  style: GoogleFonts.roboto(
                                      fontSize: 16, color: Colors.white, fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
