import 'package:country_picker/country_picker.dart';
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
import 'package:whatsapp_clone/controller/auth_controller.dart';
import 'package:whatsapp_clone/view/auth/widget/custom_text_field.dart';

class loginScreen extends StatelessWidget {
  loginScreen({super.key});

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.agreeBackgroundColor,
          title: Text(
            AppString.enterphonenumber,
            style: AppStyles.fontwhite,
          ),
          centerTitle: true, //learnt new
          actions: [
            IconButton(
                onPressed: () {},
                splashColor: Colors.transparent,
                splashRadius: AppDimension.px22,
                iconSize: AppDimension.px22,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: AppDimension.px40),
                icon: Icon(
                  Icons.more_vert,
                ))
          ]),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        color: AppColor.agreeBackgroundColor,
        child: Column(
          children: [
            RichText(
              textAlign: TextAlign.center, //learnt new
              text: const TextSpan(
                  text: AppString.whatsAppWillNeed,
                  style: AppStyles.fontwhite,
                  children: [
                    TextSpan(
                      text: AppString.whatsMyNumber,
                      style: AppStyles.linkblue,
                    ),
                  ]),
            ),
            const SizedBox(
              height: AppDimension.px10,
            ),
            Obx(
              () => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimension.px50),
                    child: CustomTextField(
                      onTap: () => authController.showCountryCodePicker(context),
                      controller: authController.countryNameController.value,
                      readOnly: true,
                      suffixIcon: SvgPicture.asset(
                        AppIcons.arrowDown,
                        colorFilter: ColorFilter.mode(
                            AppColor.greenarrow, BlendMode.srcIn),
                        height: AppDimension.px10,
                        width: AppDimension.px10,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppDimension.px10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimension.px50),
                    child: Row(
                      children: [
                        SizedBox(
                          width: AppDimension.px70,
                          child: CustomTextField(
                            controller:
                                authController.countryCodeController.value,
                            readOnly: true,
                          ),
                        ),
                        const SizedBox(
                          width: AppDimension.px10,
                        ),
                        Expanded(
                            child: CustomTextField(
                          controller:
                              authController.phoneNumberController.value,
                          hintText: " Phone Number",
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.number,
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppDimension.px20,
            ),
            Text(AppString.carrierCharges,
                style: TextStyle(color: AppColor.grey)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
          width: AppDimension.px90,
          child: ElevatedButton(
            onPressed: () {
              authController.verifyPhoneNumber;
            },
            child: Text(AppString.next),
          )),
    );
  }
}
