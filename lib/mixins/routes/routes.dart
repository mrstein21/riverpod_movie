import 'package:flutter/cupertino.dart';
import 'package:movie_trial/ui/detail/detail_screen.dart';
import 'package:movie_trial/ui/home/home_screen.dart';

const String homeRoute="/home";
const String detailRoute="/detail";

final routesPage={
  homeRoute:(context)=>HomeScreen(),
  detailRoute:(context)=>DetailScreen()
};

goToDetail(BuildContext context,int id){
  Navigator.of(context).pushNamed(detailRoute,arguments: id.toString());
}