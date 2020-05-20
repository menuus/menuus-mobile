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

  @action
  getInfoMundo(String email, String password) async {
    userData = await postLogin(email, password);
  }
}
