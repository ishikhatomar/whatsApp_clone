import 'package:flutter/material.dart';
import 'package:whatsapp_clone/app_resources/app_colors.dart';
import 'package:whatsapp_clone/app_resources/app_dimension.dart';

class AppStyles {
static const TextStyle regular =TextStyle();
static const TextStyle linkblue = TextStyle(color: AppColor.blue);
static const TextStyle grey = TextStyle(color:AppColor.grey, );
static const TextStyle lineGrey = TextStyle(color:AppColor.grey, height: AppDimension.px1_5 );
static const TextStyle fontwhite = TextStyle(color: AppColor.white);
static const TextStyle fontBlack = TextStyle(color: AppColor.black, fontSize: AppDimension.px16, fontWeight: FontWeight.w500);
static const TextStyle fontGreen = TextStyle(color: AppColor.green, fontWeight: FontWeight.w500);
static const TextStyle welcomeToWhatsappColor = TextStyle(color: AppColor.white, fontSize: AppDimension.px22, fontWeight: FontWeight.w500);

}