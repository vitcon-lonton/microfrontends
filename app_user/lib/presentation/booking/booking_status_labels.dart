import 'package:flutter/material.dart';
import 'package:app_user/module/booking/booking.dart';

const kTileHeight = 50.0;
const todoColor = Color(0xffd1d2d7);
const completeColor = Color(0xff5e6172);
const inProgressColor = Color(0xff5ec792);

final Map<BookingStatus, String> statusLabels = {
  const BookingStatus.pending(): 'New',
  const BookingStatus.process(): 'Process',
  const BookingStatus.confirm(): 'Waiting Confirm',
  const BookingStatus.doing(): 'Doing',
  const BookingStatus.cancelled(): 'Cancelled',
  const BookingStatus.complete(): 'Complete',
};
