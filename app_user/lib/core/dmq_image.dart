import 'package:flutter/material.dart';

class DMQImage extends Image {
  DMQImage.network(String src, {Key? key, BoxFit? fit})
      : super.network('https://daiminhquang.acecom.vn$src', key: key, fit: fit);
}
