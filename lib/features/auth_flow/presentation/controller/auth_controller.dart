import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  ///>>>>>>>>>>>>>>>>>>>>>>>>>>>> Sign In <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<///
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  ///>>>>>>>>>>>>>>>>>>>>>>>>>>> Sing UP <<<<<<<<<<<<<<<<<<<<<<<<<<<<///

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController singUpEmailController = TextEditingController();
  final TextEditingController singUpPasswordController = TextEditingController();
  ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> set New Pass <<<<<<<<<<<<<<<<<<<<<<<///

  final TextEditingController newPassController = TextEditingController();
  final TextEditingController newConfirmPassController = TextEditingController();
}