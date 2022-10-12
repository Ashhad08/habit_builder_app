import 'package:flutter/cupertino.dart';

import 'widgets/community_posts_card.dart';

class CommunityViewBody extends StatelessWidget {
  const CommunityViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            CommunityPostsCard(
                imagePath: 'assets/images/communityUser.png',
                userName: 'Jerome',
                postText:
                    'Man, you\'re my new guru! Viewing the lessons for a second time. Thoroughly pleased. And impressed that you draw from scientific literature in telling memorable...'),
            CommunityPostsCard(
                imagePath: 'assets/images/communityUser2.png',
                userName: 'Gretchen',
                postText:
                    'I loved the course! I\'ve been trying to break all this great stuff down into manageable chunks to help my clients develop healthy habits and achieve their personal... '),
            CommunityPostsCard(
                imagePath: 'assets/images/communityUser3.png',
                userName: 'Al',
                postText:
                    'This course contains the most complete material on habit formation that I\'ve seen. There is just enough theory to explain the principles, and not so much...'),
            CommunityPostsCard(
                imagePath: 'assets/images/communityUser4.png',
                userName: 'Colin',
                postText:
                    'James Clear\'s Habit\'s Academy course has tremendously changed my life for the better! Having been a self improvement aficionado for decades...'),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
