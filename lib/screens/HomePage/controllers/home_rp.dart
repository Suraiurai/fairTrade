import 'package:dubai_project/screens/HomePage/controllers/home_rp_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterNum = StateProvider<int>((ref) {
      return 0;
});


final counterNumWithChangeNot = ChangeNotifierProvider<RiverpodModel>((ref){
    return RiverpodModel(counter: 0);
});