import 'package:dartz/dartz.dart';
import 'package:app_user/core/core.dart';

class ItemNote extends ValueObject<String> {
  static const maxLength = 10;
  // static const maxLength = 200;

  @override
  final Either<ValueFailure<String>, String> value;

  factory ItemNote(String input) {
    return ItemNote._(
      validateSingleLine(input)
          .flatMap((value) => validateMaxStringLength(input, maxLength)),
    );
  }

  const ItemNote._(this.value);
}
