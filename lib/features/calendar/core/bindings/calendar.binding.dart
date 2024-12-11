import 'package:get/get.dart';
import 'package:emeron/features/calendar/presentation/controllers/calendar.controller.dart';

class CalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CalendarController());
  }
}
