import 'package:flutter/material.dart';

class DMQImage extends Image {
  DMQImage.network(String src, {Key? key, BoxFit? fit})
      : super.network('https://shome.246.vn$src', key: key, fit: fit);
}
