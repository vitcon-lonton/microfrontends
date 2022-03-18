import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
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

class List6<T> extends ValueObject<KtList<T>> {
  static const maxLength = 6;

  @override
  final Either<ValueFailure<KtList<T>>, KtList<T>> value;

  bool get isFull => length == maxLength;

  int get length => value.getOrElse(() => emptyList()).size;

  factory List6(KtList<T> input) {
    return List6._(validateMaxListLength(input, maxLength));
  }

  const List6._(this.value);
}
