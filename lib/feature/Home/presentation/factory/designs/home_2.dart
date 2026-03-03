import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/core/extensions/context_extension.dart';
import 'package:flutter_application_2/feature/Home/presentation/widgets/custom_home_container.dart';
import 'package:flutter_application_2/feature/Home/presentation/widgets/home_devider.dart';
import 'package:flutter_application_2/feature/Home/presentation/widgets/transactions_container.dart';
import 'package:flutter_application_2/feature/widgets/custome_samll_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screentasia/screentasia.dart';

import '../../widgets/container2.dart' show Container2;
import '../../widgets/general_container.dart';


@RoutePage()
class SmartApp2 extends StatefulWidget {
  const SmartApp2({super.key});

  @override
  State<SmartApp2> createState() => _SmartApp2State();
}

class _SmartApp2State extends State<SmartApp2> {
  final ValueNotifier<bool> showText  = ValueNotifier(true);
    final ValueNotifier<Color> popUpTextColor = ValueNotifier(Colors.black);
    final ValueNotifier<Color> popUpText2Color = ValueNotifier(Colors.black);    
    String obscureText(String text, int showLast ) {
      if (text.length <= showLast) return "●" * text.length;
      return "●" * (text.length - showLast) + text.substring(text.length - showLast);}
  @override  
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return  Scaffold(
      appBar:  AppBar(
          backgroundColor: theme.colorScheme.background,
          
          leading: IconButton(
              onPressed: (){                
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
      body: 
      Center(
        child: SizedBox(
          width: context.isMobile? 100.wp:75.wp,
          child: SingleChildScrollView(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(                
                  options: CarouselOptions(height: 15.hp,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(milliseconds: 700)),
                  items: [
                    'assets/images/img_slider1.jpg',
                    'assets/images/img_slider2.jpg',
                    'assets/images/img_slider1.jpg'].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(                     
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                          i,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          ),
                        ),
                      );},
                    ); }).toList(),
                    ),
            
                ValueListenableBuilder(
                  valueListenable: showText,
                  builder: (context, value, child) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 23.hp,
                        decoration: BoxDecoration(
                          // gradient: LinearGradient(
                          //   begin: Alignment.topLeft,
                          //   end: Alignment.bottomRight,
                          //   colors: [
                          //     theme.colorScheme.tertiary,
                          //     theme.colorScheme.tertiary.withOpacity(0.4),
                          //   ],
                          // ),
                          boxShadow:[ BoxShadow(
                            color: const Color.fromARGB(255, 112, 112, 112).withOpacity(0.3),
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: Offset(2, 2),
                            )],
                          borderRadius: BorderRadius.circular(1.wp),
                          color: Color(0xFFEDEFF5),
                        ),
                        child: 
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment : CrossAxisAlignment.start, 
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [                             
                                    CountryFlag.fromCountryCode(
                                      'Ly',
                                      theme: const ImageTheme(
                                      shape: Circle(),
                                    )),
                                    CustomeText(
                                        themeStyle: theme.textTheme.titleMedium,
                                        size: 14,
                                        text: 'Kalthoum Abd-Almajeed Alatrash',
                                        textOverflow: TextOverflow.ellipsis,
                                         
                                        ),                                                          
                                    ],                              
                                  ),
                                  SizedBox(height: 2.hp,),                            
                                  CustomeText(
                                    themeStyle: theme.textTheme.titleMedium,
                                    letterSpacing: 2,
                                    size: 16,
                                    text:value? obscureText('0000000000',0): '0000000000' ,
                                    ),
                                  SizedBox(height: 1.hp,),
                                  CustomeText(
                                    text:value? obscureText('0000000',0): '0000000' ,
                                    color: Color(0xFF1E3A8A),
                                    size: 14,),                                  
                                  CustomeText(
                                    text:value? obscureText('0000د.ل', 3): '0000د.ل' ,
                                    color: Color(0xFF1E3A8A),
                                    size: 14,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Spacer(),
                                    IconButton(
                                        onPressed:(){
                                          showText.value = !showText.value;
                                        },
                                        icon:Icon( value? Icons.visibility_off:Icons.visibility), color: Color(0xFF1E3A8A), ),
                                    IconButton(                                  
                                              icon: Icon(Icons.qr_code),
                                              color: Color(0xFF1E3A8A),
                                              onPressed: (){
                                                showDialog(context: context, builder: (BuildContext context){
                                                  return Dialog(
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Container(
                                                        width: 20.wp,
                                                        height: 70.hp,
                                                        decoration: BoxDecoration(
                                                          color: theme.colorScheme.background,
                                                          borderRadius: BorderRadius.circular(2.wp)
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            ValueListenableBuilder(
                                                              valueListenable: popUpTextColor,
                                                              builder: (context, value, child) {
                                                                return Row(
                                                                  mainAxisSize: MainAxisSize.min,
                                                                  children: [
                                                                    Icon(
                                                                      Icons.copy,
                                                                      color: value,
                                                                    ),
                                                                    InkWell(                                                            
                                                                      onTapDown: (_){
                                                                        Clipboard.setData(
                                                                          ClipboardData(text: '12345678'));
                                                                        popUpTextColor.value = theme.colorScheme.primary;
                                                                      },
                                                                      onTapUp:(_)async{                                                               
                                                                        await Future.delayed(Duration(milliseconds: 200)); // 👈 delay
                                                                          if (mounted) {
                                                                            popUpTextColor.value = Colors.black;
                                                                        }
                                                                      },                                                              
                                                                      child: CustomeText(
                                                                        text: '12345678',
                                                                        color: value,
                                                                        )
                                                                    ),
                                                                  ],
                                                                );
                                                              }
                                                            ),
                                                            QrImageView(
                                                              data: '1234567890',
                                                              version: QrVersions.auto,
                                                              size: 12.wp,
                                                            ),                                                      
                                                            Divider(                                                           
                                                              color: theme.colorScheme.tertiary,
                                                              thickness: 0.04.hp
                                                            ),
                                                                                                      
                                                            ValueListenableBuilder(
                                                              valueListenable: popUpText2Color,
                                                              builder: (context, value, child) {
                                                                return Row(
                                                                  mainAxisSize: MainAxisSize.min,
                                                                  children: [
                                                                    Icon(
                                                                      Icons.copy,
                                                                      color: value,
                                                                    ),
                                                                    InkWell(                                                            
                                                                      onTapDown: (_){
                                                                        Clipboard.setData(
                                                                          ClipboardData(text: '12345678'));
                                                                        popUpText2Color.value = theme.colorScheme.primary;
                                                                      },
                                                                      onTapUp:(_)async{                                                               
                                                                        await Future.delayed(Duration(milliseconds: 200)); // 👈 delay
                                                                          if (mounted) {
                                                                            popUpText2Color.value = Colors.black;
                                                                        }
                                                                      },
                                                                      child: CustomeText(
                                                                        text: '87654321',
                                                                        color: value,
                                                                        )
                                                                    ),
                                                                  ],
                                                                );
                                                              }
                                                            ),
                                                            QrImageView(
                                                              data: '1234567890',
                                                              version: QrVersions.auto,
                                                              size: 12.wp,
                                                            ),                                                       
                                                          ],
                                                        )
                                                      ),
                                                    ),
                                                  );
                                                });
                                              },),
                                  ],
                                )
                              
                                ]
                                                  ),
                            )
                        
                      ),
                    );
                  }
                ),
                SizedBox(height: 3.hp,),
                Center(
                  child: Padding(
                    padding:  EdgeInsets.all(0.2.wp),
                    child: HomeDevider(
                      icon: Icon(
                        Icons.star, 
                        color: Color(0xFF1E3A8A),), 
                      text: 'SMART Services',              
                      useContainer: true,
                      containerColor: Color(0xFFEDEFF5) ,
                      containerText: 'Premium',
                      borderColor: Color(0xFF1E3A8A),                
                      ),
                   ),
                ),
              SizedBox(height: 1.hp,),          

              Center(
                child: Row(
                   mainAxisSize: MainAxisSize.min,
                  children: [
                  Container2(
                    icon: Icon(Icons.chat
                    ,color: Color(0xFF1E3A8A),
                    ),
                    text: 'ميد واتس',
                  ),
                  Container2(
                    icon: Icon(Icons.atm
                    ,color: Color(0xFF1E3A8A),),
                    text: 'SmartCard',
                  ),
                  Container2(
                    icon: Icon(Icons.chat
                    ,color: Color(0xFF1E3A8A),),
                    text: 'SmartSMS',
                  ),
                  Container2(
                    icon: Icon(Icons.analytics
                    ,color: Color(0xFF1E3A8A),),
                    text: 'Smart تحليلات'
                  ),
                ],),
              ),
              SizedBox(height: 1.wp,),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  Container2(
                    icon: Icon(Icons.chat
                    ,color: Color(0xFF1E3A8A),
                    ),
                    text: 'ميد واتس',
                  ),
                  Container2(
                    icon: Icon(Icons.chat
                    ,color: Color(0xFF1E3A8A),),
                    text: 'ميد واتس',
                  ),
                  Container2(
                    icon: Icon(Icons.description_sharp
                    ,color: Color(0xFF1E3A8A),),
                    text:'تقارير سمارت',
                  ),
                  Container2(
                    icon: Icon(Icons.chat
                    ,color: Color(0xFF1E3A8A),),
                    text: 'سمارت باي'
                  ),
                ],),
              ),
             

              
              // Padding(
              //   padding:  EdgeInsets.all(0.5.wp),
              //   child: Container(
              //     height: 65.hp,
              //     child: Column(
              //       children: [
              //         SizedBox(
              //           width: double.infinity,
              //           child: CustomHomeContainer(
              //             icon: SvgPicture.asset('assets/svg/medwatsIcon.svg',width: 8.wp, height:7.hp ),
              //             label: 'ميد واتس'),
              //         ),
                  
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //            Expanded(
              //              child: CustomHomeContainer(
              //               icon: SvgPicture.asset('assets/svg/creditCard2.svg',width: 8.wp, height:7.hp ),
              //               label:'SmartCard'),
              //            ),
              //            Expanded(
              //              child: CustomHomeContainer(
              //               icon: SvgPicture.asset('assets/svg/smartSmsLogo.svg',width: 8.wp, height:7.hp ),
              //               label:'SmartSMS'),
              //            ),
              //           ]),
                     
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //            Expanded(
              //              child: CustomHomeContainer(
              //               icon: SvgPicture.asset('assets/svg/creditCard2.svg',width: 8.wp, height:7.hp ),
              //               label:'SmartCard'),
              //            ),
              //            Expanded(
              //              child: CustomHomeContainer(
              //               icon: SvgPicture.asset('assets/svg/smartSmsLogo.svg',width: 8.wp, height:7.hp ),
              //               label:'SmartSMS'),
              //            ),
              //           ]),
                     
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //            Expanded(
              //              child: CustomHomeContainer(
              //               icon: SvgPicture.asset('assets/svg/creditCard2.svg',width: 8.wp, height:7.hp ),
              //               label:'SmartCard'),
              //            ),
              //            Expanded(
              //              child: CustomHomeContainer(
              //               icon: SvgPicture.asset('assets/svg/smartSmsLogo.svg',width: 8.wp, height:7.hp ),
              //               label:'SmartSMS'),
              //            ),
              //           ]),
                     
              //         SizedBox(
              //           width: double.infinity,
              //           child: CustomHomeContainer(
              //             icon: SvgPicture.asset('assets/svg/smartPayCircle2.svg',width: 8.wp, height:7.hp ),
              //             label: 'سمارت باي'),
              //         ),   
                      
              //       ],
              //     ),
              //   ),
              // ),
              //  Center(
              //     child: Padding(
              //       padding:  EdgeInsets.all(0.5.wp),
              //       child: Container(
              //         padding: EdgeInsets.only(top: 2.5.hp),
              //         // width: 80.wp,
              //         height: 26.hp,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(1.wp),
              //           color: theme.colorScheme.tertiaryContainer,
              //           boxShadow:[ BoxShadow(
              //             color: theme.colorScheme.shadow, 
              //             spreadRadius: 2, // how much the shadow spreads
              //             blurRadius: 8,   // blur effect
              //             offset: Offset(0, 4)
              //           )]
              //         ),
              //         child: Row(  
              //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //               children: [
              //                Column(
              //                  children: [
              //                    InkWell(
              //                     onTap: (){},
              //                      child: Container(
              //                       //height: 8.hp,                                    
              //                       decoration: BoxDecoration(
              //                          //color: theme.colorScheme.tertiaryContainer,
              //                          borderRadius: BorderRadius.circular(1.wp)
              //                       ),                                   
              //                        child: Padding(
              //                          padding:  EdgeInsets.symmetric(horizontal: 1.wp),
              //                          child: Column(
              //                           children: [
              //                           SizedBox(height: 0.3.hp,),
              //                           SvgPicture.asset('assets/svg/medwatsIcon.svg',width: 8.wp, height:7.hp ),
              //                           CustomeText(text: 'ميد واتس',
              //                           ),]),
              //                        ),
              //                      ),
              //                    ),
              //                     SizedBox(height: 2.hp,),
              //                   Column(children:[ 
              //                     SvgPicture.asset('assets/svg/smartPayCircle2.svg',width: 8.wp, height:7.hp ),
              //                     CustomeText(text: 'سمارت باي',
              //                     ),])
              //                   ]
              //                 ),
              //                 SizedBox(width: 1.wp,),
              //                 Column(
              //                   children: [
              //                     Column(
              //                     children:[ 
              //                       SvgPicture.asset('assets/svg/ATM.svg',
              //                         width: 8.wp, height:7.hp ),                            
              //                       CustomeText(text: 'SmartAtm',
              //                       ),
              //                     ]),
              //                     SizedBox(height: 2.hp,),
              //                     Column(
              //                      children:[ 
              //                       SvgPicture.asset('assets/svg/SmartStore.svg',width: 8.wp, height:7.hp),                           
              //                       CustomeText(text: 'SmartStore',
              //                       ),
              //                     ])  
              //                   ],
              //                 ),          
              //                  SizedBox(width: 1.wp,),                                                                                   
              //                 Column(
              //                   children: [
              //                     Column(
              //                     children:[ 
              //                      SvgPicture.asset('assets/svg/creditCard2.svg',width: 8.wp, height:7.hp),                           
              //                       CustomeText(text: 'SmartCard',
              //                       ),
              //                     ]),
              //                     SizedBox(height: 2.hp,),
              //                     Column(
              //                      children:[ 
              //                      SvgPicture.asset('assets/svg/smartSmsLogo.svg',width: 8.wp, height:7.hp ),                          
              //                       CustomeText(text: 'SmartSMS',
              //                       ),
              //                     ])  
              //                   ],
              //                 ),     
              //                  SizedBox(width: 1.wp,),                                                                                        
              //                 Column(
              //                   children: [
              //                     Column(
              //                     children:[ 
              //                      SvgPicture.asset('assets/svg/financeBook.svg',width: 8.wp, height:7.hp ),                         
              //                       CustomeText(text: 'SmartCard',
              //                       ),
              //                     ]),
              //                     SizedBox(height: 2.hp,),
              //                     Column(
              //                      children:[ 
              //                      SvgPicture.asset('assets/svg/smartanalytics.svg',width: 8.wp, height:7.hp ),                        
              //                       CustomeText(text: 'Smart تحليلات',
              //                       ),
              //                     ])  
              //                   ],
              //                 ),                                                                                             

              //               ],
              //             ),                                                                                                                                            
              //       ),
              //     ),
              //   ),
              SizedBox(height:2.hp,),
               Padding(
                 padding:  EdgeInsets.all(0.2.wp),
                 child: HomeDevider(
                   icon: Icon(
                     Icons.rocket_launch_outlined, 
                     color: Color(0xFF1E3A8A)), 
                   text: 'Smart Plus',              
                   useContainer: true,
                   containerColor:Color.fromARGB(255, 219, 234, 254),
                   containerText: 'New',
                   borderColor: Color(0xFF2563EB),
                   containerIcon: Icon(
                     Icons.auto_awesome_outlined,
                     color: Color(0xFF2563EB),
                     size: 1.wp),
                   ),
                ),
          
              Center(
                  child: Padding(
                    padding:  EdgeInsets.all(0.5.wp),
                    child: Container(
                      padding: EdgeInsets.only(top: 1.hp),
                      // width: 80.wp,
                      height: 15.hp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.5.wp),
                        //color: theme.colorScheme.tertiaryContainer,
                        // boxShadow:[ BoxShadow(
                        //   color: theme.colorScheme.shadow, 
                        //   spreadRadius: 2, // how much the shadow spreads
                        //   blurRadius: 8,   // blur effect
                        //   offset: Offset(0, 4)
                        // )]
                      ),
                      child: Column(
                        children: [
                          Row(  
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             Expanded(
                               child: CustomHomeContainer(                                
                                blueLine: false,
                                // height: 12.hp,                                
                                icon: SvgPicture.asset('assets/svg/onePay.svg', width: 9.wp, height: 9.hp,),
                                label:''),
                             ),
                             Expanded(
                               child: CustomHomeContainer(
                                blueLine: false,
                                icon: SvgPicture.asset('assets/svg/onePay.svg', width: 9.wp, height: 9.hp,),
                                label:''),
                             ),
                            ]
                          )
                        ]
                      ),
                  )
                )
              ) ,
              SizedBox(height: 1.5.hp,),
              Padding(
                padding:  EdgeInsets.all(0.2.wp),
                child: HomeDevider(
                  icon: Icon(                    
                    Icons.account_balance_outlined, 
                    color: Color(0xFF1E3A8A)), 
                  text: 'General Services',                              
                ),
              ),
              SizedBox(height: 0.5.hp,),
               Row(children: [
                Expanded(child: GeneralContainer(
                  icon: Icon(Icons.description,
                  color:Color(0xFF1E3A8A) ,)
                )),
                Expanded(child: GeneralContainer(
                  icon:Icon( Icons.compare_arrows_outlined,
                  color: Color(0xFF1E3A8A),)
                )),
              ],),
             // SizedBox(height: 0.5.hp,),
              // Center(
              //     child: Padding(
              //       padding:  EdgeInsets.all(0.5.wp),
              //       child: Container(
              //         padding: EdgeInsets.only(top: 1.hp),
              //         // width: 80.wp,
              //         height: 15.hp,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(1.5.wp),
              //         //  color: theme.colorScheme.surfaceContainerLow,
              //         //   boxShadow:[ BoxShadow(
              //         //     color: theme.colorScheme.shadow, 
              //         //     spreadRadius: 2, // how much the shadow spreads
              //         //     blurRadius: 8,   // blur effect
              //         //     offset: Offset(0, 4)
              //         //   )]
              //         ),
              //         child: Column(
              //           children: [
              //             Row(  
              //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //               children: [
              //                Expanded(
              //                  child: CustomHomeContainer(
              //                   height: 12.hp,
              //                   blueLine: false,
              //                   color: theme.colorScheme.background,
              //                   icon: Padding(
              //                     padding: EdgeInsets.only(top: 1.hp),
              //                     child: SvgPicture.asset('assets/svg/financeBook.svg',width: 8.wp, height:7.hp  ),
              //                   ),
              //                   label:'Finance book'),
              //                ),
              //                Expanded(
              //                  child: CustomHomeContainer(
              //                   height: 12.hp,
              //                   blueLine: false,
              //                   color: theme.colorScheme.background,
              //                   icon: Padding(
              //                     padding: EdgeInsets.only(top: 1.hp),
              //                     child: SvgPicture.asset('assets/svg/transfer.svg',width: 8.wp, height:7.hp ),
              //                   ),
              //                   label:'transactions'),
              //                ),

              //                 // Column(
              //                 //   children:[ 
              //                 //     SvgPicture.asset('assets/svg/transfer.svg',width: 7.wp, height:6.hp ),                               
              //                 //     CustomeText(text: 'transactions',
              //                 //      size: 14),
              //                 //   ]
              //                 // ),
                            
              //                 // Column(
              //                 //   children:[ 
              //                 //     SvgPicture.asset('assets/svg/financeBook.svg',width: 7.wp, height:6.hp  ),                               
              //                 //     CustomeText(text: 'Finance book',
              //                 //      size: 14),
              //                 //   ]
              //                 // ),
              //               ]
              //             )
              //           ]
              //         ),
              //     )
              //   )
              // ) ,
              Padding(
                padding:  EdgeInsets.all(1.wp),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomeText(
                        text: 'التحويلات',                    
                        themeStyle: theme.textTheme.titleMedium,),
                  
                      InkWell(
                        onTap:(){},
                        child: CustomeText(
                          text: 'عرض الكل',
                          textDecoration: TextDecoration.underline,
                          color:  Color(0xFF1E3A8A),
                          themeStyle: theme.textTheme.titleMedium,),
                      )
                    ],
                  ),
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding:  EdgeInsets.all(0.5.wp),
                  child: Column(
                    children: [
                      TransactionsContainer(
                        transactionValue: '180.000',
                        dateAndTime: '2026-01-24 : 01:40 PM',
                      ),
                      Divider(
                        color: theme.colorScheme.outline,),
                      TransactionsContainer(
                        transactionValue: '400.000',
                        dateAndTime: '2026-01-8 : 02:54 PM',
                      ),
                      Divider(
                        color: theme.colorScheme.outline,)
                    ],
                  ),
                )),
                SizedBox(
                  height: 10.hp,
                ),

               
              ],
            ), 
          ),
        ),      
      ), 

      // floatingActionButton: ValueListenableBuilder(
      //   valueListenable: showText,
      //   builder: (context, value, child) {
      //     return FloatingActionButton(
      //       onPressed: () {
      //         showDialog(context: context,
      //           builder:(context) => 
      //             Center(
      //             child: ValueListenableBuilder(
      //               valueListenable: showText,
      //               builder: (context, value, child) {
      //                 return Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                     child: Container(
      //                       width: 27.wp,
      //                       height: 29.hp,
      //                       decoration: BoxDecoration(
      //                         boxShadow:[ BoxShadow(
      //                           color: const Color.fromARGB(255, 112, 112, 112).withOpacity(0.3), 
      //                             blurRadius: 4, 
      //                             spreadRadius: 0, 
      //                             offset: const Offset(2, 2),// x and y offset
      //                         )],
      //                         borderRadius: BorderRadius.circular(1.wp),
      //                         color: theme.colorScheme.tertiaryContainer
      //                         ),
      //                         child: 
      //                           Padding(
      //                               padding: const EdgeInsets.all(8.0),
      //                               child: Column(                                
      //                                 crossAxisAlignment : CrossAxisAlignment.start, 
      //                                 children: [
      //                                   Row(
      //                                     //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                                     children: [                             
      //                                     CountryFlag.fromCountryCode(
      //                                       'Ly',
      //                                       theme: const ImageTheme(
      //                                       shape: Circle(),
      //                                     )),
      //                                     SizedBox(width: 1.wp,),
      //                                     CustomeText(
      //                                         themeStyle: theme.textTheme.titleMedium,
      //                                         size: 14,
      //                                         text: 'Kalthoum Abd-Almajeed Alatrash',
      //                                         textOverflow: TextOverflow.ellipsis,
                                               
      //                                         ),                                                          
      //                                     ],                              
      //                                   ),//Row
      //                                   SizedBox(height: 2.hp,),                            
      //                                   CustomeText(
      //                                     themeStyle: theme.textTheme.titleMedium,
      //                                     letterSpacing: 2,
      //                                     size: 16,
      //                                     text:value? obscureText('0000000000',0): '0000000000' ,
      //                                     ),
      //                                   SizedBox(height: 1.hp,),
      //                                   CustomeText(
      //                                     text:value? obscureText('0000000',0): '0000000' ,
      //                                     color: theme.colorScheme.primary,
      //                                     size: 14,),                                  
      //                                   CustomeText(
      //                                     text:value? obscureText('0000د.ل', 3): '0000د.ل' ,
      //                                     color: theme.colorScheme.primary,
      //                                     size: 14,),
      //                                   Row(
      //                                     crossAxisAlignment: CrossAxisAlignment.center,
      //                                     children: [
      //                                       const Spacer(),
      //                                       IconButton(
      //                                           onPressed:(){
      //                                             showText.value = !showText.value;
      //                                           },
      //                                           icon:Icon( value? Icons.visibility_off:Icons.visibility), color: theme.colorScheme.primary, 
      //                                       ),
      //                                       IconButton(                                  
      //                                         icon: Icon(Icons.qr_code),
      //                                         color: theme.colorScheme.primary,
      //                                         onPressed: (){
      //                                           showDialog(context: context, builder: (BuildContext context){
      //                                             return Dialog(
      //                                               child: Padding(
      //                                                 padding: const EdgeInsets.all(8.0),
      //                                                 child: Container(
      //                                                   width: 20.wp,
      //                                                   height: 70.hp,
      //                                                   decoration: BoxDecoration(
      //                                                     color: theme.colorScheme.background,
      //                                                     borderRadius: BorderRadius.circular(2.wp)
      //                                                   ),
      //                                                   child: Column(
      //                                                     mainAxisAlignment: MainAxisAlignment.center,
      //                                                     children: [
      //                                                       ValueListenableBuilder(
      //                                                         valueListenable: popUpTextColor,
      //                                                         builder: (context, value, child) {
      //                                                           return Row(
      //                                                             mainAxisSize: MainAxisSize.min,
      //                                                             children: [
      //                                                               Icon(
      //                                                                 Icons.copy,
      //                                                                 color: value,
      //                                                               ),
      //                                                               InkWell(                                                            
      //                                                                 onTapDown: (_){
      //                                                                           Clipboard.setData(
      //                                                                             ClipboardData(text: '12345678'));
      //                                                                           popUpTextColor.value = theme.colorScheme.primary;
      //                                                                         },
      //                                                                 onTapUp:(_)async{                                                               
      //                                                                           await Future.delayed(Duration(milliseconds: 200)); // 👈 delay
      //                                                                             if (mounted) {
      //                                                                               popUpTextColor.value = Colors.black;
      //                                                                           }
      //                                                                         },                                                              
      //                                                                 child: CustomeText(
      //                                                                           text: '12345678',
      //                                                                           color: value,
      //                                                                           )
      //                                                               ),
      //                                                             ],
      //                                                           );
      //                                                         }
      //                                                       ),
      //                                                       QrImageView(
      //                                                                 data: '1234567890',
      //                                                                 version: QrVersions.auto,
      //                                                                 size: 12.wp,
      //                                                               ),                                                      
      //                                                       Divider(                                                           
      //                                                                 color: theme.colorScheme.tertiary,
      //                                                                 thickness: 0.04.hp
      //                                                               ),
                                                                                                      
      //                                                       ValueListenableBuilder(
      //                                                         valueListenable: popUpText2Color,
      //                                                         builder: (context, value, child) {
      //                                                           return Row(
      //                                                             mainAxisSize: MainAxisSize.min,
      //                                                             children: [
      //                                                               Icon(
      //                                                                         Icons.copy,
      //                                                                         color: value,
      //                                                                       ),
      //                                                               InkWell(                                                            
      //                                                                 onTapDown: (_){
      //                                                                           Clipboard.setData(
      //                                                                             ClipboardData(text: '12345678'));
      //                                                                           popUpText2Color.value = theme.colorScheme.primary;
      //                                                                         },
      //                                                                 onTapUp:(_)async{                                                               
      //                                                                           await Future.delayed(Duration(milliseconds: 200)); // 👈 delay
      //                                                                             if (mounted) {
      //                                                                               popUpText2Color.value = Colors.black;
      //                                                                           }
      //                                                                         },
      //                                                                 child: CustomeText(
      //                                                                           text: '87654321',
      //                                                                           color: value,
      //                                                                           )
      //                                                               ),
      //                                                             ],
      //                                                           );
      //                                                         }
      //                                                       ),
      //                                                       QrImageView(
      //                                                                 data: '1234567890',
      //                                                                 version: QrVersions.auto,
      //                                                                 size: 12.wp,
      //                                                               ),                                                       
      //                                                     ],
      //                                                   )//column

      //                                                 ),//container
      //                                               ),//padding
      //                                             );//dialog
      //                                             }
      //                                           );//showdialog
      //                                           }
      //                                       )//IconButton
      //                                     ]
      //                                   )//row
                                                
      //                                 ]
      //                               )//column
      //                         )//padding
      //                     )//container
      //                   );//padding    
      //               }
      //             )//valueListener
      //           ) //center
      //         );},          
      //       child: Icon(Icons.credit_card),
      //       backgroundColor:theme.colorScheme.background,
      //       foregroundColor: theme.colorScheme.primary,
      //       shape: const CircleBorder(),
      //     );//floating
      //   }
      // )
    );         
    }
}