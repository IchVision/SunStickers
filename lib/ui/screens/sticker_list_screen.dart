import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../states/sticker_store.dart';
import '../../ui_kit/_ui_kit.dart';
import '../_ui.dart';

class StickerList extends StatelessWidget {
  const StickerList({
    super.key,
    required this.store,
  });

  final StickerStore store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Morning, Sunny",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                "What sticker do you want\nto buy today",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              _searchBar(),
              Text(
                "Available for you",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Observer(
                builder: (_) {
                  return _categories(
                    context,
                    store.categories,
                  );
                },
              ),
              Observer(
                builder: (_) {
                  return StickerListView(
                    stickers: store.stickersByCategory,
                    store: store,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  bottom: 15,
                ),
                child: Text(
                  "Best stickers of the week",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              Observer(
                builder: (_) {
                  return StickerListView(
                    stickers: store.stickers,
                    isReversed: true,
                    store: store,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Sunny Stickers",
        style: Theme.of(context).textTheme.displayMedium,
      ),
      actions: [
        Badge(
          position: BadgePosition.topEnd(top: 0, end: 0),
          badgeContent: const Text(
            "0",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.bagShopping,
            ),
          ),
        ),
      ],
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search sticker",
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.tune),
          ),
        ),
      ),
    );
  }

  Widget _categories(
    BuildContext context,
    List categories,
  ) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (_, index) {
          final category = categories[index];

          return GestureDetector(
            onTap: () {
              store.onCategoryTap(category);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color:
                    category.isSelected ? AppColor.accent : Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                category.type.toString().split('.').last,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          );
        },
        separatorBuilder: (_, __) {
          return const SizedBox(width: 10);
        },
      ),
    );
  }
}
