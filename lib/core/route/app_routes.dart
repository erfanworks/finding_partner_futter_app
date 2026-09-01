import 'package:amychebbi/features/auth_flow/presentation/controller/auth_controller.dart';
import 'package:amychebbi/features/auth_flow/presentation/screen/forgot_password_screen.dart';
import 'package:amychebbi/features/auth_flow/presentation/screen/registration_success_screen.dart';
import 'package:amychebbi/features/auth_flow/presentation/screen/set_new_password_screen.dart';
import 'package:amychebbi/features/auth_flow/presentation/screen/sign_up_screen.dart';
import 'package:amychebbi/features/auth_flow/presentation/screen/verification_screen.dart';
import 'package:amychebbi/features/availability/presentaion/controller/availabilityController.dart';
import 'package:amychebbi/features/availability/presentaion/screen/avilability_screen.dart';
import 'package:amychebbi/features/booking_history_flow/presentation/controller/booking_history_controller.dart';
import 'package:amychebbi/features/booking_history_flow/presentation/screen/booking_history_screen.dart';
import 'package:amychebbi/features/categrory_select_flow/presentation/controller/categorie_search_controller.dart';
import 'package:amychebbi/features/community_feed/presentation/controller/community_feed_controller.dart';
import 'package:amychebbi/features/community_feed/presentation/screen/community_feed_screen.dart';
import 'package:amychebbi/features/componingBooking/presentation/screen/review_booking_screen.dart';
import 'package:amychebbi/features/componingBooking/presentation/screen/select_date_screen.dart';
import 'package:amychebbi/features/explore_flow/presentation/controller/explore_controller.dart';
import 'package:amychebbi/features/explore_flow/presentation/screen/explore_screen.dart';
import 'package:amychebbi/features/finnenc_blance_flow/presentaion/controller/financeController.dart';
import 'package:amychebbi/features/finnenc_blance_flow/presentaion/screen/finance_screen.dart';
import 'package:amychebbi/features/friends_flow/presentation/controller/friends_controller.dart';
import 'package:amychebbi/features/home_flow/presentation/screen/search_screen.dart';
import 'package:amychebbi/features/leader_board/presentation/controller/leader_board_controller.dart';
import 'package:amychebbi/features/leader_board/presentation/screen/leader_board_screen.dart';
import 'package:amychebbi/features/member_ship_flow/presentation/screen/member_ship_screen.dart';
import 'package:amychebbi/features/message_flow/presentation/controller/chat_screen_controller.dart';
import 'package:amychebbi/features/message_flow/presentation/screen/message_list_screen.dart';
import 'package:amychebbi/features/myBooking_and_componing_booking_flow/presentation/screen/bookings_screen.dart';
import 'package:amychebbi/features/my_booking/presentaiton/screen/my_booking_screen.dart';
import 'package:amychebbi/features/notification_flow/presentation/controller/notification_controller.dart';
import 'package:amychebbi/features/profile_flow/presentation/controller/profile_controller.dart';
import 'package:amychebbi/features/profile_flow/presentation/screen/profile_screen.dart';
import 'package:amychebbi/features/profile_information_flow/presentation/controller/profile_information_controller.dart';
import 'package:amychebbi/features/profile_information_flow/presentation/screen/profile_inforamtion_screen.dart';
import 'package:amychebbi/features/profile_setUp_flow/presentation/controller/profile_set_up_controller.dart';
import 'package:amychebbi/features/profile_setUp_flow/presentation/screen/profile_set_up_main_screen.dart';
import 'package:amychebbi/features/rank_and_reputation_flow/presentation/screen/rakn_and_reputation_screen.dart';
import 'package:amychebbi/features/rating_and_review_flow/presentation/screen/rating_and_review_screen.dart';
import 'package:amychebbi/features/request_details/presentation/controller/request_details_controller.dart';
import 'package:amychebbi/features/request_details/presentation/screen/request_details_screen.dart';
import 'package:amychebbi/features/save_feed_flow/presentation/controller/save_feed_controller.dart';
import 'package:amychebbi/features/save_feed_flow/presentation/screen/save_feed_screen.dart';
import 'package:amychebbi/features/service_flow/presentation/controller/service_controller.dart';
import 'package:amychebbi/features/service_flow/presentation/screen/add_service_screen.dart';
import 'package:amychebbi/features/service_flow/presentation/screen/service_screen.dart';
import 'package:amychebbi/features/setting_flow/presentation/screen/privicy_policy.dart';
import 'package:amychebbi/features/setting_flow/presentation/screen/terms_and_condition.dart';
import 'package:amychebbi/features/shop_flow/presentation/controller/avater_controller.dart';
import 'package:amychebbi/features/shop_flow/presentation/controller/seriu_shop_controller.dart';
import 'package:amychebbi/features/shop_flow/presentation/controller/shop_controller.dart';
import 'package:amychebbi/features/shop_flow/presentation/screen/gift_screen.dart';
import 'package:amychebbi/features/shop_flow/presentation/screen/seriu_shop_screen.dart';
import 'package:amychebbi/features/shop_flow/presentation/screen/shop_screen.dart';
import 'package:amychebbi/features/verification_flow/presentation/controller/verificationCenterController.dart';
import 'package:amychebbi/features/verification_flow/presentation/screen/verification_center_screen.dart';
import 'package:amychebbi/features/wallet_flow/presentation/controller/wallet_controller.dart';
import 'package:amychebbi/features/wallet_flow/presentation/screen/wallet_screen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../features/auth_flow/presentation/screen/forget_password_verify_screen.dart';
import '../../features/auth_flow/presentation/screen/login_screen.dart';
import '../../features/categrory_select_flow/presentation/screen/category_search_screen.dart';
import '../../features/community_feed/presentation/controller/create_post_controller.dart';
import '../../features/community_feed/presentation/screen/create_post_screen.dart';
import '../../features/componingBooking/presentation/controller/componing_details_controller.dart';
import '../../features/componingBooking/presentation/controller/review_booking_controller.dart';
import '../../features/componingBooking/presentation/screen/componing_booking_screen.dart';
import '../../features/componingBooking/presentation/screen/componing_details_screen.dart';
import '../../features/favorite_flow/presentation/controller/favourite_controller.dart';
import '../../features/favorite_flow/presentation/screen/favourite_screen.dart';
import '../../features/friends_flow/presentation/screen/friends_screen.dart';
import '../../features/home_flow/presentation/screen/categorie_screen.dart';
import '../../features/home_flow/presentation/screen/home_screen.dart';
import '../../features/member_ship_flow/presentation/controller/member_ship_controller.dart';
import '../../features/myBooking_and_componing_booking_flow/presentation/controller/bookings_controller.dart';
import '../../features/notification_flow/presentation/screen/notification_screen.dart';
import '../../features/onboarding/presentation/screen/onboarding_screen.dart';
import '../../features/rank_and_reputation_flow/presentation/controller/rank_and_reputation_controller.dart';
import '../../features/rating_and_review_flow/presentation/controller/rating_and_review_controller.dart';
import '../../features/setting_flow/presentation/controller/settings_controller.dart';
import '../../features/setting_flow/presentation/screen/change_password_screen.dart';
import '../../features/setting_flow/presentation/screen/delete_account_screen.dart';
import '../../features/setting_flow/presentation/screen/notification_settings_screen.dart';
import '../../features/setting_flow/presentation/screen/settings_screen.dart';
import '../../features/shop_flow/presentation/controller/seiru_wallet_controller.dart';
import '../../features/shop_flow/presentation/controller/shop_gift_controller.dart';
import '../../features/shop_flow/presentation/screen/avatarFramesScreen.dart';
import '../../features/shop_flow/presentation/screen/seiru_walletScreen.dart';
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
  static const String exploreScreen = '/exploreScreen';
  static const String favoriteCompanionsScreen = '/favoriteCompanionsScreen';
  static const String profileScreen = '/profileScreen';
  static const String bookingHistoryScreen = '/bookingHistoryScreen';
  static const String membershipScreen = '/membershipScreen';
  static const String ratingReviewScreen = '/ratingReviewScreen';
  static const String rankReputationScreen = '/rankReputationScreen';
  static const String walletScreen = '/walletScreen';
  static const String shopScreen = '/shopScreen';
  static const String verificationCenterScreen = '/verificationCenterScreen';
  static const String friendsScreen = '/friendsScreen';
  static const String profileInformationScreen = '/profileInformationScreen';
  static const String savedFeedScreen = '/savedFeedScreen';
  static const String serviceScreen = '/serviceScreen';
  static const String addServiceScreen = '/addServiceScreen';
  static const String financeScreen = '/financeScreen';
  static const String availabilityScreen = '/availabilityScreen';
  static const String shopGiftScreen = '/shopGiftScreen';
  static const String avatarFramesScreen = '/avatarFramesScreen';
  static const String notificationScreen = '/notificationScreen';
  static const String seiWalletScreen = '/seiWalletScreen';
  static const String seiShopScreen = '/seiShopScreen';
  static const String messageListScreen = '/messageListScreen';
  static const String bookingsScreen = '/bookingsScreen';
  static const String settingsScreen = '/settingsScreen';
  static const String changePasswordScreen = '/changePasswordScreen';
  static const String notificationSettingScreen = '/notificationSettingScreen';
  static const String deleteAccountScreen = '/deleteAccountScreen';
  static const String privacyPolicyScreen = '/privacyPolicyScreen';
  static const String termsAndConditionScreen = '/termsAndConditionScreen';
  static const String forgetPasswordVerifyScreen = '/forgetPasswordVerifyScreen';


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
      name: AppRoutes.forgetPasswordVerifyScreen,
      page: () => ForgetPasswordVerifyScreen(),
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
    GetPage(
      name: AppRoutes.exploreScreen,
      page: () => ExploreScreen(),
      binding: BindingsBuilder((){
        Get.put<ExploreController>(ExploreController());
      }),
    ),
    GetPage(
      name: AppRoutes.favoriteCompanionsScreen,
      page: () => FavoriteCompanionsScreen(),
      binding: BindingsBuilder((){
        Get.put<FavoriteController>(FavoriteController());
      }),
    ),
    GetPage(
      name: AppRoutes.profileScreen,
      page: () => ProfileScreen(),
      binding: BindingsBuilder((){
        Get.put<ProfileController>(ProfileController());
      }),
    ),
    GetPage(
      name: AppRoutes.bookingHistoryScreen,
      page: () => BookingHistoryScreen(),
      binding: BindingsBuilder((){
        Get.put<BookingHistoryController>(BookingHistoryController());
      }),
    ),
    GetPage(
      name: AppRoutes.membershipScreen,
      page: () => MembershipScreen(),
      binding: BindingsBuilder((){
        Get.put<MembershipController>(MembershipController());
      }),
    ),
    GetPage(
      name: AppRoutes.ratingReviewScreen,
      page: () => RatingReviewScreen(),
      binding: BindingsBuilder((){
        Get.put<RatingReviewController>(RatingReviewController());
      }),
    ),
    GetPage(
      name: AppRoutes.ratingReviewScreen,
      page: () => RatingReviewScreen(),
      binding: BindingsBuilder((){
        Get.put<RatingReviewController>(RatingReviewController());
      }),
    ),
    GetPage(
      name: AppRoutes.rankReputationScreen,
      page: () => RankReputationScreen(),
      binding: BindingsBuilder((){
        Get.put<RankReputationController>(RankReputationController());
      }),
    ),
    GetPage(
      name: AppRoutes.walletScreen,
      page: () => WalletScreen(),
      binding: BindingsBuilder((){
        Get.put<WalletController>(WalletController());
      }),
    ),
    GetPage(
      name: AppRoutes.shopScreen,
      page: () => ShopScreen(),
      binding: BindingsBuilder((){
        Get.put<ShopController>(ShopController());
      }),
    ),
    GetPage(
      name: AppRoutes.verificationCenterScreen,
      page: () => VerificationCenterScreen(),
      binding: BindingsBuilder((){
        Get.put<VerificationCenterController>(VerificationCenterController());
      }),
    ),
    GetPage(
      name: AppRoutes.friendsScreen,
      page: () => FriendsScreen(),
      binding: BindingsBuilder((){
        Get.put<FriendsController>(FriendsController());
      }),
    ),
    GetPage(
      name: AppRoutes.profileInformationScreen,
      page: () => ProfileInformationScreen(),
      binding: BindingsBuilder((){
        Get.put<ProfileInformationController>(ProfileInformationController());
      }),
    ),
    GetPage(
      name: AppRoutes.savedFeedScreen,
      page: () => SavedFeedScreen(),
      binding: BindingsBuilder((){
        Get.put<SavedFeedController>(SavedFeedController());
      }),
    ),
    GetPage(
      name: AppRoutes.serviceScreen,
      page: () => ServicesScreen(),
      binding: BindingsBuilder((){
        Get.put<ServicesController>(ServicesController());
      }),
    ),
    GetPage(
      name: AppRoutes.addServiceScreen,
      page: () => AddServiceScreen(),
      binding: BindingsBuilder((){
        Get.put<ServicesController>(ServicesController());
      }),
    ),
    GetPage(
      name: AppRoutes.financeScreen,
      page: () => FinanceScreen(),
      binding: BindingsBuilder((){
        Get.put<FinanceController>(FinanceController());
      }),
    ),
    GetPage(
      name: AppRoutes.availabilityScreen,
      page: () => AvailabilityScreen(),
      binding: BindingsBuilder((){
        Get.put<AvailabilityController>(AvailabilityController());
      }),
    ),
    GetPage(
      name: AppRoutes.shopGiftScreen,
      page: () => ShopGiftsScreen(),
      binding: BindingsBuilder((){
        Get.put<ShopGiftsController>(ShopGiftsController());
      }),
    ),
    GetPage(
      name: AppRoutes.avatarFramesScreen,
      page: () => AvatarFramesScreen(),
      binding: BindingsBuilder((){
        Get.put<AvatarFramesController>(AvatarFramesController());
      }),
    ),
    GetPage(
      name: AppRoutes.notificationScreen,
      page: () => NotificationScreen(),
      binding: BindingsBuilder((){
        Get.put<NotificationScreenController>(NotificationScreenController());
      }),
    ),
    GetPage(
      name: AppRoutes.seiWalletScreen,
      page: () => SeiruWalletScreen(),
      binding: BindingsBuilder((){
        Get.put<SeiruWalletController>(SeiruWalletController());
      }),
    ),
    GetPage(
      name: AppRoutes.seiShopScreen,
      page: () => SeiroShopScreen(),
      binding: BindingsBuilder((){
        Get.put<SeiroShopController>(SeiroShopController());
      }),
    ),
    GetPage(
      name: AppRoutes.messageListScreen,
      page: () => MessageListScreen(),
      binding: BindingsBuilder((){
        Get.put<ChatScreenController>(ChatScreenController());
      }),
    ),
    GetPage(
      name: AppRoutes.bookingsScreen,
      page: () => BookingsScreen(),
      binding: BindingsBuilder((){
        Get.put<BookingsController>(BookingsController());
      }),
    ),
    GetPage(
      name: AppRoutes.settingsScreen,
      page: () => SettingsScreen(),
      binding: BindingsBuilder((){
        Get.put<SettingsController>(SettingsController());
      }),
    ),
    GetPage(
      name: AppRoutes.changePasswordScreen,
      page: () => ChangePasswordScreen(),
      binding: BindingsBuilder((){
        Get.put<SettingsController>(SettingsController());
      }),
    ),
    GetPage(
      name: AppRoutes.notificationSettingScreen,
      page: () => NotificationSettingScreen(),
      binding: BindingsBuilder((){
        Get.put<SettingsController>(SettingsController());
      }),
    ),
    GetPage(
      name: AppRoutes.deleteAccountScreen,
      page: () => DeleteAccountScreen(),
      binding: BindingsBuilder((){
        Get.put<SettingsController>(SettingsController());
      }),
    ),
    GetPage(
      name: AppRoutes.privacyPolicyScreen,
      page: () => PrivacyPolicyScreen(),
      binding: BindingsBuilder((){
        // Get.put<SettingsController>(SettingsController());
      }),
    ),
    GetPage(
      name: AppRoutes.termsAndConditionScreen,
      page: () => TermsAndConditionScreen(),
      binding: BindingsBuilder((){
        // Get.put<SettingsController>(SettingsController());
      }),
    ),
  ];
}