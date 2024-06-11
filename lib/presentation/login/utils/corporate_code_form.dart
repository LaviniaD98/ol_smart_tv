import 'package:reactive_forms/reactive_forms.dart';
abstract class CorporateCodeFormGroup {
  CorporateCodeFormGroup._();
  static FormGroup build({String? username}) {
    return FormGroup(
      {
        'corporateCode': FormControl<String>(
          validators: [
            Validators.required
          ]
        ),
      },
    );
  }
}
