import 'package:amychebbi/features/auth_flow/presentation/controller/auth_controller.dart';
import 'package:amychebbi/features/auth_flow/presentation/screen/forgot_password_screen.dart';
import 'package:amychebbi/features/auth_flow/presentation/screen/registration_success_screen.dart';
import 'package:amychebbi/features/auth_flow/presentation/screen/set_new_password_screen.dart';
import 'package:amychebbi/features/auth_flow/presentation/screen/sign_up_screen.dart';
import 'package:amychebbi/features/auth_flow/presentation/screen/verification_screen.dart';
import 'package:amychebbi/features/categrory_select_flow/presentation/controller/categorie_search_controller.dart';
import 'package:amychebbi/features/community_feed/presentation/controller/community_feed_controller.dart';
import 'package:amychebbi/features/community_feed/presentation/screen/community_feed_screen.dart';
import 'package:amychebbi/features/componingBooking/presentation/screen/review_booking_screen.dart';
import 'package:amychebbi/features/componingBooking/presentation/screen/select_date_screen.dart';
import 'package:amychebbi/features/home_flow/presentation/screen/search_screen.dart';
import 'package:amychebbi/features/leader_board/presentation/controller/leader_board_controller.dart';
import 'package:amychebbi/features/leader_board/presentation/screen/leader_board_screen.dart';
import 'package:amychebbi/features/my_booking/presentaiton/screen/my_booking_screen.dart';
import 'package:amychebbi/features/profile_setUp_flow/presentation/controller/profile_set_up_controller.dart';
import 'package:amychebbi/features/profile_setUp_flow/presentation/screen/profile_set_up_main_screen.dart';
import 'package:amychebbi/features/request_details/presentation/controller/request_details_controller.dart';
import 'package:amychebbi/features/request_details/presentation/screen/request_details_screen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../features/auth_flow/presentation/screen/login_screen.dart';
import '../../features/categrory_select_flow/presentation/screen/category_search_screen.dart';
import '../../features/community_feed/presentation/controller/create_post_controller.dart';
import '../../features/community_feed/presentation/screen/create_post_screen.dart';
import '../../features/componingBooking/presentation/controller/componing_details_controller.dart';
import '../../features/componingBooking/presentation/controller/review_booking_controller.dart';
import '../../features/componingBooking/presentation/screen/componing_booking_screen.dart';
import '../../features/componingBooking/presentation/screen/componing_details_screen.dart';
import '../../features/home_flow/presentation/screen/categorie_screen.dart';
import '../../features/home_flow/presentation/screen/home_screen.dart';
import '../../features/onboarding/presentation/screen/onboarding_screen.dart';
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
  static const String homescreen = '/homescreen';
  static const String leaderBoardScreen = '/leaderBoardScreen';
  static const String myBookingScreen = '/myBookingScreen';
  static const String companionBookingsScreen = '/companionBookingsScreen';
  static const String requestDetailsScreen = '/requestDetailsScreen';
  static const String communityFeedScreen = '/communityFeedScreen';
  static const String categoriesScreen = '/categoriesScreen';
  static const String companionDetailsScreen = '/companionDetailsScreen';
  static const String categorySearchScreen = '/categorySearchScreen';
  static const String searchScreen = '/searchScreen';
  static const String selectDateTimeScreen = '/selectDateTimeScreen';
  static const String reviewBookingScreen = '/reviewBookingScreen';
  static const String createPostScreen = '/createPostScreen';


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
      name: AppRoutes.homescreen,
      page: () => HomeScreen(),
      binding: BindingsBuilder((){
        // Get.put<ProfileSetUpController>(ProfileSetUpController());
      }),
    ),
    GetPage(
      name: AppRoutes.mainProfileSetupScreen,
      page: () => ProfileSetupMainScreen(),
      binding: BindingsBuilder((){
        Get.put<ProfileSetUpController>(ProfileSetUpController());
      }),
    ),
    GetPage(
      name: AppRoutes.leaderBoardScreen,
      page: () => LeaderboardScreen(),
      binding: BindingsBuilder((){
        Get.put<LeaderboardController>(LeaderboardController());
      }),
    ),
    GetPage(
      name: AppRoutes.myBookingScreen,
      page: () => MyBookingsScreen(),
      binding: BindingsBuilder((){
        Get.put<LeaderboardController>(LeaderboardController());
      }),
    ),
    GetPage(
      name: AppRoutes.companionBookingsScreen,
      page: () => CompanionBookingsScreen(),
      binding: BindingsBuilder((){
        Get.put<LeaderboardController>(LeaderboardController());
      }),
    ),
    GetPage(
      name: AppRoutes.requestDetailsScreen,
      page: () => RequestDetailsScreen(),
      binding: BindingsBuilder((){
        Get.put<RequestDetailsController>(RequestDetailsController());
      }),
    ),
    GetPage(
      name: AppRoutes.communityFeedScreen,
      page: () => CommunityFeedScreen(),
      binding: BindingsBuilder((){
        Get.put<CommunityFeedController>(CommunityFeedController());
      }),
    ),
    GetPage(
      name: AppRoutes.categoriesScreen,
      page: () => CategoriesScreen(),
      binding: BindingsBuilder((){
        // Get.put<CommunityFeedController>(CommunityFeedController());
      }),
    ),
    GetPage(
      name: AppRoutes.companionDetailsScreen,
      page: () => CompanionDetailsScreen(),
      binding: BindingsBuilder((){
        Get.put<CompanionDetailsController>(CompanionDetailsController());
      }),
    ),
    GetPage(
      name: AppRoutes.categorySearchScreen,
      page: () => CategorySearchScreen(),
      binding: BindingsBuilder((){
        Get.put<CategorySearchController>(CategorySearchController());
      }),
    ),
    GetPage(
      name: AppRoutes.searchScreen,
      page: () => SearchScreen(),
      binding: BindingsBuilder((){
        // Get.put<CategorySearchController>(CategorySearchController());
      }),
    ),
    GetPage(
      name: AppRoutes.selectDateTimeScreen,
      page: () => SelectDateTimeScreen(),
      binding: BindingsBuilder((){
        // Get.put<CategorySearchController>(CategorySearchController());
      }),
    ),
    GetPage(
      name: AppRoutes.reviewBookingScreen,
      page: () => ReviewBookingScreen(),
      binding: BindingsBuilder((){
        Get.put<ReviewBookingController>(ReviewBookingController());
      }),
    ),
    GetPage(
      name: AppRoutes.createPostScreen,
      page: () => CreatePostScreen(),
      binding: BindingsBuilder((){
        Get.put<CreatePostController>(CreatePostController());
      }),
    ),
  ];
}