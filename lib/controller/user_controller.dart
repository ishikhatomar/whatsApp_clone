import 'package:get/get.dart';
import 'package:whatsapp_clone/model/user_model.dart';

class UserController extends GetxController {
  Rx<UserModel> _user =  UserModel.fromSnap({}).obs;
 
 UserModel get  user => _user.value;

 set setUserData(value){
_user.value = value;
 }
 
}