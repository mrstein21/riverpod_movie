import 'package:flutter/cupertino.dart';
import 'package:movie_trial/mixins/dialog/toast.dart';
import 'package:movie_trial/model/detail_movie.dart';
import 'package:movie_trial/provider/movie_provider.dart';

class DetailViewModel extends ChangeNotifier{

  DetailViewModel(String id){
    loadData(id);
  }

  DetailMovie _detailMovie=DetailMovie();
  DetailMovie get detailMovie=>_detailMovie;

  bool _isLoading=false;
  bool get isLoading => _isLoading;

  void loadData(String id){
    _isLoading=true;
    notifyListeners();
    MovieProvider().geDetailMovie(id).then((value){
      _isLoading=false;
      _detailMovie=value;
      notifyListeners();
    }).onError((error, stackTrace) {
      showToast(error);
    });
  }
}