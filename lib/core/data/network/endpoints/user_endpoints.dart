

import 'package:fluter_template/core/data/network/network_config.dart';

class UserEndpoints {
  static String login = NetworkConfig().getFullApiRout('user/login');
  static String register = NetworkConfig().getFullApiRout('user/register');
}
