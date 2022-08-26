import 'package:expo/common/config/app_colors.dart';
import 'package:expo/utils/common_util.dart';
import 'package:expo/utils/user_type.dart';
import 'package:flutter/material.dart';

class AvatarRoleName extends StatelessWidget {
  final String avatar;
  final String? nickname;
  final String? type;
  final bool showType;

  const AvatarRoleName({Key? key, required this.avatar, this.nickname, this.type, this.showType = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _avatar(),
        Offstage(
          offstage: showType,
          child: _role(),
        ),
        _nickName(),
      ],
    );
  }

  Widget _avatar() {
    return SizedBox(
      width: 20,
      height: 20,
      child: ClipOval(
        child: FadeInImage.assetNetwork(placeholder: CommonUtils.getCommonImageByName('lazy_1'), image: avatar),
      ),
    );
  }

  Widget _nickName() {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.only(left: 6),
      child: Text(
        nickname ?? "",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: AppColors.unactive, fontSize: 14),
      ),
    ));
  }

  Widget _role() {
    return Container(
      margin: const EdgeInsets.only(left: 6),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
      decoration: BoxDecoration(color: UserType.formColor(type ?? ""), borderRadius: BorderRadius.circular(4)),
      child: Text(
        UserType.formCn(type ?? ""),
        style: const TextStyle(color: Colors.white, fontSize: 8),
      ),
    );
  }
}
