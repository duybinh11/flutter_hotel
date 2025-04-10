import 'package:book_hotel/core/BaseWidget/CustomDropdown.dart';
import 'package:book_hotel/core/util/UtilColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpHotelScreen extends StatelessWidget {
  const SignUpHotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UtilColors.primaryKeyColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/img/logo.png"),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30.r))),
              width: double.infinity,
              height: 700.h,
              margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Đăng ký tài khoản khách sạn",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: UtilColors.primaryKeyColor),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Spacer(),
                  const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_box_outlined),
                        label: Text("Tên khách sạn"),
                        hintText: "Nhập họ tên"),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        label: Text("Email"),
                        hintText: "Nhập email"),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        label: Text("Password"),
                        hintText: "Nhập Password"),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        label: Text("Xác nhận password"),
                        hintText: "Nhập Xác nhận password"),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomDropdown<String>(
                    value: null,
                    items: [''],
                    label: 'Chọn tỉnh thành',
                    itemLabelBuilder: (item) => item,
                    onChanged: (newValue) {},
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomDropdown<String>(
                    value: null,
                    items: [''],
                    label: 'Chọn quận/huyện',
                    itemLabelBuilder: (item) => item,
                    onChanged: (newValue) {},
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomDropdown<String>(
                    value: null,
                    items: [''],
                    label: 'Chọn xã/phường',
                    itemLabelBuilder: (item) => item,
                    onChanged: (newValue) {},
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 45.h,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Đăng ký",
                            style: TextStyle(fontSize: 16.sp),
                          ))),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      const Text("Bạn đã có tài khoản ?"),
                      SizedBox(
                        width: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: const Text(
                              "đăng nhập",
                              style: TextStyle(
                                  color: UtilColors.primaryKeyColor,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
