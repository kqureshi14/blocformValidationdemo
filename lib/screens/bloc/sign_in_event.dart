part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

class SignInTextChangedEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;

  SignInTextChangedEvent(this.emailValue, this.passwordValue);
}

class SignInSubmitEvent extends SignInEvent {
  final String email;
  final String password;

  SignInSubmitEvent(this.email, this.password);
}
