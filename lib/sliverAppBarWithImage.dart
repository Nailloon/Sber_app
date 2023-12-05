import 'package:flutter/material.dart';

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
        title: const Text(
          "Екатерина",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
        collapseMode: CollapseMode.pin,
        expandedTitleScale: 1.5,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(bottom: 20),
        background: Container(
          padding: const EdgeInsets.only(top: 20),
          color: Colors.white,
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              child: Image.asset(
                'assets/images/ecat.png',
                width: 110,
                height: 110,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
