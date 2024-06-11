import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/domain/entities/self/self_model.dart';
import 'package:open_learning_smart_tv/domain/use_cases/session/create_session_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/get_user_self.dart';
import 'package:open_learning_smart_tv/domain/use_cases/handler_stored_username_use_case.dart';
import 'package:open_learning_smart_tv/wrappers/cognito_auth.dart';

part 'mfa_state.dart';

part 'mfa_cubit.freezed.dart';

@injectable
class MfaCubit extends Cubit<MfaState> {
  final CognitoAuthManager _cognitoAuthManager;
  final CreateSessionUseCase _createSessionUseCase;
  final HandlerStoredUsernameUseCase _handlerStoredUsernameUseCase;
  final GetUserSelfUseCase _getUserSelfUseCase;

  MfaCubit(
    this._cognitoAuthManager,
    this._handlerStoredUsernameUseCase,
    this._createSessionUseCase,
    this._getUserSelfUseCase,
  ) : super(const MfaState.initial());

  Future<void> sendMFA(String code,
      {bool remember = false, int tentative = 1}) async {
    final currentState = state;
    emit(const MfaState.loading());
    if (currentState is _TryAgain) {
      tentative = currentState.tentative + 1;
    }
    final res = await _cognitoAuthManager.sendMFA(code, tentative);
    res.fold(
      (l) {
        emit(const MfaState.initial());

        print('LEFT-------${l}');
        return l.maybeWhen(
          cognitoUserCustomChallenge: () => emit(MfaState.tryAgain(tentative)),
          orElse: () => emit(const MfaState.error()),
        );
      },
      (r) => _createSession(remember, r),
    );
  }

  Future<void> sendMFAForRecoverPwd(String code) async {
    emit(MfaState.recoverPassword(code));
  }

  Future<void> _createSession(bool remember, CognitoUserSession session) async {
    final res = await _createSessionUseCase(session);
    res.fold((l) {
      emit(const MfaState.error());
    }, (sessionId) async {
      _getUserSelf(remember, session, sessionId);
    });
  }

  Future<void> _getUserSelf(
      bool remember, CognitoUserSession session, String sessionId) async {
    final res =
        await _getUserSelfUseCase(session.accessToken.jwtToken, sessionId);
    res.fold((l) {
      emit(const MfaState.error());
    }, (r) async {
      if (r.privacyConsentFlag == false) {
        _handlerStoredUsernameUseCase(
          username: _cognitoAuthManager.cognitoUser.username,
          remember: remember,
        );
        emit(MfaState.showPolicyPage(session, r, sessionId));
      } else {
        _handlerStoredUsernameUseCase(
          username: _cognitoAuthManager.cognitoUser.username,
          remember: remember,
        );
        emit(MfaState.showInitiatives(session, r, sessionId));
      }
    });
  }

  Future<void> resendMfaCodeToUser() async {
    emit(const MfaState.loading());
    final res = await _cognitoAuthManager.resendMfaCodeToUser();
    emit(const MfaState.initial());
    res.maybeWhen(
      cognitoUserCustomChallenge: () => emit(const MfaState.tryAgain(0)),
      orElse: () => emit(const MfaState.error()),
    );
  }
}
