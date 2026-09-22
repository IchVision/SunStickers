import 'package:flutter/material.dart';

import 'states/sticker_store.dart';
import 'ui/_ui.dart';
import 'ui_kit/_ui_kit.dart';

void main() {
  final store = StickerStore();

  runApp(
    MyApp(
      store: store,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.store,
  });

  final StickerStore store;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sunny Stickers',
      theme: AppTheme.darkTheme,
      home: HomeScreen(
        store: store,
      ),
    );
  }
}
