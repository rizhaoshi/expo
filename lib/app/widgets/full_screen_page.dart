import 'package:expo/common/config/app_colors.dart';
import 'package:flutter/material.dart';

import 'immersive_app_bar.dart';

//全屏组件
class FullScreenPage extends StatelessWidget {
  final Widget child;
  final Color bgColor;

  //标题
  final double height;
  final Widget? appBarTitle;

  // 左侧图标
  final double leadingWidth;
  final Widget? leadingIcon;
  final bool showLeading;
  final VoidCallback? onLeadingTap;

  // 右侧图标
  final double actionWidth;
  final Widget? actionIcon;
  final bool showAction;
  final VoidCallback? onActionTap;

  const FullScreenPage({
    Key? key,
    required this.child,
    this.bgColor = AppColors.primary,
    this.height = 45.0,
    this.appBarTitle,
    this.leadingWidth = 45.0,
    this.leadingIcon,
    this.showLeading = true,
    this.onLeadingTap,
    this.actionWidth = 45.0,
    this.actionIcon,
    this.showAction = true,
    this.onActionTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: bgColor,
          child: child,
        ),
        ImmersiveAppBar(
          height: height,
          title: appBarTitle,
          leadingIcon: leadingIcon,
          leadingWidth: leadingWidth,
          showLeading: showLeading,
          onLeadingTap: onLeadingTap,
          actionIcon: actionIcon,
          actionWidth: actionWidth,
          showAction: showAction,
          onActionTap: onActionTap,
        ),
      ],
    );
  }
}
