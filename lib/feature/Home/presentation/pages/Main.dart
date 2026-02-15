import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_application_2/feature/Home/presentation/pages/home.dart';
import 'package:flutter_application_2/feature/Home/presentation/pages/smart_pay.dart';
import 'package:flutter_application_2/feature/Home/presentation/pages/transfer.dart';
import 'package:screentasia/screentasia.dart';
import '../widgets/home_drawer.dart';

import 'package:auto_route/auto_route.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {  
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0) ;

final List<Widget> _pages = [
  HomePage(),
  TransferPage(),
  SmartPayPage()
];
 
  final _advancedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return AdvancedDrawer(
      backdropColor:theme.colorScheme.primary,
      controller: _advancedDrawerController,
      animateChildDecoration: true,
      childDecoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),  
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
          ),
        ],
      ),
      drawer: const HomeDrawer(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.background,

          leading: IconButton(
              onPressed: (){
                _advancedDrawerController.showDrawer();
              }, 
              icon: Icon(Icons.menu),
              color: Theme.of(context).colorScheme.primary,
              iconSize: 4.hp 
          ), 

          actions: [          
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.notifications_outlined),
                color: Theme.of(context).colorScheme.primary,
                iconSize: 4.hp
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.help_outline),
                color: Theme.of(context).colorScheme.primary,
                iconSize: 4.hp
              ),  
          ],
                          
          title:  Image.asset('assets/images/logo.png',
                  color: Theme.of(context).colorScheme.primary,            
                  height: 15.hp  ),
                  centerTitle: true,
        ),

        body: ValueListenableBuilder<int>(
                valueListenable: _selectedIndex,
                builder: (context, value, child) {
                  return _pages[value]; // body updates on bottom nav change
                },
              ),

        bottomNavigationBar:ValueListenableBuilder(
          valueListenable: _selectedIndex,

          builder: (context, value, child) {

            return BottomNavigationBar(
              currentIndex: value,
              selectedFontSize: 4.sp,
              unselectedFontSize: 3.sp,
              selectedItemColor: theme.colorScheme.primary,
            
              onTap: (index){
                _selectedIndex.value = index;
              } ,
              
              items: [          
                BottomNavigationBarItem(icon:Icon(Icons.home_outlined), label: "الرئيسية",),
                BottomNavigationBarItem(icon:Icon(Icons.swap_vert), label: "تحويل"),
                BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/smartPay.png'),
                size: 3.wp,), label: "سمارت باي"),
              ]
            );
          }
        ) , 
      ),
    );
  }
}