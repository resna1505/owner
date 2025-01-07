part of 'beasiswa_approve_bloc.dart';

sealed class BeasiswaApproveEvent extends Equatable {
  const BeasiswaApproveEvent();

  @override
  List<Object> get props => [];
}

class BeasiswaApproveGet extends BeasiswaApproveEvent {}
