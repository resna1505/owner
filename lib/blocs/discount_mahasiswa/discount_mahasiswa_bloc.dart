import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kampus/models/discount_model.dart';
import 'package:kampus/services/discount_mahasiswa_service.dart';

part 'discount_mahasiswa_event.dart';
part 'discount_mahasiswa_state.dart';

class DiscountMahasiswaBloc
    extends Bloc<DiscountMahasiswaEvent, DiscountMahasiswaState> {
  DiscountMahasiswaBloc() : super(DiscountMahasiswaInitial()) {
    on<DiscountMahasiswaEvent>((event, emit) async {
      if (event is DiscountMahasiswatGet) {
        try {
          emit(DiscountMahasiswaLoading());

          final krs = await DiscountMahasiswaService().getDiscountMahasiswa();
          emit(DiscountMahasiswaSuccess(krs));
        } catch (e) {
          emit(DiscountMahasiswaFailed(e.toString()));
        }
      }
    });
  }
}
