import 'package:authorization/common/extensions/build_context.dart';
import 'package:authorization/data/user/profile/profile.dart';
import 'package:authorization/presentation/home/home_page/widgets/wip_widget.dart';
import 'package:authorization/presentation/home/profile/profile_page.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  final Profile profile;

  const HomePage({
    required this.profile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          iconSize: 25,
          currentIndex: 3,
          activeColor: context.theme.primaryColor,
          inactiveColor: CupertinoColors.black,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                CupertinoIcons.home,
                color: CupertinoColors.black,
              ),
              activeIcon: Icon(
                CupertinoIcons.home,
                color: context.theme.primaryColor,
              ),
              label: context.s.feedLabel,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                CupertinoIcons.map,
                color: CupertinoColors.black,
              ),
              activeIcon: Icon(
                CupertinoIcons.map,
                color: context.theme.primaryColor,
              ),
              label: context.s.mapLabel,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                CupertinoIcons.heart,
                color: CupertinoColors.black,
              ),
              activeIcon: Icon(
                CupertinoIcons.heart,
                color: context.theme.primaryColor,
              ),
              label: context.s.favoritesLabel,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                CupertinoIcons.person_alt_circle_fill,
                color: CupertinoColors.black,
              ),
              activeIcon: Icon(
                CupertinoIcons.person_alt_circle_fill,
                color: context.theme.primaryColor,
              ),
              label: context.s.profileTitle,
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (context) => IndexedStack(
              index: index,
              children: [
                const WIPWidget(),
                const WIPWidget(),
                const WIPWidget(),
                ProfilePage(profile: profile),
              ],
            ),
          );
        },
      ),
    );
  }
}
