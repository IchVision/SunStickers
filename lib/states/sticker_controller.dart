import 'package:get/get.dart';

import '../data/_data.dart';

class StickerController extends GetxController {
  final categories = <StickerCategory>[...AppData.categories].obs;
  final stickers = <Sticker>[...AppData.stickers].obs;
  final stickersByCategory = <Sticker>[...AppData.stickers].obs;
  final cart = <Sticker>[].obs;
  final favorite = <Sticker>[].obs;
  final light = true.obs;

  void onCategoryTap(StickerCategory category) {
    for (final item in categories) {
      item.isSelected = item.type == category.type;
    }

    if (category.type == StickerType.all) {
      stickersByCategory.assignAll(stickers);
    } else {
      stickersByCategory.assignAll(
        stickers.where(
          (sticker) => sticker.type == category.type,
        ),
      );
    }
  }

  void onIncreaseQuantityTap(Sticker sticker) {
    sticker.quantity++;
    stickers.refresh();
  }

  void onDecreaseQuantityTap(Sticker sticker) {
    if (sticker.quantity == 1) return;

    sticker.quantity--;
    stickers.refresh();
  }

  void onAddToCartTap(Sticker sticker) {
    sticker.cart = true;

    cart.assignAll(
      stickers.where((sticker) => sticker.cart),
    );
  }

  void onRemoveFromCartTap(Sticker sticker) {
    sticker.cart = false;
    sticker.quantity = 1;

    cart.assignAll(
      stickers.where((sticker) => sticker.cart),
    );
  }

  void onCheckOutTap() {
    for (final sticker in cart) {
      sticker.cart = false;
      sticker.quantity = 1;
    }

    cart.clear();
  }

  void onAddRemoveFavoriteTap(Sticker sticker) {
    sticker.favorite = !sticker.favorite;

    favorite.assignAll(
      stickers.where((sticker) => sticker.favorite),
    );
  }

  void toggleTheme() {
    light.toggle();
  }

  String stickerPrice(Sticker sticker) {
    return (sticker.quantity * sticker.price).toString();
  }

  double get subtotal {
    return cart.fold(
      0,
      (total, sticker) => total + sticker.price * sticker.quantity,
    );
  }
}
