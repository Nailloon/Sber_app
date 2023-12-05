import 'package:flutter/material.dart';
import 'package:sber_app_filyakin/sliverAppBarDelegate.dart';
import 'package:sber_app_filyakin/utils/Strings.dart';

class sliverAppBarWithImage extends StatelessWidget {
  const sliverAppBarWithImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      leading: IconButton(
        onPressed: () {},
        icon: Image.asset("assets/icons/ic_24_cross.png"),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset("assets/icons/ic_24_arrow_right_square.png"),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          Strings.of(context).userName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
        collapseMode: CollapseMode.pin,
        expandedTitleScale: 1.5,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(bottom: 20),
        background: Center(
          child: SizedBox(height: 110, width:110,
              child: Image.asset(
                'assets/images/ecat.png',
              ),
          ),
        ),
      ),
    );
  }
}

class SliverAppTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> tabs;

  const SliverAppTabBar({Key? key, required this.tabs}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.black87,
      unselectedLabelColor: Colors.grey,
      tabs: tabs.map((String name) => Tab(text: name)).toList(),
    );
  }
}