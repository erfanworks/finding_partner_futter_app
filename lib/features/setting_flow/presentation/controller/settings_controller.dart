import 'package:amychebbi/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  // ==================== Change Password State ====================
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isObscureCurrent = true;
  bool isObscureNew = true;
  bool isObscureConfirm = true;
  bool isPasswordLoading = false;

  void toggleObscureCurrent() {
    isObscureCurrent = !isObscureCurrent;
    update();
  }

  void toggleObscureNew() {
    isObscureNew = !isObscureNew;
    update();
  }

  void toggleObscureConfirm() {
    isObscureConfirm = !isObscureConfirm;
    update();
  }

  // void updatePassword() {

    // FocusManager.instance.primaryFocus?.unfocus();
    //
    // String currentPass = currentPasswordController.text;
    // String newPass = newPasswordController.text;
    // String confirmPass = confirmPasswordController.text;


    // isPasswordLoading = true;
    // update();
  // }

  // ==================== Notification Settings State ====================
  bool isGeneralNotificationOn = true;
  bool isSoundOn = false;

  void toggleGeneralNotification(bool value) {
    isGeneralNotificationOn = value;
    update();
  }

  void toggleSound(bool value) {
    isSoundOn = value;
    update();
  }

  @override
  void onClose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }



  // ==================== Delete Account State ====================
  final TextEditingController otpController = TextEditingController();
  bool isDeleteLoading = false;

  void deleteAccount() {
    String otp = otpController.text.trim();

    isDeleteLoading = true;
    update();

  }


}