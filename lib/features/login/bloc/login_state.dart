part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState();
}

class LoginSuccessState extends LoginState {
  const LoginSuccessState();
}
