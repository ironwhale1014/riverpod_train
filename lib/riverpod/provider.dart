import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_coding/model/shopping_item_model.dart';
import 'package:riverpod_coding/riverpod/notifier_provider.dart';

final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>(
  (ref) {
    final filterState = ref.watch(filterProvider);
    final shoppingListState = ref.watch(shoppingListProvider);

    if (filterState == FilterState.all) {
      return shoppingListState;
    }
    return shoppingListState
        .where((element) => filterState == FilterState.spicy
            ? element.isSpicy
            : !element.isSpicy)
        .toList();
  },
);

enum FilterState { all, spicy, notSpicy }

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
