import 'package:fluter_template/core/translations/languages/ar_languages.dart';
import 'package:get/get.dart';

import 'languages/en_languages.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {'ar_SA': ARLanguge.map, 'en_US': ENLanguge.map};
}

tr(String key) => key.tr;
