import 'dart:async';

import 'package:get/get.dart';

/// Generic controller for fetching a list of items and basic loading state management
class ItemListController<ItemType> extends GetxController {
  var isLoading = true.obs;

  var items = RxList<ItemType>();

  /// method which will be used for getting the list of [ItemType] items
  final Future<List<ItemType>> Function() itemLoaderMethod;

  ItemListController({required this.itemLoaderMethod});

  @override
  onInit() {
    super.onInit();
    _loadItems();
  }

  /// Adds new item of type [ItemType] to existing list of items
  ///
  /// Note: this only adds the item locally, it doesn't push any information to an api or anything similar.
  addNewObject(ItemType newItem) {
    items.add(newItem);
  }

  /// Uses given [itemLoaderMethod] to load and populate the [items] list
  void _loadItems() {
    itemLoaderMethod().then(
      (loadedObjects) {
        items.addAll(loadedObjects);
        isLoading(false);
      },
    ).onError(
      (error, stackTrace) {
        isLoading(false);
      },
    );
  }
}
