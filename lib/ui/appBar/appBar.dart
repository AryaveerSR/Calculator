import 'package:flutter/material.dart' hide IconButton;

import 'themeSwitch.dart';

class AppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: const [Spacer(), ThemeSwitch(), Spacer()],
            ),
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
