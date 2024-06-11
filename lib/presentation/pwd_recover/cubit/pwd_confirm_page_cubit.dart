import 'package:open_learning_smart_tv/presentation/login/utils/pwd_confirm_form.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../wrappers/cognito_auth.dart';
part 'pwd_confirm_page_state.dart';
part 'pwd_confirm_page_cubit.freezed.dart';

@injectable
class PwdConfirmCubit extends Cubit<PwdConfirmState> {
  final CognitoAuthManager _cognitoAuthManager;

  PwdConfirmCubit(
    this._cognitoAuthManager,
  ) : super(const PwdConfirmState.loading());

  void init() async {
    final form = PwdConfirmForm.build();
    emit(PwdConfirmState.init(form));
  }

  Future<void> confirmPassword(String code, String newPassword) async {
    //TEST
    //emit(const PwdConfirmState.success());

    final res = await _cognitoAuthManager.confirmPassword(code, newPassword);
    res.fold(
      (l) => emit(
        const PwdConfirmState.error(),
      ),
      (r) => emit(const PwdConfirmState.success()),
    );
  }
}
