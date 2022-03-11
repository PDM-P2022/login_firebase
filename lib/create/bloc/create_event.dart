part of 'create_bloc.dart';

abstract class CreateEvent extends Equatable {
  const CreateEvent();

  @override
  List<Object> get props => [];
}

class AddNewTweetEvent extends CreateEvent {
  final Map<String, dynamic> tweetData;

  AddNewTweetEvent({required this.tweetData});
  @override
  List<Object> get props => [tweetData];
}
