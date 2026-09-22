import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'states/sticker_controller.dart';
import 'ui/_ui.dart';
import 'ui_kit/_ui_kit.dart';

void main() {
  Get.put(StickerController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sunny Stickers',
      theme: AppTheme.darkTheme,
      home: HomeScreen(),
    );
  }
}
