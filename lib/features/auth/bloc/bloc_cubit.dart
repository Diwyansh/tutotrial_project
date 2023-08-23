 import 'package:ecommerce_project/features/auth/api_services/login_service.dart';
import 'package:ecommerce_project/features/auth/bloc/states.dart';
import 'package:ecommerce_project/features/auth/models/auth_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {

  LoginCubit() : super(LoginInitialState());

  final LoginService _loginService = LoginService();

  void login(AuthModel authModel) async {
    emit(LoginLoadingState());
    final res = await _loginService.loginUser(authModel);
    emit(LoginLoadedState(res));
  }

}