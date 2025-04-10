import 'package:book_hotel/core/BaseWidget/CustomDropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxSearchHomeUser extends StatelessWidget {
  const BoxSearchHomeUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img/img1.jpg"), fit: BoxFit.cover)),
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.all(Radius.circular(16.r))),
        margin:
            EdgeInsets.only(left: 30.w, right: 30.w, top: 30.w, bottom: 10.w),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "Trải nghiệm kỳ nghỉ tuyệt vời",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomDropdown<String>(
              colorText: Colors.red,
              value: null,
              items: ['Đà nẵng'],
              label: 'Bạn muốn ở đâu',
              itemLabelBuilder: (item) => item,
              iconPrefix: const Icon(
                Icons.place,
                color: Colors.red,
              ),
              onChanged: (newValue) {},
            ),
            SizedBox(
              height: 10.h,
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.hotel,
                  color: Colors.red,
                ),
                hintText: "Tên khách sạn",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text("Tìm kiếm")),
            )
          ],
        ),
      ),
    );
  }
}
