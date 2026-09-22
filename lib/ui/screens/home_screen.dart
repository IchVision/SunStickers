import 'package:flutter/material.dart';

import '../../data/_data.dart';
import '../../states/sticker_store.dart';
import '../_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.store,
  });

  final StickerStore store;

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late final List<Widget> screens;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    screens = [
      StickerList(store: widget.store),
      CartScreen(store: widget.store),
      FavoriteScreen(store: widget.store),
      const ProfileScreen(),
    ];
  }

  void onTabTap(int index) {
    if (currentIndex == index) return;

    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
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
    );
  }
}
