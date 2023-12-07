import "package:flutter/material.dart";
import "package:sber_app_filyakin/utils/ColorsPalete.dart";
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
double parentHeight = MediaQuery.of(context).size.height;
double sizedBoxHeight = parentHeight - 32;
return SizedBox(
    width: 216,
    height: sizedBoxHeight,
    child: DecoratedBox(
      decoration: BoxDecoration(
          color: ColorPalette.whiteColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: ColorPalette.boxShadowColor1,
              blurRadius: 14,
              offset: Offset(0, 8),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: ColorPalette.boxShadowColor2,
              blurRadius: 10,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(cardInfo.image),
                const SizedBox(
                  width: 12.0,
                ),
                Text(
                  cardInfo.labelText,
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
            const SizedBox(
              height: 22.0,
            ),
            cardInfo.underCardText
          ],
        ),
      ),
    ));
}
}







class ListViewWithMyCards extends StatelessWidget {
  final List<CardInfo> myCards;

  const ListViewWithMyCards({Key? key, required this.myCards})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 8.0);
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
