import 'package:amychebbi/features/auth_flow/presentation/controller/auth_controller.dart';
import 'package:amychebbi/features/auth_flow/presentation/screen/forgot_password_screen.dart';
import 'package:amychebbi/features/auth_flow/presentation/screen/registration_success_screen.dart';
import 'package:amychebbi/features/auth_flow/presentation/screen/set_new_password_screen.dart';
import 'package:amychebbi/features/auth_flow/presentation/screen/sign_up_screen.dart';
import 'package:amychebbi/features/auth_flow/presentation/screen/verification_screen.dart';
import 'package:amychebbi/features/profile_setUp_flow/presentation/controller/profile_set_up_controller.dart';
import 'package:amychebbi/features/profile_setUp_flow/presentation/screen/based_screen.dart';
import 'package:amychebbi/features/profile_setUp_flow/presentation/screen/profile_set_up_main_screen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../features/auth_flow/presentation/screen/login_screen.dart';
import '../../features/onboarding/presentation/screen/onboarding_screen.dart';
import '../../features/profile_setUp_flow/presentation/screen/gender_screen.dart';
import '../../features/splash/presentation/screen/splash_screen.dart';


class AppRoutes {
  static const String splashScreen = "/splashScreen";
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String logInScreen = '/logInScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String verificationScreen = '/verificationScreen';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';
  static const String setNewPasswordScreen = '/setNewPasswordScreen';
  static const String registrationSuccessScreen = '/registrationSuccessScreen';
  static const String mainProfileSetupScreen = '/mainProfileSetupScreen';
  static const String basedScreen = '/basedScreen';
  static const String genderScreen = '/genderScreen';


  static List<GetPage> routes = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<SplashController>(() => SplashController());
        // Get.put<SplashController>(SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.onBoardingScreen,
      page: () => OnboardingScreen(),
      binding: BindingsBuilder((){
        // Get.put<>(SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.logInScreen,
      page: () => SignInScreen(),
      binding: BindingsBuilder((){
        // Get.lazyPut<OnboardingController>(() => OnboardingController());
        Get.put<AuthController>(AuthController());
      }),
    ),
    GetPage(
      name: AppRoutes.signUpScreen,
      page: () => SignUpScreen(),
      binding: BindingsBuilder((){
        Get.put<AuthController>(AuthController());
      }),
    ),
    GetPage(
      name: AppRoutes.verificationScreen,
      page: () => VerificationScreen(),
      binding: BindingsBuilder((){
        Get.put<AuthController>(AuthController());
      }),
    ),
    GetPage(
      name: AppRoutes.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      binding: BindingsBuilder((){
        Get.put<AuthController>(AuthController());
      }),
    ),
    GetPage(
      name: AppRoutes.setNewPasswordScreen,
      page: () => SetNewPasswordScreen(),
      binding: BindingsBuilder((){
        Get.put<AuthController>(AuthController());
      }),
    ),
    GetPage(
      name: AppRoutes.registrationSuccessScreen,
      page: () => RegistrationSuccessScreen(),
      binding: BindingsBuilder((){
        Get.put<AuthController>(AuthController());
      }),
    ),
    GetPage(
      name: AppRoutes.basedScreen,
      page: () => BasedScreen(),
      binding: BindingsBuilder((){
        Get.put<ProfileSetUpController>(ProfileSetUpController());
      }),
    ),
    GetPage(
      name: AppRoutes.genderScreen,
      page: () => GenderScreen(),
      binding: BindingsBuilder((){
        Get.put<ProfileSetUpController>(ProfileSetUpController());
      }),
    ),
    GetPage(
      name: AppRoutes.mainProfileSetupScreen,
      page: () => MainProfileSetupScreen(),
      binding: BindingsBuilder((){
        Get.put<ProfileSetUpController>(ProfileSetUpController());
      }),
    ),

  ];
}