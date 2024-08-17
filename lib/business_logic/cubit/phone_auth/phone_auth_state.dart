part of 'phone_auth_cubit.dart';

abstract class PhoneAuthState {}

final class PhoneAuthInitial extends PhoneAuthState {}

final class Loading extends PhoneAuthState {}

final class Failure extends PhoneAuthState {
  final String errorMsg;
  Failure({required this.errorMsg});
}
final class PhoneAuthSubmited extends PhoneAuthState {}

final class PhoneAuthOtpVerified extends PhoneAuthState {}