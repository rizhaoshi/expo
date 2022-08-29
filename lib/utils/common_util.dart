import 'dart:math';

import 'package:flutter/material.dart';

class CommonUtils {
  static String getCommonImageByName(String imageName) {
    return 'assets/images/common/' + imageName + ".png";
  }

  static String getImageAssetByName(String imageName) {
    return 'assets/images/icons/' + imageName + ".png";
  }

  //转为rpx
  static double toRpx(BuildContext context, double size) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return size * rpx;
  }

  static formatCharCount(int? count) {
    if (count == null || count <= 0 || count.isNaN) return 0;
    String countStr = count.toString();
    if (countStr.length >= 5) {
      String prefix = countStr.substring(0, countStr.length - 4);
      if (countStr.length == 5) {
        prefix += '.${countStr[1]}';
      }
      if (countStr.length == 6) {
        prefix += '.${countStr[2]}';
      }

      return "${prefix}w";
    }
    return countStr;
  }

  static int getRandomRangeInt(int min, int max) {
    final Random random = Random();
    return min + random.nextInt(max + 1 - min);
  }
}
