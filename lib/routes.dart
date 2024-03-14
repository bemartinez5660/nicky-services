import 'package:cleanserv/pages/dashboard/dashboard_binding.dart';
import 'package:cleanserv/pages/dashboard/dashboard_page.dart';
import 'package:cleanserv/pages/forgot/forgot_binding.dart';
import 'package:cleanserv/pages/forgot/forgot_page.dart';
import 'package:cleanserv/pages/register/register_binding.dart';
import 'package:cleanserv/pages/register/register_page.dart';
import 'package:cleanserv/pages/stepper/stepper_page.dart';
import 'package:cleanserv/pages/stepper/stepper_binding.dart';
// import 'package:cleanserv/pages/login/login_middleware.dart';
import 'package:cleanserv/pages/welcome/welcome_binding.dart';
import 'package:cleanserv/pages/welcome/welcome_middleware.dart';
import 'package:cleanserv/pages/welcome/welcome_page.dart';
import 'package:get/route_manager.dart';

import 'package:cleanserv/pages/login/login_binding.dart';
import 'package:cleanserv/pages/login/login_page.dart';

///
/// Pages
///

class AppPages {
  // static SplashMiddleware splashMiddleware = SplashMiddleware();
  // static LoginMiddleware loginMiddleware = LoginMiddleware();
  static WelcomeMiddleware welcomeMiddleware = WelcomeMiddleware();
  static final List<GetPage> pages = [
    GetPage(
      name: '/welcome',
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
      middlewares: [welcomeMiddleware],
    ),
    // ...
    GetPage(
      name: '/stepper',
      page: () => StepperPage(),
      binding: StepperBinding(),
    ),
    // ...
    // GetPage(
    //   name: '/history',
    //   page: () => const HistoryPage(),
    //   binding: HistoryBinding(),
    // ),
    // ...
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
      binding: LoginBinding(),
      // middlewares: [loginMiddleware],
    ),
    // // ...
    GetPage(
      name: '/register',
      page: () => RegistrationPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: '/forgot',
      page: () => ForgotPasswordPage(),
      binding: ForgotBinding(),
    ),
    GetPage(
      name: '/dashboard',
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    // GetPage(
    //   name: '/google_map',
    //   page: () => const GoogleMapPage(),
    //   binding: GoogleMapBinding(),
    // ),
  ];
}
