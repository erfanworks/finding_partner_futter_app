import 'package:get/get.dart';

import '../../../../core/route/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 5), () async {
        Get.offAllNamed(AppRoutes.onBoardingScreen);
      }
    );
  }
}