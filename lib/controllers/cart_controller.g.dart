// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartController on _CartControllerBase, Store {
  Computed<int> _$totalComputed;

  @override
  int get total => (_$totalComputed ??=
          Computed<int>(() => super.total, name: '_CartControllerBase.total'))
      .value;
  Computed<String> _$totalPriceComputed;

  @override
  String get totalPrice =>
      (_$totalPriceComputed ??= Computed<String>(() => super.totalPrice,
              name: '_CartControllerBase.totalPrice'))
          .value;

  final _$cartPlatesAtom = Atom(name: '_CartControllerBase.cartPlates');

  @override
  ObservableList<Plate> get cartPlates {
    _$cartPlatesAtom.reportRead();
    return super.cartPlates;
  }

  @override
  set cartPlates(ObservableList<Plate> value) {
    _$cartPlatesAtom.reportWrite(value, super.cartPlates, () {
      super.cartPlates = value;
    });
  }

  final _$_CartControllerBaseActionController =
      ActionController(name: '_CartControllerBase');

  @override
  void addToCart(Plate newPlate) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.addToCart');
    try {
      return super.addToCart(newPlate);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFromCart(int index) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.removeFromCart');
    try {
      return super.removeFromCart(index);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cartPlates: ${cartPlates},
total: ${total},
totalPrice: ${totalPrice}
    ''';
  }
}
