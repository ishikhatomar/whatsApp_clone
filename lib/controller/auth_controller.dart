import 'dart:convert';
import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/app_resources/app_colors.dart';
import 'package:whatsapp_clone/app_resources/app_dimension.dart';
import 'package:whatsapp_clone/app_resources/app_strings.dart';
import 'package:whatsapp_clone/app_resources/app_style.dart';
import 'package:whatsapp_clone/common/show_alert_dialog.dart';
import 'package:whatsapp_clone/view/auth/verify_phone_number.dart';
import 'package:whatsapp_clone/view/home_screen.dart';
import 'package:whatsapp_clone/view/screens/user_info_screen.dart';

class AuthController extends GetxController {
  Rx<TextEditingController> countryNameController =
      TextEditingController(text: "India").obs;
  Rx<TextEditingController> countryCodeController =
      TextEditingController(text: "+91").obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  String _verId = "";
  Rx<TextEditingController> otpController = TextEditingController().obs;

  showCountryCodePicker(context) {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      favorite: ["ET"],
      countryListTheme: CountryListThemeData(
        backgroundColor: AppColor.agreeBackgroundColor,
        bottomSheetHeight: AppDimension.px600,
        flagSize: AppDimension.px22,
        borderRadius: BorderRadius.circular(AppDimension.px20),
        textStyle: AppStyles.grey,
        inputDecoration: InputDecoration(
          hintStyle: AppStyles.fontwhite,
          labelStyle: AppStyles.grey,
          prefixIcon: const Icon(
            Icons.language,
            color: AppColor.greenarrow,
          ),
          hintText: AppString.searchCountry,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: AppColor.grey.withOpacity(AppDimension.px0_2)),
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.greenarrow)),
        ),
      ),
      onSelect: (Country country) {
        countryNameController.value = TextEditingController(text: country.name);
        countryCodeController.value =
            TextEditingController(text: "+" + country.phoneCode);
      },
    );
  }

  get verifyPhoneNumber async {
    String _phoneNumber =
        countryCodeController.value.text + phoneNumberController.value.text;
   
    if (phoneNumberController.value.text.isEmpty) {
      showAlertDialog(message: AppString.pleaseEnterPhone);
    }
     else if (phoneNumberController.value.text.length < 10) {
      showAlertDialog(
          message:
              " ${AppString.thePhoneNumberEntered} ${countryNameController.value.text}. \n\n ${AppString.includeArea} ");
    } else if (phoneNumberController.value.text.length > 10) {
      showAlertDialog(
          message:
              "${AppString.numberEnteredTooLong} ${countryNameController.value.text}");
    } else {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: _phoneNumber,
          verificationCompleted: (AuthCredential authCred) {},
          verificationFailed: (FirebaseAuthException authException) {},
          codeSent: (String? verificationId, [int? forcecodersent]) async {
            _verId = verificationId!;
            Get.to(VerifyPhoneNumber());
          },
          codeAutoRetrievalTimeout: (String? verificationId) {});
    }
  }

  get verifyOTP async {
    if (otpController.value.text.length > 5) {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: _verId, smsCode: otpController.value.text),
      );
      if (FirebaseAuth.instance.currentUser != null) {
        Get.offAll(UserInfoScreen());
      }
    }
  }
}
