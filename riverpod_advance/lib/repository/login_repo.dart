import 'package:riverpod_advance/services/login_service.dart';

class LoginRepository extends LoginService{

  final WCLoginService _wcLoginService = WCLoginService();
  @override
  Future<bool> login(String username, String password) async{
    return await _wcLoginService.login(username, password);
  }
}