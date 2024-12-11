import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:emeron/routes/app_pages.dart';
import 'package:emeron/routes/app_routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}
