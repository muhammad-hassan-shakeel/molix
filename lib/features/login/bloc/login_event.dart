part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class PressLoginButtonEvent extends LoginEvent {
  final String email;
  final String password;

  const PressLoginButtonEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
