// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:tour_application/screen/auth/sign_up.dart';
import 'package:tour_application/screen/onboarding_screen.dart';
import 'package:tour_application/screen/splash_screen.dart';

const String splash = "/splash_screen";
const String onboarding = "/onboarding_screen";
const String signUp= "/sign-up-screen";

// control our page  route flow

List<GetPage> getPages = [
  GetPage(name: splash, page: () => SplashScreen()),
  GetPage(name: onboarding, page: ()=>OnboardingScreen()),
  GetPage(name: signUp, page: ()=>SignUp()),
];