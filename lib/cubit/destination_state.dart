part of 'destination_cubit.dart';

abstract class DestinationState extends Equatable {
  const DestinationState();

  @override
  List<Object> get props => [];
}

class DestinationInitial extends DestinationState {}

class DestinationLoading extends DestinationState {}

class DestinationSuccess extends DestinationState {
  final List<DestinationModel> destinations;
  final UserModel user;

  DestinationSuccess(this.destinations, this.user);
}

class DestinationFailed extends DestinationState{
  final String error;

  DestinationFailed(this.error);

   @override
  List<Object> get props => [error];
}