part of 'discount_approve_bloc.dart';

sealed class DiscountApproveState extends Equatable {
  const DiscountApproveState();

  @override
  List<Object> get props => [];
}

final class DiscountApproveInitial extends DiscountApproveState {}

final class DiscountApproveLoading extends DiscountApproveState {}

final class DiscountApproveFailed extends DiscountApproveState {
  final String e;
  const DiscountApproveFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class DiscountApproveSuccess extends DiscountApproveState {
  final List<DiscountApproveModel> discountApprove;

  const DiscountApproveSuccess(this.discountApprove);

  @override
  List<Object> get props => [discountApprove];
}
