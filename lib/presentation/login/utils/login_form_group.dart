import 'package:reactive_forms/reactive_forms.dart';
abstract class LoginFormGroup {
  LoginFormGroup._();
  static FormGroup build({String? username}) {
    return FormGroup(
      {
        'username': FormControl<String>(
          value: username,
          validators: [
            Validators.required,
          ],
        ),
        'password': FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
        'remember': FormControl<bool>(
          value: username != null,
        ),
      },
    );
  }
}
