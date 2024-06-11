import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/use_cases/get_stored_username_use_case.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../wrappers/cognito_auth.dart';
import '../../login/utils/login_form_group.dart';

part 'pwd_recover_page_state.dart';
part 'pwd_recover_page_cubit.freezed.dart';

@injectable
class PwdRecoverCubit extends Cubit<PwdRecoverState> {
  final CognitoAuthManager _cognitoAuthManager;
  final GetStoredUsernameUseCase _getStoredUsernameUseCase;

  PwdRecoverCubit(
    this._cognitoAuthManager,
    this._getStoredUsernameUseCase,
  ) : super(const PwdRecoverState.loading());

  void init() async {
    final storedUsername = _getStoredUsernameUseCase();
    final form = LoginFormGroup.build(username: storedUsername);
    emit(PwdRecoverState.init(form));
  }

  Future<void> forgotPassword(String username, bool remember) async {
    const PwdRecoverState.loading();

    final res = await _cognitoAuthManager.forgotPassword(
      AuthenticationDetails(
        username: username,
        password: "",
      ),
    );

    res.fold((l) {
      l.maybeMap(recoverPasswordError: (error) {
        emit(
          PwdRecoverState.error(error.errorMessage),
        );
      }, orElse: () {
        emit(
          PwdRecoverState.error(LabelsManager().getRemoteStringFromLabelKeys(
              RemoteLabelKeys.cognito_recover_password_generic_error)),
        );
      });
      final form = LoginFormGroup.build(username: username);
      emit(PwdRecoverState.init(form));
    }, (r) {
      emit(PwdRecoverState.mfaValidation(remember, username));
      final form = LoginFormGroup.build(username: username);
      emit(PwdRecoverState.init(form));
    });
  }
}
