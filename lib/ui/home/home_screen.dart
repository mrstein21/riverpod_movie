import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_trial/mixins/style/color.dart';
import 'package:movie_trial/mixins/style/text.dart';
import 'package:movie_trial/riverpod_change_notifier.dart';
import 'package:movie_trial/ui/home/widgets/loading_view.dart';
import 'package:movie_trial/ui/home/widgets/movie_view.dart';



class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var state=ref.watch(homeViewModel);
    return Scaffold(
      backgroundColor:kColorDark,
      appBar: AppBar(
        backgroundColor: kColorBlack,
        title: Text("Top Rated Movie",style: kTextAveHev16,),
      ),
      body: state.items.isEmpty?
      LoadingView():
      NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollNotification){
          if(scrollNotification.metrics.pixels==scrollNotification.metrics.maxScrollExtent){
            if(state.isNoLoadMore==false){
              if(state.isLoading==false){
                state.loadData();
              }
            }
          }
          return true;
        },
        child: RefreshIndicator(
          onRefresh: ()async{
            state.loadData(refresh: true);
          },
          child: ListView.builder(
              itemCount: state.getItemLength(),
              itemBuilder: (BuildContext context,int index){
                if(index<state.items.length){
                  return MovieView(movie:state.items[index]);
                }else{
                  return LoadingView();
                }
              }
          ),
        ),
      ),
    );
  }
}
