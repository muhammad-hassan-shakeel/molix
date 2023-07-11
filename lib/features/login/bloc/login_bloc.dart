import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitial()) {
    on<PressLoginButtonEvent>(_onPressLoginButtonEvent);
  }

  Future<void> _onPressLoginButtonEvent(
    PressLoginButtonEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(const LoginSuccessState());
  }
}
