import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 1,
      leading: Padding(
        padding: const EdgeInsetsDirectional.only(start: 14.0),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios,
              size: 28, color: Color.fromARGB(255, 52, 80, 139)),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 14.0),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_active_outlined,
                size: 28, color: Color.fromARGB(255, 52, 80, 139)),
          ),
        ),
      ],
      title: Text(
        'About Us',
        style:CustomTextStyle.poppins300style12
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
