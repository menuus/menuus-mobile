// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryController on _CategoryControllerBase, Store {
  final _$selectedCategoriesAtom =
      Atom(name: '_CategoryControllerBase.selectedCategories');

  @override
  ObservableList<int> get selectedCategories {
    _$selectedCategoriesAtom.reportRead();
    return super.selectedCategories;
  }

  @override
  set selectedCategories(ObservableList<int> value) {
    _$selectedCategoriesAtom.reportWrite(value, super.selectedCategories, () {
      super.selectedCategories = value;
    });
  }

  final _$_CategoryControllerBaseActionController =
      ActionController(name: '_CategoryControllerBase');

  @override
  void toggleCategory(int id) {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.toggleCategory');
    try {
      return super.toggleCategory(id);
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedCategories: ${selectedCategories}
    ''';
  }
}
