import 'package:flutter/cupertino.dart';
import 'package:ur_fine/services/database_services.dart';
import 'package:ur_fine/services/user_model.dart';

class UserDetailsProvider extends ChangeNotifier {
  UserModel? currentUser;

  void setUserUsingUid(String uid) async {
    await DatabaseServices().getCurrentUser(uid).then((value) {
      currentUser = value;
      debugPrint(value.toString());
      notifyListeners();
    });
  }
}
