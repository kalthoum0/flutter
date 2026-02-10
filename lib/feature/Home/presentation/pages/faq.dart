import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/extensions/context_extension.dart';
import 'package:flutter_application_2/feature/widgets/custome_samll_text.dart';
import 'package:screentasia/screentasia.dart';

class FAQpage extends StatelessWidget {
  const FAQpage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: SizedBox(
          width: context.isMobile? 100.wp: 60.wp,
          child: Scaffold(  
            appBar: AppBar(
              leading: IconButton(
                onPressed: (){
                  Navigator.of(context).pop(
                  MaterialPageRoute(builder: (context)=> FAQpage())
                );},
                icon: Icon(Icons.arrow_back_ios),
                color: theme.colorScheme.primary,),
          
              title: CustomeText(
                text: "الأسئلة الشائعة",
                themeStyle: theme.textTheme.titleMedium,)          
            ),  
        
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding:  EdgeInsets.all(1.wp),
                child: Column(
                  children: [
                    SizedBox(height: 5.hp,),
                    Row(children: [
                      Icon(Icons.account_balance_outlined,
                      color: theme.colorScheme.primary,),
                        
                      CustomeText(
                        text: ' الحسابات والخدمات',
                        themeStyle: theme.textTheme.titleMedium,
                        color: theme.colorScheme.primary)
                    ],),
                    SizedBox(height: 0.5.hp,),
                    Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.background,
                        borderRadius: BorderRadius.circular(1.wp),
                        boxShadow: [BoxShadow(
                          color: const Color.fromARGB(255, 112, 112, 112).withOpacity(0.3), 
                          blurRadius: 4, 
                          spreadRadius: 0, 
                          offset: const Offset(2, 2),
                        )]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ExpansionTile(
                            iconColor: theme.colorScheme.primaryContainer,
                            collapsedIconColor: theme.colorScheme.primary,
                            title: CustomeText(
                              text: 'مواعيد العمل'),
                            children: [
                              ListTile(title: Text('Light')),                      
                            ],
                           ),
                           ExpansionTile(
                            iconColor: theme.colorScheme.primaryContainer,
                            collapsedIconColor: theme.colorScheme.primary,
                            title: CustomeText(
                              text: 'كيفية إصدار البطاقات'),
                            children: [
                              ListTile(title: Text('Light')),                      
                                            ],
                                          ),
                          ],
                        ),
                      ),
                    ),                  

                  SizedBox(height: 1.wp,),
                  // Divider(
                  //   thickness: 0.1.wp,
                  //   color: theme.colorScheme.outline,),

                  Padding(
                    padding: EdgeInsets.only(top: 0.5.wp,),
                    child: Row(children: [
                        Icon(Icons.credit_card,
                        color: theme.colorScheme.primary,
                        size: 1.5.wp,),
                          
                        CustomeText(
                          text: '  البطاقات والسحب',
                          themeStyle: theme.textTheme.titleMedium,
                          color: theme.colorScheme.primary)
                      ],),
                  ),

                   SizedBox(height: 0.5.hp,),
                    Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.background,
                        borderRadius: BorderRadius.circular(1.wp),
                        boxShadow: [BoxShadow(
                          color: const Color.fromARGB(255, 112, 112, 112).withOpacity(0.3), 
                          blurRadius: 4, 
                          spreadRadius: 0, 
                          offset: const Offset(2, 2),
                        )]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ExpansionTile(
                            iconColor: theme.colorScheme.primaryContainer,
                            collapsedIconColor: theme.colorScheme.primary,
                            title: CustomeText(
                              text: 'مواعيد العمل'),
                            children: [
                              ListTile(title: Text('Light')),                      
                            ],
                           ),
                           ExpansionTile(
                            iconColor: theme.colorScheme.primaryContainer,
                            collapsedIconColor: theme.colorScheme.primary,
                            title: CustomeText(
                              text: 'كيفية إصدار البطاقات'),
                            children: [
                              ListTile(title: Text('Light')),],
                            ),
                          ],
                        ),
                      ),
                    ),            
                  SizedBox(height: 1.wp,),
                  
                    Padding(
                      padding:  EdgeInsets.only(top: 0.5.wp),
                      child: Row(children: [
                       ImageIcon(AssetImage('assets/images/smartPay.png'),
                       color: theme.colorScheme.primary,
                       size: 3.wp,),
                          
                      CustomeText(
                          text: 'الخدمات الرقمية والتطبيق',
                          themeStyle: theme.textTheme.titleMedium,
                          color: theme.colorScheme.primary,)
                      ],),
                    ),

                    SizedBox(height: 0.5.hp,),
                    Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.background,
                        borderRadius: BorderRadius.circular(1.wp),
                        boxShadow: [BoxShadow(
                          color: const Color.fromARGB(255, 112, 112, 112).withOpacity(0.3), 
                          blurRadius: 4, 
                          spreadRadius: 0, 
                          offset: const Offset(2, 2),
                        )]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ExpansionTile(
                            iconColor: theme.colorScheme.primaryContainer,
                            collapsedIconColor: theme.colorScheme.primary,
                            title: CustomeText(
                              text: 'مواعيد العمل'),
                            children: [
                              ListTile(title: Text('Light')),                      
                            ],
                           ),
                           ExpansionTile(
                            iconColor: theme.colorScheme.primaryContainer,
                            collapsedIconColor: theme.colorScheme.primary,
                            title: CustomeText(
                              text: 'كيفية إصدار البطاقات'),
                            children: [
                              ListTile(title: Text('Light')),                      
                                            ],
                                          ),
                          ],
                        ),
                      ),
                    ),            
                  ],
                ),
              ),
            )  
          ),
        ),
      ),
    );
  }
}