import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../configurations/front_end.dart';
import '../../../../../../elements/custom_icon_button.dart';
import '../../../../../../elements/custom_text.dart';

class CommunityPostsCard extends StatelessWidget {
  const CommunityPostsCard({
    Key? key,
    required this.imagePath,
    required this.userName,
    required this.postText,
  }) : super(key: key);
  final String imagePath;
  final String userName;
  final String postText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: FrontEndConfigs.kWhiteColor),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: FrontEndConfigs.kWhiteColor,
              backgroundImage: AssetImage(imagePath),
            ),
            title: CustomText(
                text: userName, fontSize: 14, fontWeight: FontWeight.w700),
            subtitle: CustomText(
              text: '41m ago',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              textColor: FrontEndConfigs.kSecondaryColor.withOpacity(0.5),
            ),
            trailing:
                CustomIconButton(onPressed: () {}, icon: Icons.share, size: 36),
          ),
          const Divider(
            color: FrontEndConfigs.kScaffoldBGColor,
            height: 0,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: CustomText(
                text: postText,
                fontSize: 14,
                maxLines: 3,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(
                CupertinoIcons.heart_fill,
                color: FrontEndConfigs.kPrimaryColor,
                size: 18,
              ),
              const SizedBox(
                width: 5,
              ),
              const CustomText(
                  text: '3.1k', fontSize: 8, fontWeight: FontWeight.w500),
              const SizedBox(
                width: 16,
              ),
              const Icon(
                CupertinoIcons.chat_bubble_fill,
                color: Color(0xffEBDCCF),
                size: 18,
              ),
              const SizedBox(
                width: 5,
              ),
              CustomText(
                text: '22',
                fontSize: 8,
                fontWeight: FontWeight.w500,
                textColor: FrontEndConfigs.kSecondaryColor.withOpacity(0.5),
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
