part of 'krs_approve_bloc.dart';

sealed class KrsApproveEvent extends Equatable {
  const KrsApproveEvent();

  @override
  List<Object> get props => [];
}

class KrsApproveGet extends KrsApproveEvent {}
