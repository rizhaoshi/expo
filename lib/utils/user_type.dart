import 'package:expo/common/config/app_colors.dart';
import 'package:flutter/widgets.dart';

class UserType {
  static Map enType = {'NORMAL_USER': 'NORMAL_USER', 'DQ_SINGER': 'DQ_SINGER', 'DQ_OFFICIAL_ACCOUNT': 'DQ_OFFICIAL_ACCOUNT', "ADMIN": "ADMIN"};

  static Map cnType = {'NORMAL_USER': '普通用户', 'DQ_SINGER': '歌手', 'DQ_OFFICIAL_ACCOUNT': '博览号', "ADMIN": "管理员"};

  static Map colorType = {'NORMAL_USER': AppColors.unactive, 'DQ_SINGER': AppColors.info, 'DQ_OFFICIAL_ACCOUNT': AppColors.success, "ADMIN": AppColors.danger};

  static String formCn(String type) {
    return cnType[type] ?? "游客";
  }

  static String formEn(String type) {
    return enType[type] ?? "";
  }

  static Color formColor(String type) {
    return colorType[type] ?? AppColors.unactive;
  }

  static bool isNormal(String type) => enType['NORMAL_USER'] == type;

  static bool isSinger(String type) => enType['DQ_SINGER'] == type;

  static bool isOfficial(String type) => enType['DQ_OFFICIAL_ACCOUNT'] == type;

  static bool isAdmin(String type) => enType['ADMIN'] == type;
}
