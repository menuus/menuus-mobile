import 'package:menuus_mobile/models/user_model.dart';
import 'package:menuus_mobile/services/http_service.dart';
import 'package:mobx/mobx.dart';
part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  @observable
  UserData userData;

  @observable
  User user;

  @observable
  String formEmail = 'gabrielkotecki@gmail.com'; //TODO: mock

  @observable
  String formPassword = '123123123'; //TODO: mock

  @observable
  ObservableFuture<UserData> onLoginFuture = ObservableFuture.value(null);

  @action
  onLogin() async {
    final future = postLogin(formEmail, formPassword);
    onLoginFuture = ObservableFuture(future);
    userData = await future;
  }
}
