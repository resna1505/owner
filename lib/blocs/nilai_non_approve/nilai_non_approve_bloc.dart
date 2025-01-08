import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kampus/models/nilai_non_approve_model.dart';
import 'package:kampus/services/nilai_non_approve_service.dart';

part 'nilai_non_approve_event.dart';
part 'nilai_non_approve_state.dart';

class NilaiNonApproveBloc
    extends Bloc<NilaiNonApproveEvent, NilaiNonApproveState> {
  NilaiNonApproveBloc() : super(NilaiNonApproveInitial()) {
    on<NilaiNonApproveEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is NilaiNonApproveGet) {
        try {
          emit(NilaiNonApproveLoading());

          final nilai = await NilaiNonApproveService().getNilaiNonApprove();
          emit(NilaiNonApproveSuccess(nilai));
        } catch (e) {
          emit(NilaiNonApproveFailed(e.toString()));
        }
      }
    });
  }
}
