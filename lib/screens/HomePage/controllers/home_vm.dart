import 'dart:convert';
import 'package:dubai_project/screens/MapPage/map_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';


final jsonLoaderProvider = Provider((ref) => JsonLoader());

class JsonLoader {
  Future<List<dynamic>> loadJsonFromAssets(String filePath, WidgetRef ref) async {
    String jsonString = await rootBundle.loadString(filePath);
    ref.read(dataLoaded.notifier).state = true; 
    return jsonDecode(jsonString);
  }
}
