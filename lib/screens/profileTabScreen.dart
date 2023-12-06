import 'package:flutter/material.dart';
import 'package:sber_app_filyakin/widgets/chips.dart';
import 'package:sber_app_filyakin/widgets/headerAndText.dart';
import 'package:sber_app_filyakin/utils/Strings.dart';
class ProfileTabScreen extends StatelessWidget {
  const ProfileTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chipsText = ["Еда", "Саморазвитие","Технологии","Дом","Досуг","Забота о себе","Наука"];
    return SafeArea(
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
              slivers: <Widget>[
                SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                      ),
                      SliverFillRemaining(
                        hasScrollBody: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeaderAndText(label: Strings.of(context).services,text: Strings.of(context).servicesText,),
                          HeaderAndText(label: Strings.of(context).tariffs, text: Strings.of(context).operations),
                          HeaderAndText(label: Strings.of(context).interests, text: Strings.of(context).interestsDescription),
                          ChipsWidget(chipList: chipsText, neutralColor:Colors.black.withOpacity(0.07999999821186066), selectedColor: Colors.green),
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