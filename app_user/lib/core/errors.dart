import 'failures.dart';

class NotAuthenticatedError extends Error {}

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}

class ResponseDataError extends Error {
  final List<String>? errors;

  ResponseDataError({this.errors});

  factory ResponseDataError.fromJson(dynamic json) {
    if (json is String) {
      return ResponseDataError(errors: [json]);
    }
    if (json is List) {
      return ResponseDataError(
          errors: json.map((item) => item as String).toList());
    }

    return ResponseDataError(errors: json as List<String>);
  }
}
