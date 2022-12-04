// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:tour_application/screen/auth/sign_up.dart';
import 'package:tour_application/screen/onboarding_screen.dart';
import 'package:tour_application/screen/privacy_policy.dart';
import 'package:tour_application/screen/splash_screen.dart';
import 'package:tour_application/screen/user_form.dart';

import '../screen/auth/sign_in.dart';

const String splash = "/splash_screen";
const String onboarding = "/onboarding_screen";
const String signUp= "/sign-up-screen";
const String signIn= "/sign-in-screen";
const String userForm= "/user-form-screen";
const String privacy ="/privacy-policy-screen";

// control our page  route flow

List<GetPage> getPages = [
  GetPage(name: splash, page: () => SplashScreen()),
  GetPage(name: onboarding, page: ()=>OnboardingScreen()),
  GetPage(name: signUp, page: ()=>SignUp()),
  GetPage(name: signIn, page: ()=>SignIn()),
  GetPage(name: userForm, page: ()=>UserForm()),
  GetPage(name: privacy, page: ()=>PrivacyPolicy()),
];