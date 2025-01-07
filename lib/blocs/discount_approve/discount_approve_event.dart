part of 'discount_approve_bloc.dart';

sealed class DiscountApproveEvent extends Equatable {
  const DiscountApproveEvent();

  @override
  List<Object> get props => [];
}

class DiscountApproveGet extends DiscountApproveEvent {}
