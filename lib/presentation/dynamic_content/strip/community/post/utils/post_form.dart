import 'package:reactive_forms/reactive_forms.dart';

class PostForm {
  static FormGroup build([String? description]) {
    return FormGroup(
        {
          'body': FormControl<String>(
            value: description,
            validators: [
              Validators.required,
              Validators.maxLength(500),
            ],
          ),
        }
    );
  }
}

class PostLinkForm {
  static FormGroup build([String? url, String? label]) {
    return FormGroup(
        {
          'label': FormControl<String>(
            value: label,
            validators: [
              Validators.required,
            ],
          ),
          'url': FormControl<String>(
            value: url,
            validators: [
              Validators.required,
            ],
          ),
        },
    );
  }
}

