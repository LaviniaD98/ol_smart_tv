import 'package:open_learning_smart_tv/presentation/search/widgets/reactive_search_input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../theme/app_theme.dart';
import '../search_page.dart';

class SearchButton extends StatefulWidget {
  final EdgeInsets? padding;

  const SearchButton({super.key, this.padding});

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  final form = FormGroup({'search': FormControl<String>()});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: Dimens.spacingL),
      child: InkWell(
        highlightColor: Colors.transparent,
        onTap: () => context.pushNamed(SearchPage.routeName),
        child: IgnorePointer(
          ignoring: true,
          child: Hero(
            tag: 'search-input',
            child: ReactiveForm(
              formGroup: form,
              child: const ReactiveSearchInput(
                readOnly: true,
                formControlName: 'search',
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }
}
