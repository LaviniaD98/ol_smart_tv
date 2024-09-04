import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/cubit/favorites_content_cubit.dart';

class MainStateCubit extends Cubit<FocusScopeNode> {
  MainStateCubit() : super(FocusScopeNode());

  FocusScopeNode? searchFocusNode;
  FocusScopeNode? forYouFocusNode;
  FocusScopeNode? exploreFocusNode;
  FocusScopeNode? favoritesFocusNode;
  FocusScopeNode? agendaFocusNode;
  FocusScopeNode? profileFocusNode;

  FavoritesContentCubit? favoriteContentCubit;

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
