import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/cubit/favorites_content_cubit.dart';

class MainStateCubit extends Cubit<OlFocusScopeNode> {
  MainStateCubit() : super(OlFocusScopeNode(id: 'mainFocusNode'));

  OlFocusScopeNode? searchFocusNode;
  OlFocusScopeNode? forYouFocusNode;
  OlFocusScopeNode? exploreFocusNode;
  OlFocusScopeNode? favoritesFocusNode;
  OlFocusScopeNode? agendaFocusNode;
  OlFocusScopeNode? profileFocusNode;

  FavoritesContentCubit? favoriteContentCubit;

  OrderedTraversalPolicy? policy;

  void setFocusNode(OlFocusScopeNode focusNode) {
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
