import 'package:aora/components/services/auth_services.dart';
import 'package:aora/components/services/user.services.dart';
import 'package:aora/components/widgets/gradient_button.dart';
import 'package:aora/components/widgets/video.dart';
import 'package:aora/utils/theme.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _authService = AuthService();

  final userServices = UserService();
  String username = '';

  final videos = [
    {
      'videoUrl': 'assets/images/video.png',
      'title':
          'Businessman Work with Laptop Computer in Office Manager Solving Problem',
      'author': 'Zuki',
      'authorImageUrl': 'assets/images/avatar.png',
    },
    {
      'videoUrl': 'assets/images/video2.png',
      'title': 'Bull trading with computer Bullish in Stock market and',
      'author': 'Zuki',
      'authorImageUrl': 'assets/images/avatar.png',
    },
  ];

  void fetchUser() async {
    final user = await userServices.getCurrentUser();
    if (user != null) {
      setState(() {
        username = user['username'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 58.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 24),
                  child: GestureDetector(
                    onTap: () async {
                      await _authService.signOut();
                    },
                    child: Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    width: 56.0,
                    height: 56.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: AppColors.primary,
                        width: 2.0,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/avatar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    username,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            '10',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Posts',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          Text(
                            '1.2k',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Views',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            if (videos.isEmpty) ...[
              Image.asset('assets/images/empty.png', width: 250),
              Text(
                'No videos found',
                style: TextStyle(
                    color: AppColors.accent,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                'No videos found for this profile',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 24,
              ),
              GradientButton(
                text: 'Back to Explore',
                onPressed: () {},
              ),
            ],
            for (final video in videos)
              Video(
                author: video['author']!,
                authorImageUrl: video['authorImageUrl'],
                title: video['title']!,
                videoUrl: video['videoUrl']!,
              ),
          ],
        ));
  }
}
