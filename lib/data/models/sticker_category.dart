import 'package:mobx/mobx.dart';

import '_models.dart';

part 'sticker_category.g.dart';

class StickerCategory = StickerCategoryBase with _$StickerCategory;

abstract class StickerCategoryBase with Store {
  final StickerType type;

  @observable
  bool isSelected;

  StickerCategoryBase({
    required this.type,
    required this.isSelected,
  });
}
