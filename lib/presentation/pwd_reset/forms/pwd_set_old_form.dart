import 'package:reactive_forms/reactive_forms.dart';
abstract class PwdSetOldForm {
  PwdSetOldForm._();
  static FormGroup build() {
    return FormGroup(
      {
        'vecchiapassword': FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
      },
    );
  }
}