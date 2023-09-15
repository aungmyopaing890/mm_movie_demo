import 'package:flutter/material.dart';
import '../../../../core/constant/dimesions.dart';

bool isFirstTime = true;

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({
    super.key,
    required this.appBarTitleName,
  });
  final String appBarTitleName;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_sharp,
              size: Dimesion.iconSize16,
            )),
      ],
      centerTitle: false,
      elevation: 0,
      title: SizedBox(
        width: Dimesion.width30 * 6,
        child: Text(appBarTitleName,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.normal, color: Colors.white)),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
