import 'package:flutter/material.dart';

class XAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final bool showBack;

  const XAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.centerTitle = true,
    this.showBack = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? Text(title!) : null,
      centerTitle: centerTitle,
      actions: actions,
      leading: leading,
      automaticallyImplyLeading: showBack,
      elevation: 0,
    );
  }
}
