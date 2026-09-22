import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../states/sticker_store.dart';
import '../../ui_kit/_ui_kit.dart';
import '../_ui.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
    required this.store,
  });

  final StickerStore store;

  static const double taxes = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Observer(
        builder: (_) {
          final cartItems = store.cart;

          return EmptyWrapper(
            title: "Empty cart",
            isEmpty: cartItems.isEmpty,
            child: _cartListView(context, cartItems),
          );
        },
      ),
      bottomNavigationBar: Observer(
        builder: (_) {
          if (store.cart.isEmpty) {
            return const SizedBox.shrink();
          }

          return _bottomAppBar(context);
        },
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Cart screen",
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  Widget _cartListView(
    BuildContext context,
    List cartItems,
  ) {
    return ListView.separated(
      padding: const EdgeInsets.all(30),
      itemCount: cartItems.length,
      itemBuilder: (_, index) {
        final sticker = cartItems[index];

        return Dismissible(
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              store.onRemoveFromCartTap(sticker);
            }
          },
          key: ValueKey(sticker.id),
          background: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 25,
                ),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const FaIcon(
                  FontAwesomeIcons.trash,
                ),
              ),
            ],
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColor.dark
                  : Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(width: 20),
                Image.asset(
                  sticker.image,
                  scale: 10,
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sticker.name,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "\$${sticker.price}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Observer(
                      builder: (_) {
                        return CounterButton(
                          onIncrementTap: () {
                            store.onIncreaseQuantityTap(sticker);
                          },
                          onDecrementTap: () {
                            store.onDecreaseQuantityTap(sticker);
                          },
                          size: const Size(24, 24),
                          padding: 0,
                          label: Text(
                            sticker.quantity.toString(),
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        );
                      },
                    ),
                    Observer(
                      builder: (_) {
                        return Text(
                          "\$${store.stickerPrice(sticker)}",
                          style: AppTextStyle.h2Style.copyWith(
                            color: AppColor.accent,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (_, __) {
        return Container(
          height: 20,
        );
      },
    );
  }

  Widget _bottomAppBar(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BottomAppBar(
        child: SizedBox(
          height: 250,
          child: Container(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColor.dark
                : Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Observer(
                            builder: (_) {
                              return Text(
                                "\$${store.subtotal}",
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Taxes",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            "\$$taxes",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        thickness: 4.0,
                        height: 30.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Observer(
                            builder: (_) {
                              final total = store.subtotal + taxes;

                              return Text(
                                "\$$total",
                                style: AppTextStyle.h2Style.copyWith(
                                  color: AppColor.accent,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            store.onCheckOutTap();
                          },
                          child: const Text("Checkout"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
