import 'package:open_learning_smart_tv/presentation/login/utils/pwd_confirm_form.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../wrappers/cognito_auth.dart';
part 'pwd_reset_page_state.dart';
part 'pwd_reset_page_cubit.freezed.dart';

@injectable
class PwdResetCubit extends Cubit<PwdResetState> {
  final CognitoAuthManager _cognitoAuthManager;

  PwdResetCubit(
    this._cognitoAuthManager,
  ) : super(const PwdResetState.loading());

  void init() async {
    final form = PwdConfirmForm.build();
    emit(PwdResetState.init(form));
  }

  Future<void> changePassword(String oldPwd, String newPwd) async {
    final res = await _cognitoAuthManager.changePassword(oldPwd, newPwd);
    res.fold((l) {
      emit(const PwdResetState.error(RemoteLabelKeys.error_occurred));
    }, (r) {
      emit(const PwdResetState.success());
    });
  }

  Future<void> firstTimeResetPassword(String oldPwd, String newPwd,
      CognitoUserNewPasswordRequiredException exception) async {
    final res = await _cognitoAuthManager.firstTimePasswordChange(
        oldPwd, newPwd, exception);
    res.fold((l) {
      if (exception.requiredAttributes?.isNotEmpty == true) {
        emit(const PwdResetState.error(RemoteLabelKeys.error_password_reset));
      } else {
        emit(const PwdResetState.error(RemoteLabelKeys.error_occurred));
      }
    }, (r) {
      emit(const PwdResetState.success());
    });
  }
}
