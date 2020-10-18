part of 'sign_in_form_bloc.dart';

@freezed
abstract class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.emailChanged(String emailString) = EmailChanged;
  const factory SignInFormEvent.passwordChanged(String passwordString) =
      PasswordChanged;
  const factory SignInFormEvent.registerWithEmailAndPasswordPressed() =
      RegisterWithEmailAndPasswordPressed;
  const factory SignInFormEvent.sigInWithEmailAndPasswordPressed() =
      SigInWithEmailAndPasswordPressed;
  const factory SignInFormEvent.sigInWithGooglePressed() =
      SigInWithGooglePressed;
}
