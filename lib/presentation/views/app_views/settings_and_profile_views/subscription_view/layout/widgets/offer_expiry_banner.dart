import 'package:flutter/material.dart';

import '../../../../../../../configurations/front_end.dart';
import '../../../../../../elements/custom_text.dart';

class OfferExpiryBanner extends StatelessWidget {
  const OfferExpiryBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.only(left: 15, bottom: 20, top: 20),
      decoration: BoxDecoration(
          image: const DecorationImage(
              alignment: Alignment.centerRight,
              image: AssetImage('assets/images/subscription_banner.png')),
          color: FrontEndConfigs.kWhiteColor,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: '60% off your upgrade',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            textColor: FrontEndConfigs.kPrimaryColor,
          ),
          const SizedBox(
            height: 5,
          ),
          CustomText(
            text: 'Expires in',
            fontSize: 12,
            fontWeight: FontWeight.w500,
            textColor: FrontEndConfigs.kSecondaryColor.withOpacity(0.5),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              _buildTimeCard(time: '23'),
              const SizedBox(
                width: 5,
              ),
              const CustomText(
                text: ':',
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(
                width: 5,
              ),
              _buildTimeCard(time: '56'),
              const SizedBox(
                width: 5,
              ),
              const CustomText(
                text: ':',
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(
                width: 5,
              ),
              _buildTimeCard(time: '48'),
            ],
          )
        ],
      ),
    );
  }

  Container _buildTimeCard({required String time}) {
    return Container(
      height: 41,
      width: 41,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: FrontEndConfigs.kSecondaryColor.withOpacity(0.1)),
      child: CustomText(
        text: time,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
