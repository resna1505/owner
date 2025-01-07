part of 'discount_mahasiswa_bloc.dart';

sealed class DiscountMahasiswaEvent extends Equatable {
  const DiscountMahasiswaEvent();

  @override
  List<Object> get props => [];
}

class DiscountMahasiswatGet extends DiscountMahasiswaEvent {}
