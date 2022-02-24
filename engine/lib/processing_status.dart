import 'package:freezed_annotation/freezed_annotation.dart';

part 'processing_status.freezed.dart';

const STATUS_IDLE = ProcessingStatus.idle();
const STATUS_BUSY = ProcessingStatus.busy();
const STATUS_FAILED = ProcessingStatus.failed();
const STATUS_COMPLETE = ProcessingStatus.complete();

@freezed
class ProcessingStatus with _$ProcessingStatus {
  const factory ProcessingStatus.idle() = _Idle;
  const factory ProcessingStatus.busy() = _Busy;
  const factory ProcessingStatus.failed() = _Failed;
  const factory ProcessingStatus.complete() = _Complete;
}
