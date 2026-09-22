import 'package:mobx/mobx.dart';
import '_models.dart';
part 'sticker.g.dart';

enum StickerType { all, toy, fauna, plant, berry, fruit, other }

class Sticker = StickerBase with _$Sticker;

abstract class StickerBase with Store {
  @observable
  int id;

  @observable
  String image;

  @observable
  String name;

  @observable
  double price;

  @observable
  int quantity;

  @observable
  bool favorite;

  @observable
  String description;

  @observable
  double score;

  @observable
  StickerType type;

  @observable
  int voter;

  @observable
  bool cart;

  StickerBase({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.favorite,
    required this.description,
    required this.score,
    required this.type,
    required this.voter,
    required this.cart,
  });
}
