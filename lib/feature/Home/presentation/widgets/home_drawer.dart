import 'package:flutter/material.dart';
import 'package:screentasia/screentasia.dart';

import '../../../widgets/custome_samll_text.dart' show CustomeText;
import '../../data/mapper/menu_item.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme =  Theme.of(context);

    final List<MenuItem> homeMenuItems = [
      MenuItem(icon: Icons.person_2_outlined, label:" البيانات الشخصية", onTap:(){} ),
      MenuItem(icon: Icons.account_balance, label: "فتح حساب مصرفي", onTap: (){} ),
      MenuItem(icon: Icons.credit_card, label: "أرشيف الكروت", onTap: (){} ),
      MenuItem(icon: Icons.person_add_alt_1_outlined, label: "الأصدقاء", onTap: (){} ),
      MenuItem(icon: Icons.settings_outlined , label: "الاعدادات", onTap: (){} ),
      MenuItem(icon: Icons.question_mark_outlined, label: "الأسئلة الشائعة", onTap: (){} ),
      MenuItem(icon: Icons.support_agent, label: "لدعم الفني", onTap: (){} ),
      MenuItem(icon: Icons.info_outline, label: "الفروع", onTap: (){} ),
      MenuItem(icon: Icons.logout, label: "تسجيل الخروج", onTap: (){} )
    ];
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Column(
        children:[
          Container(
            
            // padding: EdgeInsets.only(left: 3.wp, top: 10.wp),     
            margin: EdgeInsets.only(left: 1.wp, top: 10.wp),
            child: Row(
              children: [
                Icon(Icons.account_circle_rounded,color: theme.colorScheme.tertiary,size: 6.wp,), 
                SizedBox(width: 2.wp,),               
                CustomeText(text: 'مرحبا',color: theme.colorScheme.tertiary, size: 7.sp)
              ],
            ),
          ), 
          Divider(
                    color: theme.colorScheme.tertiary,
                    thickness: 0.04.hp),
          Expanded(
            child: ListView.builder(
            padding: EdgeInsets.all(0),
            itemCount: homeMenuItems.length,
            itemBuilder: (context, index){
              final item = homeMenuItems[index];
              bool isLastItem = index == homeMenuItems.length - 1;
              return Column(
                children: [              
                  ListTile(
                    leading: Icon(
                      item.icon,
                      color: isLastItem? theme.colorScheme.error :theme.colorScheme.tertiary
                    ),
                    title: CustomeText(
                      text: item.label,   
                      size: 4.sp          
                    ),
                    visualDensity: VisualDensity(vertical:-4),
                    onTap: item.onTap,),
                   if (index == 4 || index == 7)
                   Divider(
                    color: theme.colorScheme.tertiary,
                    thickness: 0.04.hp),
                   
                ],
              );
            }),
          ),]
      )
    );
  }
}