import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/_data.dart';
import '../_ui.dart';
import '../../states/sticker_controller.dart';

class HomeScreen extends GetView<StickerController> {
  HomeScreen({super.key});

  final currentIndex = 0.obs;

  final List<Widget> screens = [
    const StickerList(),
    const CartScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  void onTabTap(int index) {
    if (currentIndex.value == index) return;
    currentIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: currentIndex.value,
            children: screens,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex.value,
          onTap: onTabTap,
          selectedFontSize: 0,
          items: AppData.bottomNavigationItems.map(
            (element) {
              return BottomNavigationBarItem(
                icon: element.disableIcon,
                label: element.label,
                activeIcon: element.enableIcon,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
