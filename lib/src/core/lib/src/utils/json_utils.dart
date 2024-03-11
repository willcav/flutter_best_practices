import 'dart:convert';

import 'typedef.dart';

class JsonUtils {
  static Json? parseFromString(String? jsonText) {
    if (jsonText == null || jsonText.isEmpty) return null;
    try {
      return Map<String, dynamic>.from(json.decode(jsonText));
    } catch (_) {
      return null;
    }
  }
}

class JsonListUtils {
  static JsonList? parseFromString(String? jsonText) {
    if (jsonText == null || jsonText.isEmpty) return null;
    try {
      return JsonList.from(json.decode(jsonText));
    } catch (_) {
      return null;
    }
  }
}
