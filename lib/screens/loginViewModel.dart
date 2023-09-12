import 'package:flutter/foundation.dart';
import 'package:edv/data/config.dart';

class LoginViewModel extends ChangeNotifier {
  final Configuration _configuration = Configuration();
  late String labelText = '';

  Future<void> fetchLabelText() async {
    final label = await _configuration.urlLabel() ?? '';
    labelText = label;
    notifyListeners();
  }
  Future<void> setUrl(String url) async {
    await _configuration.setUrl(url);
    notifyListeners();
  }

  Future<int> testUrl() async {
    return await _configuration.testUrl();
  }
}