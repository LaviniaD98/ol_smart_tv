import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/domain/entities/self/self_model.dart';
import 'package:open_learning_smart_tv/domain/use_cases/self/set_privacyconsent_use_case.dart';

part 'privacy_state.dart';
part 'privacy_cubit.freezed.dart';

@injectable
class PrivacyCubit extends Cubit<PrivacyState> {
  final SetPrivacyConsentUseCase _setPrivacyConsentUseCase;

  PrivacyCubit(
    this._setPrivacyConsentUseCase,
  ) : super(const PrivacyState.initial());

  Future<void> confirmPrivacyPolicy(
      {CognitoUserSession? session,
      required SelfModel selfModel,
      String? sessionId}) async {
    emit(const PrivacyState.loading());
    final res = await _setPrivacyConsentUseCase(
        session?.accessToken.jwtToken, sessionId);
    res.fold((l) {
      emit(const PrivacyState.error());
    }, (r) {
      emit(PrivacyState.showInitiatives(session, selfModel, sessionId));
    });
  }
}
