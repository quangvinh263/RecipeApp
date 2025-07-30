import 'package:flutter/material.dart';
import 'package:recipe_app/data/notifiers.dart';
import 'package:recipe_app/views/pages/save_recipes_page.dart';
import 'package:recipe_app/views/pages/home_page.dart';
import 'package:recipe_app/views/pages/search2_page.dart';
import 'package:recipe_app/views/pages/profile_page.dart';
import 'package:recipe_app/views/widgets/navbar_widget.dart';

List<Widget> pages = [
  HomePage(),
  Search2Page(),
  Container(), // Placeholder for Add page
  SaveRecipesPage(),
  ProfilePage()
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: pages.elementAt(selectedPage),
          floatingActionButton: NavbarWidget.buildFloatingActionButton(
            selectedIndex: selectedPage,
            onItemSelected: (index) {
              selectedPageNotifier.value = index;
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: NavbarWidget(
            selectedIndex: selectedPage,
            onItemSelected: (index) {
              selectedPageNotifier.value = index;
            },
          ),
        );
      },
    );
  }
}