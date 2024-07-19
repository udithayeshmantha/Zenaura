import 'package:flutter/material.dart';
import 'package:zenaura/themes/theme.dart';

class MainTabview extends StatefulWidget {
  const MainTabview({super.key});

  @override
  State<MainTabview> createState() => _MainTabviewState();
}

class _MainTabviewState extends State<MainTabview>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectTab = 0;

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
    controller?.addListener(
      () {
        setState(() {
          selectTab = controller?.index ?? 0;
          setState(() {});
        });
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: TabBarView(
        controller: controller,
        children: [
          Container(),
          Container(),
          Container(),
          Container(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: TabBar(
            dividerColor: Colors.transparent,
            controller: controller,
            indicatorColor: Colors.transparent,
            labelColor: Colors.transparent,
            unselectedLabelColor: Colors.transparent,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home_filled,
                  size: 30,
                  color:
                      selectTab == 0 ? lightColorScheme.primary : Colors.white,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.settings,
                  size: 30,
                  color:
                      selectTab == 1 ? lightColorScheme.primary : Colors.white,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.home,
                  size: 30,
                  color:
                      selectTab == 2 ? lightColorScheme.primary : Colors.white,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.account_circle_rounded,
                  size: 30,
                  color:
                      selectTab == 3 ? lightColorScheme.primary : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
