import 'package:flutter/material.dart';
import 'package:sber_app_filyakin/utils/ColorsPalete.dart';
import 'package:sber_app_filyakin/widgets/cards.dart';
import 'package:sber_app_filyakin/widgets/chips.dart';
import 'package:sber_app_filyakin/widgets/headerAndText.dart';
import 'package:sber_app_filyakin/utils/Strings.dart';
import 'package:sber_app_filyakin/widgets/wideButton.dart';

class ProfileTabScreen extends StatelessWidget {
  const ProfileTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var buttons = [
      WideButtonData(
        imagePath: "assets/icons/ic_36_speedometer.png",
        buttonText: HeaderAndText(
          label: Strings.of(context).dailyLimit,
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          text: Strings.of(context).limitText,
          height: 4,
        ),
        onTap: () {},
      ),
      WideButtonData(
        imagePath: "assets/icons/ic_36_percent.png",
        buttonText: HeaderAndText(
          label: Strings.of(context).transferWithoutCommision,
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          text: Strings.of(context).transferText,
          height: 4,
        ),
        onTap: () {},
      ),
      WideButtonData(
        imagePath: "assets/icons/ic_36_arrows_forward_back.png",
        buttonText: HeaderAndText(
          label: Strings.of(context).transferInfo,
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          height: 4,
        ),
        onTap: () {},
      ),
    ];
    var chipsText = [
      Strings.of(context).food,
      Strings.of(context).selfDevelopment,
      Strings.of(context).technologies,
      Strings.of(context).home,
      Strings.of(context).leisure,
      Strings.of(context).selfcare,
      Strings.of(context).science,
    ];
    var cards = [
      CardInfo(
          labelText: Strings.of(context).sberPrime,
          underCardText: HeaderAndText(
            label: Strings.of(context).paymentDate,
            text: Strings.of(context).paymentPrice,
            height: 4,
            labelStyle: Theme.of(context).textTheme.labelMedium,
            textStyle: Theme.of(context).textTheme.labelSmall,
          ),
          image: "assets/images/sverPrime.png"),
      CardInfo(
          labelText: Strings.of(context).transfer,
          underCardText: HeaderAndText(
            label: Strings.of(context).paymentDate2,
            text: Strings.of(context).paymentPrice,
            height: 4,
            labelStyle: Theme.of(context).textTheme.labelMedium,
            textStyle: Theme.of(context).textTheme.labelSmall,
          ),
          image: "assets/images/percent.png")
    ];
    return SafeArea(
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: HeaderAndText(
                          label: Strings.of(context).services,
                          text: Strings.of(context).servicesText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 46.0),
                        child: SizedBox(
                            height: 130,
                            child: ListViewWithMyCards(myCards: cards)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: HeaderAndText(
                            label: Strings.of(context).tariffs,
                            text: Strings.of(context).operations),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 46.0),
                        child: WideButtonList(buttons: buttons),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: HeaderAndText(
                            label: Strings.of(context).interests,
                            text: Strings.of(context).interestsDescription),
                      ),
                      ChipsWidget(
                          chipList: chipsText,
                          neutralColor: ColorPalette.blackColorWithOpacity,
                          selectedColor: ColorPalette.mainGreenColor),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
