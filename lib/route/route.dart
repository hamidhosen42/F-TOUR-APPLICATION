// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:get/get.dart';
import 'package:tour_application/screen/auth/sign_up.dart';
import 'package:tour_application/screen/onboarding_screen.dart';
import 'package:tour_application/screen/privacy_policy.dart';
import 'package:tour_application/screen/splash_screen.dart';
import 'package:tour_application/screen/user_form.dart';

import '../screen/auth/sign_in.dart';
import '../screen/bottom_nav_controller/details_screen.dart';
import '../screen/bottom_nav_controller/pages/nav_add_last_step.dart';
import '../screen/bottom_nav_controller/sell_all.dart';
import '../screen/drawer_pages/faq.dart';
import '../screen/drawer_pages/how_to_use.dart';
import '../screen/drawer_pages/privacy.dart';
import '../screen/drawer_pages/profile.dart';
import '../screen/drawer_pages/support.dart';
import '../screen/main_home_screen.dart';

const String splash = "/splash_screen";
const String onboarding = "/onboarding_screen";
const String signUp = "/sign-up-screen";
const String signIn = "/sign-in-screen";
const String userForm = "/user-form-screen";
const String privacyPolicy = "/privacy-policy-screen";
const String mainHomeScreen = '/main-home-screen';
const String supportScreen = '/support-screen';
const String privacyScreen = '/privacy-screen';
const String faqScreen = '/faq-screen';
const String howToUseScreen = '/how-to-use-screen';
const String settingsScreen = '/settings-screen';
const String profileScreen = '/profile-screen';
const String seeAllScreen = '/seeAll-screen';
const String detailsScreen = '/details-screen';
const String navAddLastStep = '/navAddLastStep-screen';

// control our page  route flow

List<GetPage> getPages = [
  GetPage(name: splash, page: () => SplashScreen()),
  GetPage(name: onboarding, page: () => OnboardingScreen()),
  GetPage(name: signUp, page: () => SignUp()),
  GetPage(name: signIn, page: () => SignIn()),
  GetPage(name: userForm, page: () => UserForm()),
  GetPage(name: privacyPolicy, page: () => PrivacyPolicy()),
  GetPage(
    name: mainHomeScreen,
    page: () => MainHomeScreen(),
  ),
  GetPage(
    name: supportScreen,
    page: () => Support(),
  ),
  GetPage(
    name: privacyScreen,
    page: () => Privacy(),
  ),
  GetPage(
    name: faqScreen,
    page: () => FAQ(),
  ),
  GetPage(
    name: howToUseScreen,
    page: () => HowToUse(),
  ),
  GetPage(
    name: profileScreen,
    page: () => UserProfile(),
  ),
  GetPage(
    name: seeAllScreen,
    page: () {
      SeeAll _seeAll = Get.arguments;
      return _seeAll;
    },
  ),
  GetPage(
    name: detailsScreen,
    page: () {
      DetailsSCreen _detailsSCreen = Get.arguments;
      return _detailsSCreen;
    },
  ),
  GetPage(
    name: navAddLastStep,
    page: () {
      NavAddLastStep _addLastStep = Get.arguments;
      return _addLastStep;
    },
  ),
];