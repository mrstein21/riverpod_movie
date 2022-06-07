import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_trial/mixins/network/error_handling.dart';
import 'package:movie_trial/mixins/style/color.dart';

void showToast(value){
  String message="";
  if(value is ErrorHandling){
    message=value.message;
  }else{
    message=value.toString();
  }
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: kColorBlack,
      textColor: kColorWhite
  );
}