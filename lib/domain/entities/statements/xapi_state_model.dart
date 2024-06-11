import 'package:open_learning_smart_tv/data/models/responses/statements/xapi_state_results_dto.dart';
import 'package:equatable/equatable.dart';

class XapiStateModel extends Equatable {
  final bool? attemptComplete;
  final double? attemptDuration;
  final int? location;

  const XapiStateModel(
      {this.attemptComplete, this.attemptDuration, this.location});

  factory XapiStateModel.fromResponse(XapiStateResultsDto response) {
    return XapiStateModel(
      attemptComplete: response.attemptComplete,
      attemptDuration: response.attemptDuration,
      location: response.location,
    );
  }

  @override
  List<Object?> get props => [attemptComplete, attemptDuration, location];
}
