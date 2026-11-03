import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/_data.dart';
import 'sticker_event.dart';
import 'sticker_state.dart';

class StickerBloc extends Bloc<StickerEvent, StickerState> {
  StickerBloc() : super(StickerState.initial()) {
    on<StickerCategorySelected>((event, emit) {
      final categories = state.categories.map((e) =>
          e.copyWith(isSelected: e.type == event.category.type)).toList();
      _emitWithStickers(emit, state.stickers, categories: categories);
    });
    on<StickerQuantityIncreased>((event, emit) {
      final stickers = state.stickers.map((e) => e.id == event.stickerId
          ? e.copyWith(quantity: e.quantity + 1) : e).toList();
      _emitWithStickers(emit, stickers);
    });
    on<StickerQuantityDecreased>((event, emit) {
      final stickers = state.stickers.map((e) {
        if (e.id != event.stickerId || e.quantity == 1) return e;
        return e.copyWith(quantity: e.quantity - 1);
      }).toList();
      _emitWithStickers(emit, stickers);
    });
    on<StickerAddedToCart>((event, emit) {
      final stickers = state.stickers.map((e) =>
          e.id == event.stickerId ? e.copyWith(cart: true) : e).toList();
      _emitWithStickers(emit, stickers);
    });
    on<StickerRemovedFromCart>((event, emit) {
      final stickers = state.stickers.map((e) => e.id == event.stickerId
          ? e.copyWith(cart: false, quantity: 1) : e).toList();
      _emitWithStickers(emit, stickers);
    });
    on<CartCheckedOut>((event, emit) {
      final ids = state.cart.map((e) => e.id).toSet();
      final stickers = state.stickers.map((e) => ids.contains(e.id)
          ? e.copyWith(cart: false, quantity: 1) : e).toList();
      _emitWithStickers(emit, stickers);
    });
    on<StickerFavoriteToggled>((event, emit) {
      final stickers = state.stickers.map((e) => e.id == event.stickerId
          ? e.copyWith(favorite: !e.favorite) : e).toList();
      _emitWithStickers(emit, stickers);
    });
    on<ThemeToggled>((event, emit) {
      emit(state.copyWith(light: !state.light));
    });
  }

  List<Sticker> _byCategory(List<Sticker> stickers, List<StickerCategory> categories) {
    final selected = categories.firstWhere((e) => e.isSelected,
        orElse: () => categories.first);
    if (selected.type == StickerType.all) return List<Sticker>.from(stickers);
    return stickers.where((e) => e.type == selected.type).toList();
  }

  void _emitWithStickers(Emitter<StickerState> emit, List<Sticker> stickers,
      {List<StickerCategory>? categories}) {
    final nextCategories = categories ?? state.categories;
    emit(state.copyWith(
      categories: nextCategories,
      stickers: stickers,
      stickersByCategory: _byCategory(stickers, nextCategories),
      cart: stickers.where((e) => e.cart).toList(),
      favorite: stickers.where((e) => e.favorite).toList(),
    ));
  }
}
