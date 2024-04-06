part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInValidState extends SignInState {}

final class SignInErrorState extends SignInState {
  final String errorMessage;

  SignInErrorState(this.errorMessage);

}

final class SignInLoadingState extends SignInState {
}


