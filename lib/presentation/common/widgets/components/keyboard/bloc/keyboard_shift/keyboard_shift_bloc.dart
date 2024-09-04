import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/keyboard/data/lower_case.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/keyboard/data/symbols.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/keyboard/data/upper_case.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/keyboard/src/utils.dart';

part 'keyboard_shift_event.dart';
part 'keyboard_shift_state.dart';

class KeyboardShiftBloc extends Bloc<KeyboardShiftEvent, KeyboardShiftState> {
  KeyboardShiftBloc({required this.initialCase})
      : super(
          KeyboardShiftInitial(initialCase: initialCase),
        ) {
    //on((event, emit) => (emit(const KeyboardShiftLoading(loading))));

    on<KeyboardShiftUpperCaseEvent>((event, emit) {
      //
      emit(const KeyboardShiftUpperCase(upperCase));
    });
    on<KeyboardShiftSymbolsEvent>((event, emit) {
      //

      if (state is KeyboardShiftLowerCase) {
        isLastStateUppercase = false;
      } else {
        isLastStateUppercase = true;
      }
      emit(const KeyboardShiftSymbols(symbols));
    });
    on<KeyboardShiftLowerCaseEvent>((event, emit) {
      //
      emit(const KeyboardShiftLowerCase(lowerCase));
    });
  }

  final InitialCase initialCase;

  bool isLastStateUppercase = true;
}
