part of 'nilai_approve_bloc.dart';

sealed class NilaiApproveEvent extends Equatable {
  const NilaiApproveEvent();

  @override
  List<Object> get props => [];
}

class NilaiApproveGet extends NilaiApproveEvent {}
