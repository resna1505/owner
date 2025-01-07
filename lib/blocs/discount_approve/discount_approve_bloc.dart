import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kampus/models/discount_approve_model.dart';
import 'package:kampus/services/discount_approval_service.dart';

part 'discount_approve_event.dart';
part 'discount_approve_state.dart';

class DiscountApproveBloc
    extends Bloc<DiscountApproveEvent, DiscountApproveState> {
  DiscountApproveBloc() : super(DiscountApproveInitial()) {
    on<DiscountApproveEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is DiscountApproveGet) {
        try {
          emit(DiscountApproveLoading());

          final krs = await DiscountApproveService().getDiscountApprove();
          emit(DiscountApproveSuccess(krs));
        } catch (e) {
          emit(DiscountApproveFailed(e.toString()));
        }
      }
    });
  }
}
