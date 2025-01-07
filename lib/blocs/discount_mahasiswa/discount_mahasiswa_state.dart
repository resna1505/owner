part of 'discount_mahasiswa_bloc.dart';

sealed class DiscountMahasiswaState extends Equatable {
  const DiscountMahasiswaState();

  @override
  List<Object> get props => [];
}

final class DiscountMahasiswaInitial extends DiscountMahasiswaState {}

final class DiscountMahasiswaLoading extends DiscountMahasiswaState {}

final class DiscountMahasiswaFailed extends DiscountMahasiswaState {
  final String e;
  const DiscountMahasiswaFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class DiscountMahasiswaSuccess extends DiscountMahasiswaState {
  final List<DiscountModel> discount;

  const DiscountMahasiswaSuccess(this.discount);

  @override
  List<Object> get props => [discount];
}
