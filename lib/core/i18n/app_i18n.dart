import 'package:get/get.dart';
import 'package:emeron/core/i18n/translations/en_US/en_us.translations.dart';
import 'package:emeron/core/i18n/translations/pt_BR/pt_br.translations.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'pt_BR': ptBr,
        'en_US': enUs,
      };
}
