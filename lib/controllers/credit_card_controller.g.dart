// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreditCardController on _CreditCardControllerBase, Store {
  Computed<int> _$totalComputed;

  @override
  int get total => (_$totalComputed ??= Computed<int>(() => super.total,
          name: '_CreditCardControllerBase.total'))
      .value;

  final _$creditCardsAtom = Atom(name: '_CreditCardControllerBase.creditCards');

  @override
  ObservableList<CreditCard> get creditCards {
    _$creditCardsAtom.reportRead();
    return super.creditCards;
  }

  @override
  set creditCards(ObservableList<CreditCard> value) {
    _$creditCardsAtom.reportWrite(value, super.creditCards, () {
      super.creditCards = value;
    });
  }

  final _$_CreditCardControllerBaseActionController =
      ActionController(name: '_CreditCardControllerBase');

  @override
  void addToCart(CreditCard newCard) {
    final _$actionInfo = _$_CreditCardControllerBaseActionController
        .startAction(name: '_CreditCardControllerBase.addToCart');
    try {
      return super.addToCart(newCard);
    } finally {
      _$_CreditCardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFromCart(int index) {
    final _$actionInfo = _$_CreditCardControllerBaseActionController
        .startAction(name: '_CreditCardControllerBase.removeFromCart');
    try {
      return super.removeFromCart(index);
    } finally {
      _$_CreditCardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
creditCards: ${creditCards},
total: ${total}
    ''';
  }
}
