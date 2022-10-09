import 'package:flutter/material.dart';

import '../../../../configurations/front_end.dart';
import '../../../../navigation/route_names.dart';
import '../../../../testing.dart';
import '../../../elements/custom_floating_button.dart';
import '../courses_and_comunity_views/courses_view/courses_view.dart';
import '../homePage_views/home_view/home_view.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({Key? key}) : super(key: key);

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    CoursesView(),
    Testing(),
    Testing(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: CustomFloatingButton(
        iconPath: 'assets/images/add.png',
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.createNewHabitViewRoute);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/home.png",
                scale: 4,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/Courses.png',
                scale: 4,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/Community.png",
                scale: 4,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/Settings.png',
                scale: 4,
              ),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: FrontEndConfigs.kPrimaryColor,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
