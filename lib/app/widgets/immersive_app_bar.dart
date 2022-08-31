import 'package:flutter/material.dart';

class ImmersiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Widget? title;

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

  const ImmersiveAppBar({
    Key? key,
    this.height = 45.0,
    this.leadingWidth = 45.0,
    this.leadingIcon,
    this.showLeading = true,
    this.onLeadingTap,
    this.actionWidth = 45.0,
    this.actionIcon,
    this.showAction = true,
    this.onActionTap,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Widget _leading;
    late Widget _action;
    late Widget _title;
    if (leadingIcon == null) {
      if (showLeading) {
        _leading = ConstrainedBox(
          constraints: BoxConstraints(maxHeight: leadingWidth, maxWidth: leadingWidth),
          child: BackButton(
            onPressed: onLeadingTap,
          ),
        );
      } else {
        _leading = const SizedBox.shrink();
      }
    } else {
      _leading = ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: leadingWidth,
          height: leadingWidth,
        ),
        child: IconButton(
          icon: leadingIcon!,
          onPressed: onLeadingTap,
        ),
      );
    }
    // 右侧按钮
    if (actionIcon != null && showAction) {
      _action = ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: actionWidth,
          height: actionWidth,
        ),
        child: IconButton(
          icon: actionIcon!,
          onPressed: onActionTap,
        ),
      );
    } else {
      _action = const SizedBox.shrink();
    }
    // 标题
    if (title != null) {
      _title = Expanded(
        child: Container(
          child: title,
        ),
      );
    } else {
      _title = const Expanded(child: SizedBox.shrink());
    }

    return SafeArea(
        child: PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _leading,
          _title,
          _action,
        ],
      ),
    ));
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
