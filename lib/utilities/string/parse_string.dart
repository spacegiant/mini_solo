import 'package:flutter/foundation.dart';

int parseString(String text) {
  try {
    int value = int.parse(text);
    return value;
  } catch (e) {
    if (kDebugMode) {
      print('parseString() failed. $e');
    }
    return 0;
  }
}
