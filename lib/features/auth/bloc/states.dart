import 'package:ecommerce_project/features/auth/models/api_response.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {
  final ApiResponse response;

  LoginLoadedState(this.response);
}

class LoginErrorState extends LoginState {}