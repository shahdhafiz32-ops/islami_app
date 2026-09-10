import 'package:flutter/material.dart';
import 'package:islami_application/tabs/hadeeth/hadeeth_tab.dart';
import 'package:islami_application/tabs/onboarding/onboarding_screen.dart';
import 'package:islami_application/tabs/quran/quran_tab.dart';
import 'package:islami_application/tabs/radio/radio_tab.dart';
import 'package:islami_application/tabs/Sebha/sebha_tab.dart';
import 'package:islami_application/tabs/time_tab.dart';
import 'package:islami_application/widgets/active_navbar_icon.dart';
import 'package:islami_application/widgets/inactive_navbar_icon.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadeethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
    ];
  List<String> backgroundImageNames = [
    "quran_background",
    "hadeeth_background",
    "sebha_background",
    "radio_background",
    "time_background",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/${backgroundImageNames[currentIndex]}.png"),
              fit: BoxFit.fill,
            ),
          ),
          child:
              SafeArea(
                  child: Column(
                    children: [
                      Image.asset("assets/images/islami_header.png",
                        height: MediaQuery.sizeOf(context).height*0.15,
                      fit: BoxFit.fill),
                      Expanded(child: tabs[currentIndex])]
                    )
              )

      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          currentIndex = index;
          setState(() {});
        },
        items: [
        BottomNavigationBarItem(icon: InactiveNavbarIcon(iconName: "quran"),activeIcon: ActiveNavbarIcon(iconName: "quran") ,label: 'Quran'),
        BottomNavigationBarItem(icon: InactiveNavbarIcon(iconName: "hadeeth"),activeIcon: ActiveNavbarIcon(iconName: "hadeeth") ,label: 'Hadeeth'),
        BottomNavigationBarItem(icon: InactiveNavbarIcon(iconName: "sebha"),activeIcon: ActiveNavbarIcon(iconName: "sebha") ,label: 'Sebha'),
        BottomNavigationBarItem(icon: InactiveNavbarIcon(iconName: "radio"),activeIcon: ActiveNavbarIcon(iconName: "radio") ,label: 'Radio'),
        BottomNavigationBarItem(icon: InactiveNavbarIcon(iconName: "time"),activeIcon: ActiveNavbarIcon(iconName: "time") ,label: 'Time'),
      ],),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
