import 'package:get/get.dart';
import '../modules/login/view/login_view.dart';
import '../modules/login/binding/login_binding.dart';
import '../modules/signup/view/signup_view.dart';
import '../modules/signup/binding/signup_binding.dart';
import '../modules/profile/binding/profile_binding.dart';
import '../modules/profile/view/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(name: _Paths.SIGNUP, page: () => const SignupView()),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
