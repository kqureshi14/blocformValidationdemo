import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState("Please enter a valid email address"));
      } else if (event.passwordValue.length < 9) {
        emit(SignInErrorState(
            "Please enter a valid password, it should have more than 8 characters"));
      } else {
        emit(SignInValidState());
      }
    });

    on<SignInSubmitEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
