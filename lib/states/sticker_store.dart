import 'package:mobx/mobx.dart';

import '../data/_data.dart';

part 'sticker_store.g.dart';

class StickerStore = StickerStoreBase with _$StickerStore;

abstract class StickerStoreBase with Store {
  @observable
  ObservableList<StickerCategory> categories =
      ObservableList.of(AppData.categories);

  @observable
  ObservableList<Sticker> stickers = ObservableList.of(AppData.stickers);

  @observable
  ObservableList<Sticker> stickersByCategory =
      ObservableList.of(AppData.stickers);

  @observable
  bool light = true;

  @computed
  List<Sticker> get cart {
    return stickers.where((sticker) => sticker.cart).toList();
  }

  @computed
  List<Sticker> get favorite {
    return stickers.where((sticker) => sticker.favorite).toList();
  }

  @computed
  double get subtotal {
    return cart.fold(
      0.0,
      (total, sticker) {
        return total + sticker.price * sticker.quantity;
      },
    );
  }

  @action
  void onCategoryTap(StickerCategory category) {
    for (final item in categories) {
      item.isSelected = item.type == category.type;
    }

    if (category.type == StickerType.all) {
      stickersByCategory
        ..clear()
        ..addAll(stickers);
    } else {
      stickersByCategory
        ..clear()
        ..addAll(
          stickers.where(
            (sticker) => sticker.type == category.type,
          ),
        );
    }
  }

  @action
  void onIncreaseQuantityTap(Sticker sticker) {
    sticker.quantity++;
  }

  @action
  void onDecreaseQuantityTap(Sticker sticker) {
    if (sticker.quantity <= 1) return;

    sticker.quantity--;
  }

  @action
  void onAddToCartTap(Sticker sticker) {
    sticker.cart = true;
  }

  @action
  void onRemoveFromCartTap(Sticker sticker) {
    sticker.cart = false;
    sticker.quantity = 1;
  }

  @action
  void onCheckOutTap() {
    for (final sticker in cart) {
      sticker.cart = false;
      sticker.quantity = 1;
    }
  }

  @action
  void onAddRemoveFavoriteTap(Sticker sticker) {
    sticker.favorite = !sticker.favorite;
  }

  @action
  void toggleTheme() {
    light = !light;
  }

  String stickerPrice(Sticker sticker) {
    return (sticker.quantity * sticker.price).toString();
  }
}
