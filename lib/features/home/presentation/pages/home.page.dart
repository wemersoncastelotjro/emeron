import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emeron/core/utils/constants/image.constants.dart';
import 'package:emeron/core/utils/widgets/default_stack.widgets.dart';
import 'package:emeron/features/home/presentation/controllers/home.controller.dart';
import 'package:emeron/features/home/presentation/widgets/menu_item_list.widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultStack(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 64),
                  child: Image.asset(AppImages.logo),
                ),
                Wrap(
                  alignment: WrapAlignment.start,
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
                          child: MenuItemListWidget(menu: menu),
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
