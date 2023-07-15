import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/app_resources/app_colors.dart';
import 'package:whatsapp_clone/app_resources/app_dimension.dart';
import 'package:whatsapp_clone/app_resources/app_icon.dart';
import 'package:whatsapp_clone/app_resources/app_strings.dart';
import 'package:whatsapp_clone/app_resources/app_style.dart';
import 'package:whatsapp_clone/controller/initial_screen_controller.dart';

import 'login_screen.dart';

class AgreeAndContinue extends StatelessWidget {
   AgreeAndContinue({super.key});

 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColor.agreeBackgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: AppDimension.px20),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: AppDimension.px70,
              ),
              Container(
                height: AppDimension.px250,
                width: AppDimension.px250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.white,
                ),
              ),
              const SizedBox(
                height: AppDimension.px35,
              ),
              Text(
                AppString.welcomeToWhatsapp,
                style: AppStyles.welcomeToWhatsappColor,
              ),
              const SizedBox(
                height: AppDimension.px20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppString.readOur,
                    style: AppStyles.lineGrey,
                  ),
                  Text(
                    AppString.privacyPolicy,
                    style: AppStyles.linkblue,
                  ),
                  Text(
                    AppString.tapAgree,
                    style: AppStyles.lineGrey,
                  ),
                ],
              ),
              const SizedBox(
                height: AppDimension.px5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppString.acceptThe,
                    style: AppStyles.lineGrey,
                  ),
                  Text(
                    AppString.termsOfService,
                    style: AppStyles.linkblue,
                  ),
                ],
              ),
              const SizedBox(
                height: AppDimension.px30,
              ),
              InkWell(
                onTap: () {
                  Get.to(loginScreen());
                },
                child: Container(
                  height: AppDimension.px45,
                  width: AppDimension.px280,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppDimension.px25),
                      color: AppColor.secondaryColor),
                  child: Center(
                    child: Text(
                      AppString.agreeAndContinue,
                      style: AppStyles.fontBlack,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: AppDimension.px70,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: AppDimension.px40,
                width: AppDimension.px150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimension.px25),
                    color: AppColor.black182),
                child: Row(
                  children: [
                    Icon(
                      Icons.language,
                      color: AppColor.greenarrow,
                    ),
                    const SizedBox(
                      width: AppDimension.px10,
                    ),
                    Text(
                      AppString.english,
                      style: AppStyles.fontGreen,
                    ),
                    const SizedBox(
                      width: AppDimension.px20,
                    ),
                    SvgPicture.asset(
                      AppIcons.arrowDown,
                      colorFilter: ColorFilter.mode(
                          AppColor.greenarrow, BlendMode.srcIn),
                      height: AppDimension.px10,
                      width: AppDimension.px10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
