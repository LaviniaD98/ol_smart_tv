//import 'package:flutter_glow/flutter_glow.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_checkbox.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveCheckboxField extends ReactiveFocusableFormField<bool, bool> {
  ReactiveCheckboxField({
    super.key,
    super.formControlName,
    super.formControl,
    int? order,
    ReactiveFormFieldCallback<bool>? onChanged,
  }) : super(
          focusNode: null,
          showErrors: (_) => false,
          builder: (field) {
            return OlCheckbox(
              field: field,
              order: order ?? 0,
              onChanged: () {
                field.didChange(!(field.value ?? false));
                onChanged?.call(field.control);
              },
            );
          },
        );
}
