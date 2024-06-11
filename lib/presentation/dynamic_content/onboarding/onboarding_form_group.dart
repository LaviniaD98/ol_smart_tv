
import 'package:reactive_forms/reactive_forms.dart';

abstract class OnboardingFormGroup {
  OnboardingFormGroup._();
  static FormGroup build(bool? initialValue) {
    return FormGroup({
      'neverShowAgain': FormControl<bool>(
          value: initialValue
      ),
    });
    }
}