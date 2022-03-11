import 'package:get/get.dart';

class ItemListController<ItemType> extends GetxController
    with StateMixin<List<ItemType>> {
  ItemListController({required this.itemLoaderMethod});

  final Future<List<ItemType>> Function() itemLoaderMethod;

  RxList<ItemType> items = RxList<ItemType>();

  @override
  onInit() {
    super.onInit();
    _loadItems();
    _listenToListUpdate();
  }

  addNewObject(ItemType newObject) {
    items.add(newObject);
  }

  /// Makes controller update on any change to the object list
  void _listenToListUpdate() {
    items.listen((p0) {
      update();
    });
  }

  void _loadItems() {
    itemLoaderMethod().then(
      (loadedObjects) {
        items.addAll(loadedObjects);

        change(items, status: RxStatus.success());
      },
    ).onError(
      (error, stackTrace) {
        change(items, status: RxStatus.error());
      },
    );
  }
}
