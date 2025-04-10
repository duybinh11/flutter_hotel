import 'package:book_hotel/core/BaseWidget/CacheImgCustom.dart';
import 'package:book_hotel/core/BaseWidget/CustomDropdown.dart';
import 'package:book_hotel/core/util/UtilColors.dart';
import 'package:book_hotel/presentation/UserHomeScreen/view/BoxSearchHomeUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: BoxSearchHomeUser(),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(10),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.85,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return BoxItemHotel();
              },
              childCount: 10,
            ),
          ),
        ),
      ],
    ));
  }
}

class BoxItemHotel extends StatelessWidget {
  const BoxItemHotel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: UtilColors.colorBox,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CacheImgCustom(
                url:
                    "https://cdn.dulichbariavungtau.com/uploads/all/k2yc8leP6uYty59KN13ydc6wcp0fckLMQfJu1WLu.png"),
          ),
          const SizedBox(
            height: 7,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Duy Bình Hotel",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ShowRateStart(
                      avgRate: 3.5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(3.r))),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        "4.9/5.0",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.place,
                          color: Colors.red,
                          size: 16.w,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        const Text(
                          "Đà Nẵng",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const Text(
                      "200k/đêm",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ShowRateStart extends StatelessWidget {
  final double avgRate;

  const ShowRateStart({super.key, required this.avgRate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        if (index < avgRate.floor()) {
          return const Icon(Icons.star, color: Colors.amber, size: 20);
        } else if (index < avgRate && avgRate % 1 != 0) {
          return const Icon(Icons.star_half, color: Colors.amber, size: 20);
        } else {
          return const Icon(Icons.star_border, color: Colors.amber, size: 20);
        }
      }),
    );
  }
}
