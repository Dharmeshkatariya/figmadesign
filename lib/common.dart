import 'dart:ui';
import 'package:flutter/cupertino.dart';

class Common{

  static Widget customText({String? text,double? fontSize,FontWeight? fontWeight,Color? color}){
    return Text(text!,style: TextStyle(
      fontSize: fontSize,

      fontWeight: fontWeight,
      color: color,
    )
    );

}

static Widget containerButton({Color? color, BorderRadiusGeometry? borderRadius,Widget? child,}){
    return Container(
      alignment: Alignment.center,
    margin:const  EdgeInsets.symmetric(horizontal: 5,vertical: 10),
    padding:const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: child,
    );
}

}