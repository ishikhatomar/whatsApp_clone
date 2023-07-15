import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/app_resources/app_colors.dart';
import 'package:whatsapp_clone/app_resources/app_dimension.dart';
import 'package:whatsapp_clone/app_resources/app_style.dart';
import 'package:whatsapp_clone/controller/auth_controller.dart';

import '../../../app_resources/app_icon.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key,  this.controller, this.hintText, this.readOnly, this.textAlign,  this.keyboardType, this.prefixText, this.onTap, this.suffixIcon, this.onChanged,  this.fontSize, this.autoFocus, });
  final TextEditingController? controller;
  final String? hintText;
  final bool? readOnly;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final String? prefixText;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final double? fontSize;
  final bool? autoFocus;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      readOnly: readOnly ?? false,
      textAlign: textAlign ?? TextAlign.center,
      keyboardType: readOnly == null ? keyboardType: null,
      onChanged: onChanged,
      style: TextStyle(
        color: AppColor.white, fontSize: fontSize
      ),
      autofocus: autoFocus ?? false,
      decoration: InputDecoration(
          isDense: true,
          prefixText: prefixText,
          suffix: suffixIcon,
          hintText: hintText,
          hintStyle:TextStyle(color: AppColor.grey),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.green),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.green, width: AppDimension.px2),
          )),
    );
  }
}
