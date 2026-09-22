// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StickerStore on StickerStoreBase, Store {
  Computed<List<Sticker>>? _$cartComputed;

  @override
  List<Sticker> get cart =>
      (_$cartComputed ??= Computed<List<Sticker>>(() => super.cart,
              name: 'StickerStoreBase.cart'))
          .value;
  Computed<List<Sticker>>? _$favoriteComputed;

  @override
  List<Sticker> get favorite =>
      (_$favoriteComputed ??= Computed<List<Sticker>>(() => super.favorite,
              name: 'StickerStoreBase.favorite'))
          .value;
  Computed<double>? _$subtotalComputed;

  @override
  double get subtotal =>
      (_$subtotalComputed ??= Computed<double>(() => super.subtotal,
              name: 'StickerStoreBase.subtotal'))
          .value;

  late final _$categoriesAtom =
      Atom(name: 'StickerStoreBase.categories', context: context);

  @override
  ObservableList<StickerCategory> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableList<StickerCategory> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$stickersAtom =
      Atom(name: 'StickerStoreBase.stickers', context: context);

  @override
  ObservableList<Sticker> get stickers {
    _$stickersAtom.reportRead();
    return super.stickers;
  }

  @override
  set stickers(ObservableList<Sticker> value) {
    _$stickersAtom.reportWrite(value, super.stickers, () {
      super.stickers = value;
    });
  }

  late final _$stickersByCategoryAtom =
      Atom(name: 'StickerStoreBase.stickersByCategory', context: context);

  @override
  ObservableList<Sticker> get stickersByCategory {
    _$stickersByCategoryAtom.reportRead();
    return super.stickersByCategory;
  }

  @override
  set stickersByCategory(ObservableList<Sticker> value) {
    _$stickersByCategoryAtom.reportWrite(value, super.stickersByCategory, () {
      super.stickersByCategory = value;
    });
  }

  late final _$lightAtom =
      Atom(name: 'StickerStoreBase.light', context: context);

  @override
  bool get light {
    _$lightAtom.reportRead();
    return super.light;
  }

  @override
  set light(bool value) {
    _$lightAtom.reportWrite(value, super.light, () {
      super.light = value;
    });
  }

  late final _$StickerStoreBaseActionController =
      ActionController(name: 'StickerStoreBase', context: context);

  @override
  void onCategoryTap(StickerCategory category) {
    final _$actionInfo = _$StickerStoreBaseActionController.startAction(
        name: 'StickerStoreBase.onCategoryTap');
    try {
      return super.onCategoryTap(category);
    } finally {
      _$StickerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onIncreaseQuantityTap(Sticker sticker) {
    final _$actionInfo = _$StickerStoreBaseActionController.startAction(
        name: 'StickerStoreBase.onIncreaseQuantityTap');
    try {
      return super.onIncreaseQuantityTap(sticker);
    } finally {
      _$StickerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onDecreaseQuantityTap(Sticker sticker) {
    final _$actionInfo = _$StickerStoreBaseActionController.startAction(
        name: 'StickerStoreBase.onDecreaseQuantityTap');
    try {
      return super.onDecreaseQuantityTap(sticker);
    } finally {
      _$StickerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onAddToCartTap(Sticker sticker) {
    final _$actionInfo = _$StickerStoreBaseActionController.startAction(
        name: 'StickerStoreBase.onAddToCartTap');
    try {
      return super.onAddToCartTap(sticker);
    } finally {
      _$StickerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onRemoveFromCartTap(Sticker sticker) {
    final _$actionInfo = _$StickerStoreBaseActionController.startAction(
        name: 'StickerStoreBase.onRemoveFromCartTap');
    try {
      return super.onRemoveFromCartTap(sticker);
    } finally {
      _$StickerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onCheckOutTap() {
    final _$actionInfo = _$StickerStoreBaseActionController.startAction(
        name: 'StickerStoreBase.onCheckOutTap');
    try {
      return super.onCheckOutTap();
    } finally {
      _$StickerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onAddRemoveFavoriteTap(Sticker sticker) {
    final _$actionInfo = _$StickerStoreBaseActionController.startAction(
        name: 'StickerStoreBase.onAddRemoveFavoriteTap');
    try {
      return super.onAddRemoveFavoriteTap(sticker);
    } finally {
      _$StickerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleTheme() {
    final _$actionInfo = _$StickerStoreBaseActionController.startAction(
        name: 'StickerStoreBase.toggleTheme');
    try {
      return super.toggleTheme();
    } finally {
      _$StickerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categories: ${categories},
stickers: ${stickers},
stickersByCategory: ${stickersByCategory},
light: ${light},
cart: ${cart},
favorite: ${favorite},
subtotal: ${subtotal}
    ''';
  }
}
