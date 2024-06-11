import 'package:reactive_forms/reactive_forms.dart';
abstract class PwdConfirmForm {
  PwdConfirmForm._();
  static FormGroup build() {
    return FormGroup(
      {
        'nuovapassword': FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
        'confermapassword': FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
      },
    );
  }
}