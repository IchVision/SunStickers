import 'package:equatable/equatable.dart';
import '../data/_data.dart';

abstract class StickerEvent extends Equatable {
  const StickerEvent();
  @override
  List<Object?> get props => [];
}
class StickerCategorySelected extends StickerEvent {
  const StickerCategorySelected(this.category);
  final StickerCategory category;
  @override
  List<Object?> get props => [category];
}
class StickerQuantityIncreased extends StickerEvent {
  const StickerQuantityIncreased(this.stickerId);
  final int stickerId;
  @override
  List<Object?> get props => [stickerId];
}
class StickerQuantityDecreased extends StickerEvent {
  const StickerQuantityDecreased(this.stickerId);
  final int stickerId;
  @override
  List<Object?> get props => [stickerId];
}
class StickerAddedToCart extends StickerEvent {
  const StickerAddedToCart(this.stickerId);
  final int stickerId;
  @override
  List<Object?> get props => [stickerId];
}
class StickerRemovedFromCart extends StickerEvent {
  const StickerRemovedFromCart(this.stickerId);
  final int stickerId;
  @override
  List<Object?> get props => [stickerId];
}
class CartCheckedOut extends StickerEvent {
  const CartCheckedOut();
}
class StickerFavoriteToggled extends StickerEvent {
  const StickerFavoriteToggled(this.stickerId);
  final int stickerId;
  @override
  List<Object?> get props => [stickerId];
}
class ThemeToggled extends StickerEvent {
  const ThemeToggled();
}
