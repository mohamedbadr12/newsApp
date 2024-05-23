import 'package:flutter/cupertino.dart';

class SizeConfig{
  static const double desktop=1200;
  static const double tablet=800;

  static late double height,width;


  static init(BuildContext context){
    height=MediaQuery.sizeOf(context).height;
    width=MediaQuery.sizeOf(context).width;

  }
}