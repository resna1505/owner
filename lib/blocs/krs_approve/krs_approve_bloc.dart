import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kampus/models/krs_approve_model.dart';
import 'package:kampus/services/krs_approve_service.dart';

part 'krs_approve_event.dart';
part 'krs_approve_state.dart';

class KrsApproveBloc extends Bloc<KrsApproveEvent, KrsApproveState> {
  KrsApproveBloc() : super(KrsApproveInitial()) {
    on<KrsApproveEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is KrsApproveGet) {
        try {
          emit(KrsApproveLoading());

          final krs = await KrsApproveService().getKrsApprove();
          emit(KrsApproveSuccess(krs));
        } catch (e) {
          emit(KrsApproveFailed(e.toString()));
        }
      }
    });
  }
}
