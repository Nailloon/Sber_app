import "package:flutter/material.dart";
import "package:sber_app_filyakin/widgets/headerAndText.dart";

class CardInfo {
  final String labelText;
  final HeaderAndText underCardText;
  final String image;
  const CardInfo(
      {required this.labelText,
      required this.underCardText,
      required this.image});
}

class MyCard extends StatelessWidget {
  final CardInfo cardInfo;
  const MyCard({Key? key, required this.cardInfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 216,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Color(0x114F4F6C),
                  blurRadius: 14,
                  offset: Offset(0, 8),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(cardInfo.image),
                  Text(
                    cardInfo.labelText,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
              cardInfo.underCardText
            ],
          ),
        ));
  }
}

class ListViewWithMyCards extends StatelessWidget {
final List<CardInfo> myCards;

const ListViewWithMyCards({Key? key, required this.myCards}) : super(key: key);

@override
Widget build(BuildContext context) {
return ListView.separated(
  separatorBuilder: (BuildContext context, int index) {
      return SizedBox(width:8.0);
   },
clipBehavior: Clip.none,
scrollDirection: Axis.horizontal,

physics: const BouncingScrollPhysics(
parent: AlwaysScrollableScrollPhysics(),
decelerationRate: ScrollDecelerationRate.fast),
itemCount: myCards.length,
itemBuilder: (BuildContext context, int index) {
return MyCard(cardInfo: myCards[index]);
},
);
}
}
