import 'package:flutter/material.dart';
import 'package:app_user/module/booking/booking.dart';

const kTileHeight = 50.0;
const todoColor = Color(0xffd1d2d7);
const completeColor = Color(0xff5e6172);
const inProgressColor = Color(0xff5ec792);

const Map<BookingStatus, String> statusLabels = {
  BookingStatus.pending: 'Pending',
  BookingStatus.accepted: 'Accepted',
  BookingStatus.process: 'Process',
  BookingStatus.doing: 'Doing',
  BookingStatus.complete: 'Complete',
  BookingStatus.cancelled: 'Cancelled',
};
