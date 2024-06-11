
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
            final isActive = field.value == true;

            return OlCheckbox(
              field: field,
              order: order ?? 0,
              onChanged: () {
                field.didChange(!(field.value ?? false));
                onChanged?.call(field.control);
              },
            );
            /* return InkWell(
              onTap: field.control.enabled
                  ? () {
                      field.didChange(!(field.value ?? false));
                      onChanged?.call(field.control);
                    }
                  : null,
              child: Container(
                // glowColor: isActive
                //     ? ColorManager().getColorBackgroundPrimaryCta()
                //     : null,
                child: AnimatedContainer(
                  width: Dimens.checkBoxSize,
                  height: Dimens.checkBoxSize,
                  duration: const Duration(milliseconds: 120),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isActive
                        ? ColorManager().getColorBackgroundPrimaryCta()
                        : Colors.transparent,
                    border: isActive
                        ? null
                        : Border.all(
                            color: ColorManager().getColorBorderTag(),
                            width: 1.0),
                    borderRadius: const BorderRadius.all(Radius.circular(2.0)),
                  ),
                  child: field.value != null && field.value!
                      ? SvgPicture.asset("assets/icons/checkbox_tick.svg",
                          width: 12.0,
                          colorFilter: ColorFilter.mode(
                            ColorManager().getColorTextPrimaryAlternative(),
                            BlendMode.srcIn,
                          ))
                      : null,
                ),
              ),
            );*/
          },
        );
}
