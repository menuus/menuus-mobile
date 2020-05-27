import 'package:menuus_mobile/models/plate_model.dart';
import 'package:mobx/mobx.dart';
part 'cart_controller.g.dart';

class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  @observable
  ObservableList<Plate> cartPlates = ObservableList.of([]);  

  @observable
  bool loading = false;

  @computed
  int get total => cartPlates.length;

  @computed
  String get totalPrice {
    double prices = 0;
    for (var p in cartPlates) {
      prices += num.tryParse(p.price)?.toDouble();
    }
    return prices.toStringAsFixed(2);
  }

  @action 
  void addToCart(Plate newPlate) {
    cartPlates.add(newPlate);
  }

  @action 
  void removeFromCart(int index) {
    cartPlates.removeAt(index);
  }

  @action 
  void removeAll() {
    cartPlates = ObservableList.of([]);
  }
}
