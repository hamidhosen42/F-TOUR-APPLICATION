import 'package:get/get.dart';

import '../screen/languages/ban.dart';
import '../screen/languages/eng.dart';
class AppLanguages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': eng,
        'bn_BD': ban,
      };
}