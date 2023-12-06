import 'package:flutter/material.dart';
import 'package:sber_app_filyakin/sliverAppBarDelegate.dart';
import 'package:sber_app_filyakin/utils/Strings.dart';
import 'package:sber_app_filyakin/utils/TextThemes.dart';

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
          style: sfProTextTheme.displayMedium
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

class SliverAppBarTabBar extends StatelessWidget {
final List<String> tabs;

const SliverAppBarTabBar({Key? key, required this.tabs}) : super(key: key);

@override
Widget build(BuildContext context) {
return SliverOverlapAbsorber(
handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
sliver: SliverPersistentHeader(
delegate: SliverAppBarDelegate(
TabBar(
labelColor: Colors.black87,
unselectedLabelColor: Colors.grey,
tabs: tabs.map((String name) => Tab(text: name)).toList(),
),
),
pinned: true,
),
);
}
}