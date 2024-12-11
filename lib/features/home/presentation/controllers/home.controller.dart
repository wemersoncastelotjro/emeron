import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:emeron/routes/app_routes.dart';
import 'package:emeron/features/home/domain/entities/menu.entity.dart';

class HomeController extends GetxController {
  List<MenuEntity> menuList = [
    MenuEntity(
      icon: Icons.calendar_month,
      label: 'Calendário de Cursos',
      route: AppRoutes.calendar,
      external: false,
    ),
    MenuEntity(
      icon: Icons.edit,
      label: 'Inscrições',
      route: AppRoutes.calendar,
      external: false,
    ),
    MenuEntity(
      icon: Icons.workspace_premium,
      label: 'Certificados',
      route: AppRoutes.calendar,
      external: false,
    ),
    MenuEntity(
      icon: Icons.collections_bookmark,
      label: 'Minha Biblioteca',
      route: AppRoutes.calendar,
      external: false,
    ),
    MenuEntity(
      icon: Icons.local_library,
      label: 'Ambiente Virtual',
      route: AppRoutes.calendar,
      external: false,
    ),
    MenuEntity(
      icon: Icons.language,
      label: 'Emeron Web',
      route: AppRoutes.calendar,
      external: false,
    ),
    MenuEntity(
      icon: Icons.chat,
      label: 'Fale Conosco',
      route: AppRoutes.calendar,
      external: false,
    ),
    MenuEntity(
      icon: Icons.admin_panel_settings,
      label: 'Área Restrita',
      route: AppRoutes.calendar,
      external: false,
    )
  ];
}
