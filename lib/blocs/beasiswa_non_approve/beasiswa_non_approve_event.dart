part of 'beasiswa_non_approve_bloc.dart';

sealed class BeasiswaNonApproveEvent extends Equatable {
  const BeasiswaNonApproveEvent();

  @override
  List<Object> get props => [];
}

class BeasiswaNonApproveGet extends BeasiswaNonApproveEvent {}
