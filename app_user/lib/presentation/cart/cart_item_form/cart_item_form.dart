import 'dart:convert';
import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kt_dart/collection.dart';
import 'package:logger/logger.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:app_user/core/core.dart';
import 'package:app_user/i18n/i18n.dart';
import 'package:app_user/injection.dart';
import 'package:app_user/module/cart/cart.dart';
import 'package:app_user/module/service/service.dart';
import 'package:app_user/presentation/routes/routes.dart';
import 'package:app_user/presentation/service/service.dart';
part 'cart_item_form_page.dart';
part 'cart_item_images_selector.dart';
