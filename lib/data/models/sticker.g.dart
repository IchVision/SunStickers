// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Sticker on StickerBase, Store {
  late final _$idAtom = Atom(name: 'StickerBase.id', context: context);

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$imageAtom = Atom(name: 'StickerBase.image', context: context);

  @override
  String get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(String value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$nameAtom = Atom(name: 'StickerBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$priceAtom = Atom(name: 'StickerBase.price', context: context);

  @override
  double get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(double value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  late final _$quantityAtom =
      Atom(name: 'StickerBase.quantity', context: context);

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  late final _$favoriteAtom =
      Atom(name: 'StickerBase.favorite', context: context);

  @override
  bool get favorite {
    _$favoriteAtom.reportRead();
    return super.favorite;
  }

  @override
  set favorite(bool value) {
    _$favoriteAtom.reportWrite(value, super.favorite, () {
      super.favorite = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: 'StickerBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$scoreAtom = Atom(name: 'StickerBase.score', context: context);

  @override
  double get score {
    _$scoreAtom.reportRead();
    return super.score;
  }

  @override
  set score(double value) {
    _$scoreAtom.reportWrite(value, super.score, () {
      super.score = value;
    });
  }

  late final _$typeAtom = Atom(name: 'StickerBase.type', context: context);

  @override
  StickerType get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(StickerType value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  late final _$voterAtom = Atom(name: 'StickerBase.voter', context: context);

  @override
  int get voter {
    _$voterAtom.reportRead();
    return super.voter;
  }

  @override
  set voter(int value) {
    _$voterAtom.reportWrite(value, super.voter, () {
      super.voter = value;
    });
  }

  late final _$cartAtom = Atom(name: 'StickerBase.cart', context: context);

  @override
  bool get cart {
    _$cartAtom.reportRead();
    return super.cart;
  }

  @override
  set cart(bool value) {
    _$cartAtom.reportWrite(value, super.cart, () {
      super.cart = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
image: ${image},
name: ${name},
price: ${price},
quantity: ${quantity},
favorite: ${favorite},
description: ${description},
score: ${score},
type: ${type},
voter: ${voter},
cart: ${cart}
    ''';
  }
}
