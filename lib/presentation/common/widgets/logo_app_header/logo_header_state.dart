part of 'logo_header_cubit.dart';

@freezed
class LogoHeaderState with _$LogoHeaderState {
  const factory LogoHeaderState.loading() = _Loading;
  const factory LogoHeaderState.success({String? image, String? name, String? surname}) = _Success;
}