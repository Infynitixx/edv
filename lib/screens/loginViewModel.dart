import 'package:flutter/foundation.dart';
import 'package:edv/data/config.dart';


class LoginViewModel extends ChangeNotifier {
  final Configuration _configuration = Configuration();
  late Future<String> labelText; // Initialwert setzen

  Future<void> fetchLabelText() async {
    labelText = (await _configuration.urlLabel())! as Future<String>;
    notifyListeners();
  }
}