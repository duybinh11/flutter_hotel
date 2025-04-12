import 'package:book_hotel/presentation/LoadingScreen.dart';
import 'package:book_hotel/presentation/UserHomeScreen/controller/ControllerHomeUser.dart';
import 'package:book_hotel/presentation/UserHomeScreen/view/BoxItemHotel.dart';
import 'package:book_hotel/presentation/UserHomeScreen/view/BoxSearchHomeUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserHomeScreen extends GetView<Controllerhomeuser> {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const LoadingScreen()
          : Scaffold(
              body: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: BoxSearchHomeUser(),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(10),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.85,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return BoxItemHotel(
                          hotel: controller.hotels[index],
                        );
                      },
                      childCount: controller.hotels.length,
                    ),
                  ),
                ),
              ],
            )),
    );
  }
}

class ShowRateStart extends StatelessWidget {
  final double avgRate;
  final double size;

  const ShowRateStart({super.key, required this.avgRate, this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        if (index < avgRate.floor()) {
          return Icon(Icons.star, color: Colors.amber, size: size);
        } else if (index < avgRate && avgRate % 1 != 0) {
          return Icon(Icons.star_half, color: Colors.amber, size: size);
        } else {
          return Icon(Icons.star_border, color: Colors.amber, size: size);
        }
      }),
    );
  }
}
