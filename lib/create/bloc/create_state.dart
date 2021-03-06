part of 'create_bloc.dart';

abstract class CreateState extends Equatable {
  const CreateState();

  @override
  List<Object> get props => [];
}

class CreateInitial extends CreateState {}

class CreateSuccessState extends CreateState {}

class CreateErrorState extends CreateState {}
