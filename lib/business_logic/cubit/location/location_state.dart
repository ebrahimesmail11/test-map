part of 'location_cubit.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

final class LocationError extends LocationState {
  final String errorMsg;
  LocationError({required this.errorMsg});
}

final class LocationSuccess extends LocationState {
  final Position position;

  LocationSuccess(this.position);
}

