import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_trial/ui/detail/view_model/detail_view_model.dart';
import 'package:movie_trial/ui/home/view_model/home_view_model.dart';

final homeViewModel = ChangeNotifierProvider((_) => HomeViewModel());

final detailViewModel= ChangeNotifierProvider
    .family<DetailViewModel,String>((_,String id)=>DetailViewModel(id.toString()));

