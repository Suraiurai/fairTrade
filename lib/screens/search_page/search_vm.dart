import 'package:flutter_riverpod/flutter_riverpod.dart';

final curInd = StateProvider<int>((ref) {
      return 0;
});


final gridHeight = StateProvider<double>((ref) {
      return 711;
});

final productCount = StateProvider<int>((ref) {
      return 5;
});

