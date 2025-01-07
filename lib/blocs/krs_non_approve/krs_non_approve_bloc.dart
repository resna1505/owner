import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kampus/models/krs_non_approve_model.dart';
import 'package:kampus/services/krs_non_approve_service.dart';

part 'krs_non_approve_event.dart';
part 'krs_non_approve_state.dart';

class KrsNonApproveBloc extends Bloc<KrsNonApproveEvent, KrsNonApproveState> {
  KrsNonApproveBloc() : super(KrsNonApproveInitial()) {
    on<KrsNonApproveEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is KrsNonApproveGet) {
        try {
          emit(KrsNonApproveLoading());

          final krs = await KrsNonApproveService().getKrsNonApprove();
          emit(KrsNonApproveSuccess(krs));
        } catch (e) {
          emit(KrsNonApproveFailed(e.toString()));
        }
      }
    });
  }
}
