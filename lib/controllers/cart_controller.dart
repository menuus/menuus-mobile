import 'package:mobx/mobx.dart';
part 'cart_controller.g.dart';

class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  @observable
  ObservableList<String> cartPlates = ObservableList.of([]); 

  @computed
  int get total => cartPlates.length;   

  @action 
  void addToCart(String newPlate) {
    cartPlates.add(newPlate);
    print(cartPlates);
    print(total);
  }

  @action 
  void removeFromCart(int index) {
    cartPlates.removeAt(index);
    print(cartPlates);
    print(total);
  }
}
