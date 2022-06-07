import 'package:flutter/cupertino.dart';
import 'package:movie_trial/mixins/dialog/toast.dart';
import 'package:movie_trial/model/movie.dart';
import 'package:movie_trial/model/res/movie_res.dart';
import 'package:movie_trial/provider/movie_provider.dart';

class HomeViewModel extends ChangeNotifier{
  List<Movie>_items= <Movie>[];
  List<Movie> get items=>_items;
  HomeViewModel(){
    loadData();
  }

  bool _isLoading=false;
  bool get isLoading=>_isLoading;

  bool _isNoLoadMore=false;
  bool get isNoLoadMore=>_isNoLoadMore;

  int _page=1;

  int getItemLength(){
    if(_isNoLoadMore==true){
      return _items.length;
    }
    return _items.length+1;
  }

  void loadData({bool refresh=false}){
    if(refresh==true){
      _isNoLoadMore=false;
      _page=1;
      _items.clear();
    }
    _isLoading=true;
    notifyListeners();
     MovieProvider().getTopRatedMovie(_page).then((MovieRes res){
      _isLoading=false;
      if(res.results!.isEmpty){
        _isNoLoadMore=true;
      }
      if(res.results!.isNotEmpty){
        _page++;
        _items.addAll(res.results!);
      }
      notifyListeners();
    }).onError((error, stackTrace){
       showToast(error);
    });
  }

}