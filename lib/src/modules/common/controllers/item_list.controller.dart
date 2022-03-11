import 'dart:async';

import 'package:get/get.dart';

class ItemListController<ItemType> extends GetxController {
  ItemListController({required this.itemLoaderMethod});

  final Future<List<ItemType>> Function() itemLoaderMethod;

  RxList<ItemType> items = RxList<ItemType>();
  RxBool isLoading = true.obs;

  @override
  onInit() {
    super.onInit();
    _loadItems();
  }

  addNewObject(ItemType newObject) {
    items.add(newObject);
  }

  void _loadItems() {
    isLoading(true);

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
