part of 'wall_cubit.dart';

@freezed
class WallState with _$WallState {
  const factory WallState.initialized() = _Initialized;
  const factory WallState.idle() = _Idle;
}
