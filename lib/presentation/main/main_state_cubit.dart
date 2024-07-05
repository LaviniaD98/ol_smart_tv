import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainStateCubit extends Cubit<FocusScopeNode> {
  MainStateCubit() : super(FocusScopeNode());

  FocusScopeNode? searchFocusNode;
  FocusScopeNode? forYouFocusNode;
  FocusScopeNode? exploreFocusNode;
  FocusScopeNode? favoritesFocusNode;
  FocusScopeNode? agendaFocusNode;
  FocusScopeNode? profileFocusNode;

  OrderedTraversalPolicy? policy;

  void setFocusNode(FocusScopeNode focusNode) {
    emit(focusNode);
  }

  void next() {
    policy?.next(state);
  }

  void previous() {
    policy?.previous(state);
  }

  dispose() {
    searchFocusNode?.dispose();
    forYouFocusNode?.dispose();
    exploreFocusNode?.dispose();
    favoritesFocusNode?.dispose();
    agendaFocusNode?.dispose();
    profileFocusNode?.dispose();
    state.dispose();
  }
}
