class LoginState{
  bool isLoading;
  String username;
  String password;

  LoginState({required this.isLoading, required this.username, required this.password});

  LoginState copyWith({bool? isLoading, String? username, String? password}){
    return LoginState(isLoading: isLoading ?? this.isLoading, username: username ?? this.username, password: password ?? this.password);
  }

  factory LoginState.initialize(){
    return LoginState(isLoading: false, username: '', password: '');
  }
}