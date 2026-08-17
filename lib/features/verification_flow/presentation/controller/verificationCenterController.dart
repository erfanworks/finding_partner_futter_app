import 'package:get/get.dart';

class VerificationCenterController extends GetxController {
  final int completedSteps = 2;
  final int totalSteps = 3;
  final String currentStatus = 'Verified';

  // Verification States
  final RxBool isIdentityVerified = true.obs;
  final RxBool isCriminalCheckUploaded = false.obs;

  void onUploadCriminalRecord() {
    // Record upload logic
  }
}