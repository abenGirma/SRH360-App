import 'package:flutter/material.dart';
import 'package:srh360app/gen/colors.gen.dart';
import 'package:srh360app/presentation/tabs/category_tab.dart';
import 'package:srh360app/presentation/tabs/home_tab.dart';
import 'package:srh360app/presentation/tabs/menu_tab.dart';
import 'package:srh360app/presentation/tabs/profile_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int tabIndex = 0;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Expanded(
          child: TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomeTab(),
              CategoryTab(),
              ProfileTab(),
              MenuTab(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            ColorName.secondaryColor,
            ColorName.primaryColor,
            ColorName.primaryColor,
          ])),
          child: TabBar(
            controller: tabController,
            indicator: const BoxDecoration(),
            onTap: (value) {
              setState(() {
                tabIndex = value;
              });
            },
            tabs: [
              _buildTabButton(
                id: 0,
                icon: Icons.home,
              ),
              _buildTabButton(
                id: 1,
                icon: Icons.apps,
              ),
              _buildTabButton(
                id: 2,
                icon: Icons.person,
              ),
              _buildTabButton(
                id: 3,
                icon: Icons.menu,
              ),
            ],
          ),
        ));
  }

  _buildTabButton({required int id, required IconData icon}) {
    return Icon(
      icon,
      color: tabIndex == id ? Colors.white : Colors.white70,
      size: 30,
    );
  }
}
