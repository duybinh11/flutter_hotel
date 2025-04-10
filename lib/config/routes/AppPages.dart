import 'package:book_hotel/config/routes/appRoutes.dart';
import 'package:book_hotel/presentation/LoginScreen/view/LoginScreen.dart';
import 'package:book_hotel/presentation/SignUpHotel/view/SignUpHotelScreen.dart';
import 'package:book_hotel/presentation/SignUpScreen/view/SignUpScreen.dart';
import 'package:book_hotel/presentation/UserHomeScreen/view/UserHomeScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static final pages = [
    // GetPage(
    //     name: AppRoutes.introduce,
    //     page: () => IntroduceScreen(),
    //     binding: BindingControllerIntroduce()),

    GetPage(
      name: AppRoutes.login,
      page: () => const Loginscreen(),
      // binding: BindingControllerIntroduce()
    ),

    GetPage(
      name: AppRoutes.signUp,
      page: () => const Signupscreen(),
      // binding: BindingControllerIntroduce()
    ),

    GetPage(
      name: AppRoutes.signUpHotel,
      page: () => const SignUpHotelScreen(),
      // binding: BindingControllerIntroduce()
    ),
    GetPage(
      name: AppRoutes.userHome,
      page: () => const UserHomeScreen(),
      // binding: BindingControllerIntroduce()
    ),
  ];
}
