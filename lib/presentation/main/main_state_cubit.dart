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

  OlFocusScopeNode? latestSearchFocusNode;
  OlFocusScopeNode? latestForYouFocusNode;
  OlFocusScopeNode? latestExploreFocusNode;
  OlFocusScopeNode? latestFavoritesFocusNode;
  OlFocusScopeNode? latestAgendaFocusNode;
  OlFocusScopeNode? latestProfileFocusNode;

  FavoritesContentCubit? favoriteContentCubit;

  OrderedTraversalPolicy? policy;

  int selectedIndex = 1;

  void setFocusNode(OlFocusScopeNode focusNode) {
    emit(focusNode);
  }

  void setNestedFocusNode(OlFocusScopeNode focusNode) {
    if (selectedIndex == 0) {
      latestSearchFocusNode = focusNode;
    } else if (selectedIndex == 1) {
      latestForYouFocusNode = focusNode;
    } else if (selectedIndex == 2) {
      latestExploreFocusNode = focusNode;
    } else if (selectedIndex == 3) {
      latestFavoritesFocusNode = focusNode;
    } else if (selectedIndex == 4) {
      latestAgendaFocusNode = focusNode;
    } else if (selectedIndex == 5) {
      latestProfileFocusNode = focusNode;
    }
  }

  void resetNestedFocusNode() {
    latestSearchFocusNode = null;
    latestForYouFocusNode = null;
    latestExploreFocusNode = null;
    latestFavoritesFocusNode = null;
    latestAgendaFocusNode = null;
    latestProfileFocusNode = null;
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
