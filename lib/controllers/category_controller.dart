import 'package:mobx/mobx.dart';

part 'category_controller.g.dart';

class CategoryController = _CategoryControllerBase with _$CategoryController;

abstract class _CategoryControllerBase with Store {
  @observable
  ObservableList<int> selectedCategories = ObservableList.of([]);

  @action
  void toggleCategory(int id) {
    if (selectedCategories.contains(id)) {
      selectedCategories.removeWhere((element) => element == id);
    } else {
      selectedCategories.add(id);      
    }
  }
}
