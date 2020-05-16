import 'package:menuus_mobile/models/credit_card_model.dart';
import 'package:mobx/mobx.dart';
part 'credit_card_controller.g.dart';

class CreditCardController = _CreditCardControllerBase with _$CreditCardController;

abstract class _CreditCardControllerBase with Store {
  @observable
  ObservableList<CreditCard> creditCards = ObservableList.of([
    CreditCard('John Doe', 1234123412341234, '12/21', 123),
    CreditCard('Mary Jane', 9876987698769876, '11/22', 321),
  ]);

  @computed
  int get total => creditCards.length;

  @action
  void addToCart(CreditCard newCard) {
    creditCards.add(newCard);
    print(creditCards);
    print(total);
  }

  @action
  void removeFromCart(int index) {
    creditCards.removeAt(index);
    print(creditCards);
    print(total);
  }
}
