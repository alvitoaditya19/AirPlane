import 'package:airplane/models/destination_model.dart';
import 'package:airplane/models/user_model.dart';
import 'package:airplane/services/destination_service.dart';
import 'package:airplane/services/user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  void fecthDestination(String id) async {
    try {
      emit(DestinationLoading());

      List<DestinationModel> destinations =
          await DestinationService().fetchDestinations();
      
      UserModel user = await UserService().getUserById(id);

      emit(DestinationSuccess(destinations, user));
    } catch (e) {
      emit(DestinationFailed(e.toString()));
    }
  }
}
