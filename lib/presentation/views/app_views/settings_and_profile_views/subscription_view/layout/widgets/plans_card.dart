import 'package:flutter/material.dart';

import '../../../../../../../configurations/front_end.dart';
import '../../../../../../elements/custom_text.dart';

class PlansCard extends StatelessWidget {
  const PlansCard({
    Key? key,
    required this.price,
    required this.duration,
    required this.isPopular,
  }) : super(key: key);
  final String price;
  final String duration;
  final bool isPopular;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: FrontEndConfigs.kWhiteColor),
        child: Column(
          children: [
            isPopular
                ? Container(
                    height: 33,
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: FrontEndConfigs.kPrimaryColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12)),
                    ),
                    child: const CustomText(
                        text: 'Most Popular',
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 30,
            ),
            CustomText(
                text: price,
                fontSize: 24,
                textColor: FrontEndConfigs.kPrimaryColor,
                fontWeight: FontWeight.w700),
            const SizedBox(
              height: 5,
            ),
            CustomText(
                text: '6-month plan for 39.99 usd',
                fontSize: 10,
                maxLines: 2,
                align: TextAlign.center,
                textColor: FrontEndConfigs.kSecondaryColor.withOpacity(0.5),
                fontWeight: FontWeight.w500),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              height: 0,
              thickness: 1,
              color: FrontEndConfigs.kScaffoldBGColor,
            ),
            const SizedBox(
              height: 5,
            ),
            CustomText(
                text: duration, fontSize: 12, fontWeight: FontWeight.w700),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
