import 'package:book_hotel/core/BaseWidget/CacheImgCustom.dart';
import 'package:book_hotel/core/Enum/EnumStatusBook.dart';
import 'package:book_hotel/presentation/DetailBookedScreen/controller/ControllerDetailBooked.dart';
import 'package:book_hotel/presentation/LoadingScreen.dart';
import 'package:book_hotel/presentation/UserHomeScreen/view/UserHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Detailbookedscreen extends GetView<Controllerdetailbooked> {
  const Detailbookedscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const LoadingScreen()
          : Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 280,
                          child: CacheImgCustom(
                              url: controller.bookedHotel.value.hotel!.img!),
                        ),
                        Positioned(
                          top: 20.h,
                          left: 10,
                          right: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () => Get.back(),
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.black,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                    size: 25.w,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.bookedHotel.value.hotel!.username!,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ShowRateStart(
                                    avgRate: 4.5,
                                    size: 23.w,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.r)),
                                      color: Colors.green,
                                    ),
                                    child: Text(
                                      "4.8/5.0",
                                      style: TextStyle(
                                          fontSize: 14.sp, color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 2),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.r)),
                                  color: Colors.red,
                                ),
                                child: Text(
                                  "${controller.bookedHotel.value.hotel!.price!}k/đêm",
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.place,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 7.w,
                              ),
                              Expanded(
                                child: Text(
                                  "${controller.bookedHotel.value.hotel!.address!.detailPlace}, ${controller.bookedHotel.value.hotel!.address!.town}, ${controller.bookedHotel.value.hotel!.address!.district}, ${controller.bookedHotel.value.hotel!.address!.province}",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13.sp),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          GestureDetector(
                            onTap: () => controller.selectDate(
                                context, controller.startDate),
                            child: AbsorbPointer(
                              child: TextField(
                                controller: controller.startDate,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.calendar_month),
                                    hintText: "Ngày nhận phòng",
                                    label: Text("Ngày nhận phòng")),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          GestureDetector(
                            onTap: () => controller.selectDate(
                                context, controller.endDate),
                            child: AbsorbPointer(
                              child: TextField(
                                controller: controller.endDate,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.calendar_month),
                                    hintText: "Ngày nhận phòng",
                                    label: Text("Ngày nhận phòng")),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextField(
                            controller: controller.count,
                            onChanged: (value) {
                              int count = 0;
                              try {
                                count = int.parse(value);
                                controller.onChangeRoom(count, context);
                              } catch (e) {}
                            },
                            decoration: const InputDecoration(
                                label: Text("Bạn muốn đặt mấy phòng?")),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.r))),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.w),
                            child: Text(
                              "${controller.bookedHotel.value.statusBook}",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.sp),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Text(
                                "Thời gian đặt phòng : ",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                controller.bookedHotel.value.createdAt
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.blue),
                              )
                            ],
                          ),
                          Visibility(
                            visible:
                                controller.bookedHotel.value.createdBy != null,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Người đặt phòng : ",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      controller.bookedHotel.value.createdBy
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 14.sp, color: Colors.blue),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible:
                                controller.bookedHotel.value.updatedAt != null,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Thời gian cập nhật gần nhất : ",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      controller.bookedHotel.value.updatedAt
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 14.sp, color: Colors.blue),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible:
                                controller.bookedHotel.value.modifiedBy != null,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Cập nhật bởi : ",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "${controller.bookedHotel.value.modifiedBy}",
                                      style: TextStyle(
                                          fontSize: 14.sp, color: Colors.blue),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              bottomNavigationBar: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                height: 80,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey)]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Text(
                        "${controller.totalMoney}k",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w900,
                            color: Colors.blue),
                      ),
                    ),
                    Row(
                      children: [
                        Visibility(
                          visible: controller.bookedHotel.value.statusBook ==
                              Enumstatusbook.WAIT.name,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 245, 220, 2)),
                              onPressed: () =>
                                  controller.clickUpdateBookedHotel(context),
                              child: const Text("Chỉnh sữa")),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Visibility(
                          visible: controller.bookedHotel.value.statusBook ==
                              Enumstatusbook.WAIT.name,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red),
                              onPressed: () => controller.clickCancell(context),
                              child: const Text("Hủy phòng")),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
