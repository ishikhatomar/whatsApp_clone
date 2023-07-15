import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/app_resources/app_colors.dart';
import 'package:whatsapp_clone/app_resources/app_strings.dart';
import 'package:whatsapp_clone/app_resources/app_style.dart';
import 'package:whatsapp_clone/controller/auth_controller.dart';
import 'package:whatsapp_clone/view/auth/widget/custom_text_field.dart';
import 'package:whatsapp_clone/view/screens/user_info_screen.dart';
import '../../app_resources/app_dimension.dart';

class VerifyPhoneNumber extends StatelessWidget {
  VerifyPhoneNumber({super.key});
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.agreeBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.agreeBackgroundColor,
        elevation: 0,
        title: Text(AppString.verifyPhoneNumber, style: AppStyles.fontwhite),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppDimension.px20),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppDimension.px10),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(style: AppStyles.lineGrey, children: [
                    TextSpan(
                        text:
                            "You've tried to register ${authController.countryCodeController.value.text + authController.phoneNumberController.value.text}, before requesting an SMS or call with your code"),
                    TextSpan(text: "Wrong number?", style: AppStyles.linkblue)
                  ])),
            ),
            const SizedBox(
              height: AppDimension.px20,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppDimension.px80),
              child: CustomTextField(
                controller: authController.otpController.value,
                hintText: "- - -  - - -",
                fontSize: AppDimension.px30,
                autoFocus: true,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  authController.verifyOTP;
                },
              ),
            ),
            const SizedBox(
              height: AppDimension.px20,
            ),
            Text(
              AppString.enter6Digit,
              style: AppStyles.grey,
            ),
            const SizedBox(
              height: AppDimension.px30,
            ),
            Row(
              children: [
                Icon(
                  Icons.message,
                  color: AppColor.grey,
                ),
                const SizedBox(
                  width: AppDimension.px20,
                ),
                Text(
                  AppString.resendSMS,
                  style: AppStyles.grey,
                )
              ],
            ),
            const SizedBox(
              height: AppDimension.px10,
            ),
            Divider(
              color: AppColor.blue.withOpacity(AppDimension.px0_2),
            ),
            const SizedBox(
              height: AppDimension.px10,
            ),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  color: AppColor.grey,
                ),
                const SizedBox(
                  width: AppDimension.px20,
                ),
                Text(
                  AppString.callMe,
                  style: AppStyles.grey,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
