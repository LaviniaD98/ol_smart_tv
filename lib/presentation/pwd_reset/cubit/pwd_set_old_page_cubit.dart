import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'pwd_set_old_page_state.dart';
part 'pwd_set_old_page_cubit.freezed.dart';

@injectable
class PwdSetOldPageCubit extends Cubit<PwdSetOldState> {
  PwdSetOldPageCubit() : super (const PwdSetOldState.init());
  void init() async {
  }
}