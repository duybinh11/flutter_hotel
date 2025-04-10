import 'package:book_hotel/config/routes/AppPages.dart';
import 'package:book_hotel/config/routes/appRoutes.dart';
import 'package:book_hotel/config/theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(
          title: 'Flutter Demo',
          initialRoute: AppRoutes.login,
          debugShowCheckedModeBanner: false,
          getPages: AppPages.pages,
          theme: AppTheme.lightTheme),
    );
  }
}
