import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchIndex = StateProvider<int>((ref) {
      return 0;
});