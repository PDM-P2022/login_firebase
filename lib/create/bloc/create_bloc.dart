import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'create_event.dart';
part 'create_state.dart';

class CreateBloc extends Bloc<CreateEvent, CreateState> {
  CreateBloc() : super(CreateInitial()) {
    on<AddNewTweetEvent>((event, emit) async {
      try {
        await FirebaseFirestore.instance
            .collection("tweet")
            .add(event.tweetData);
        emit(CreateInitial());
        emit(CreateSuccessState());
      } catch (e) {
        emit(CreateErrorState());
      }
    });
  }
}
