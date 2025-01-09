import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kampus/models/total_mahasiswa_model.dart';
import 'package:kampus/services/total_mahasiswa_service.dart';

part 'total_mahasiswa_event.dart';
part 'total_mahasiswa_state.dart';

class TotalMahasiswaBloc
    extends Bloc<TotalMahasiswaEvent, TotalMahasiswaState> {
  TotalMahasiswaBloc() : super(TotalMahasiswaInitial()) {
    on<TotalMahasiswaEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is TotalMahasiswaGet) {
        try {
          emit(TotalMahasiswaLoading());

          final mhs = await TotalMahasiswaService().getMahasiswa();
          emit(TotalMahasiswaSuccess(mhs));
        } catch (e) {
          emit(TotalMahasiswaFailed(e.toString()));
        }
      }
    });
  }
}
