// lib/utils/json_parser.dart

import '../models/android_version.dart';

List<AndroidVerison> parseJson(dynamic jsonData) {
  List<AndroidVerison> versions = [];

  jsonData.forEach((element) {
    if (element is Map) {
      element.forEach((_, value) {
        if (value is Map) {
          versions.add(AndroidVerison(id: value['id'], title: value['title']));
        }
      });
    } else if (element is List) {
      element.forEach((item) {
        if (item is Map) {
          versions.add(AndroidVerison(id: item['id'], title: item['title']));
        }
      });
    }
  });

  return versions;
}
