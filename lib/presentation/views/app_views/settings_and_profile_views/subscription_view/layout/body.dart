import 'package:flutter/material.dart';

import '../../../../../../configurations/front_end.dart';
import '../../../../../elements/custom_button.dart';
import '../../../../../elements/custom_text.dart';
import 'widgets/features_card.dart';
import 'widgets/offer_expiry_banner.dart';
import 'widgets/plans_card.dart';

class SubscriptionViewBody extends StatelessWidget {
  const SubscriptionViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const OfferExpiryBanner(),
            const SizedBox(
              height: 10,
            ),
            const UnlockFeatures(),
            const SizedBox(
              height: 25,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                PlansCard(
                  price: '\$19.00',
                  duration: 'Monthly',
                  isPopular: false,
                ),
                SizedBox(
                  width: 5,
                ),
                PlansCard(
                  price: '\$29.00',
                  duration: 'Yearly',
                  isPopular: true,
                ),
                SizedBox(
                  width: 5,
                ),
                PlansCard(
                  price: '\$49.00',
                  duration: 'Lifetime',
                  isPopular: false,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
                buttonText: 'Subscribe Now',
                height: 60,
                width: double.infinity,
                onPressed: () {}),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.security_outlined,
                  color: FrontEndConfigs.kSecondaryColor,
                  size: 18,
                ),
                SizedBox(
                  width: 5,
                ),
                CustomText(
                    text: 'Secured with Goggle Play. Cancel anytime',
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const CustomText(
              text: 'Restore Purchase',
              fontSize: 12,
              fontWeight: FontWeight.w700,
              textColor: FrontEndConfigs.kPrimaryColor,
              textDecoration: TextDecoration.underline,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  text: 'Terms of Service',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  textDecoration: TextDecoration.underline,
                ),
                CustomText(
                  text: ' and ',
                  fontSize: 12,
                  textColor: FrontEndConfigs.kSecondaryColor.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                  textDecoration: TextDecoration.underline,
                ),
                const CustomText(
                  text: 'Privacy Policy',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  textDecoration: TextDecoration.underline,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
