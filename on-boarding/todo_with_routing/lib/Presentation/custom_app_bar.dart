import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String customTitle;
  const CustomAppBar({required this.customTitle,Key? key}): super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 40,
          color: Color.fromRGBO(36, 47, 101, 1),
        ),
      ),
      title: Center(
        child: Text(customTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color.fromRGBO(36, 47, 101, 1),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.more_vert,
            size: 40,
            color: Color.fromRGBO(36, 47, 101, 1),
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
