part of 'krs_non_approve_bloc.dart';

sealed class KrsNonApproveEvent extends Equatable {
  const KrsNonApproveEvent();

  @override
  List<Object> get props => [];
}

class KrsNonApproveGet extends KrsNonApproveEvent {}
