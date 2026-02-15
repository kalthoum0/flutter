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


@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    final ValueNotifier<bool> showText  = ValueNotifier(true);
    final ValueNotifier<Color> popUpTextColor = ValueNotifier(Colors.black);
    final ValueNotifier<Color> popUpText2Color = ValueNotifier(Colors.black);
    ThemeData theme = Theme.of(context);

    String obscureText(String text, int showLast ) {
      if (text.length <= showLast) return "*" * text.length;
      return "*" * (text.length - showLast) + text.substring(text.length - showLast);}
    return  Scaffold(
        
      body: 
      Center(
        child: SizedBox(
          width: context.isMobile? 100.wp:75.wp,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(                
                  options: CarouselOptions(height: 14.hp,
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
                        width: 15.wp,
                        height: 20.hp,
                        decoration: BoxDecoration(
                          
                          borderRadius: BorderRadius.circular(1.wp),
                          color: theme.colorScheme.tertiaryContainer
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
                                    Row(
                                      children: [
                                        IconButton(
                                        onPressed:(){
                                          showText.value = !showText.value;
                                        },
                                        icon:Icon( value? Icons.visibility_off:Icons.visibility), color: theme.colorScheme.primary, ),
                                        IconButton(
                                          icon: Icon(Icons.qr_code),
                                          color: theme.colorScheme.primary,
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
                                          },)
                                      ],
                                    ),                              
                                    ],                              
                                  ),
                                  SizedBox(height: 2.hp,),
                                  CustomeText(
                                        text: 'Kalthoum' ,
                                        ),
                                  CustomeText(
                                    text:value? obscureText('0000000000',0): '0000000000' ,
                                    ),
                                  CustomeText(
                                    text:value? obscureText('0000000',0): '0000000' ,
                                    color: theme.colorScheme.primary,),
                                  CustomeText(
                                    text:value? obscureText('0000د.ل', 3): '0000د.ل' ,
                                    color: theme.colorScheme.primary,),
                                
                              
                                ]
                                                  ),
                            )
                        
                      ),
                    );
                  }
                ),
          
                Directionality(
                textDirection: TextDirection.rtl, 
                child: Padding(
                  padding:  EdgeInsets.all(0.2.wp),
                  child: HomeDevider(
                    icon: Icon(
                      Icons.stars, 
                      color: theme.primaryColor), 
                    text: 'خدماتSMART',              
                    useContainer: true,
                    containerColor: theme.colorScheme.tertiaryContainer ,
                    containerText: 'Premium',
                    borderColor: theme.colorScheme.primary,                
                    ),
                 )
              ),
          
            
               Center(
                  child: Padding(
                    padding:  EdgeInsets.all(0.5.wp),
                    child: Container(
                      padding: EdgeInsets.only(top: 2.5.hp),
                      // width: 80.wp,
                      height: 52.hp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.5.wp),
                        color: theme.colorScheme.tertiaryContainer,
                        boxShadow:[ BoxShadow(
                          color: theme.colorScheme.shadow, 
                          spreadRadius: 2, // how much the shadow spreads
                          blurRadius: 8,   // blur effect
                          offset: Offset(0, 4)
                        )]
                      ),
                      child: Column(
                        children: [
                          Row(  
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             Expanded(
                               child: CustomHomeContainer(
                                icon: SvgPicture.asset('assets/svg/medwatsIcon.svg',width: 6.wp, height:5.hp ),
                                label:'ميد واتس'),
                             ),
                             Expanded(
                               child: CustomHomeContainer(
                                icon: SvgPicture.asset('assets/svg/smartPayCircle2.svg',width: 6.wp, height:5.hp ),
                                label:'سمارت باي'),
                             ),
                            ]),             
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             Expanded(
                               child: CustomHomeContainer(
                                icon: SvgPicture.asset('assets/svg/ATM.svg',
                                width: 6.wp, 
                                height:5.hp, ),
                                label:'SmartAtm'),
                             ),
                             Expanded(
                               child: CustomHomeContainer(
                                icon: SvgPicture.asset('assets/svg/SmartStore.svg',width: 6.wp, height:5.hp ),
                                label:'SmartStore'),
                             ),
                            ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             Expanded(
                               child: CustomHomeContainer(
                                icon: SvgPicture.asset('assets/svg/creditCard2.svg',width: 6.wp, height:5.hp ),
                                label:'SmartCard'),
                             ),
                             Expanded(
                               child: CustomHomeContainer(
                                icon: SvgPicture.asset('assets/svg/smartSmsLogo.svg',width: 6.wp, height:5.hp ),
                                label:'SmartSMS'),
                             ),
                            ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             Expanded(
                               child: CustomHomeContainer(
                                icon: SvgPicture.asset('assets/svg/financeBook.svg',width: 6.wp, height:5.hp ),
                                label:'8'),
                             ),
                             Expanded(
                               child: CustomHomeContainer(
                                icon: SvgPicture.asset('assets/svg/smartanalytics.svg',width: 6.wp, height:5.hp ),
                                label:' Smart تحليلات'),
                             ),
                            ])
                        ],
                      ),
                    ),
                  ),
                ),
          
               Directionality(
                textDirection: TextDirection.rtl, 
                child: Padding(
                  padding:  EdgeInsets.all(0.2.wp),
                  child: HomeDevider(
                    icon: Icon(
                      Icons.rocket_launch_outlined, 
                      color: theme.primaryColor), 
                    text: "سمارت بلس",              
                    useContainer: true,
                    containerColor:theme.colorScheme.surfaceContainerHigh ,
                    containerText: 'New',
                    borderColor: theme.colorScheme.onSurfaceVariant,
                    containerIcon: Icon(
                      Icons.auto_awesome_outlined,
                      color:  theme.colorScheme.onSurfaceVariant,
                      size: 1.wp),
                    ),
                 )
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
                        color: theme.colorScheme.tertiaryContainer,
                        boxShadow:[ BoxShadow(
                          color: theme.colorScheme.shadow, 
                          spreadRadius: 2, // how much the shadow spreads
                          blurRadius: 8,   // blur effect
                          offset: Offset(0, 4)
                        )]
                      ),
                      child: Column(
                        children: [
                          Row(  
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             Expanded(
                               child: CustomHomeContainer(
                                icon: SvgPicture.asset('assets/svg/financeBook.svg',width: 6.wp, height:5.hp ),
                                label:'smart'),
                             ),
                             Expanded(
                               child: CustomHomeContainer(
                                icon: SvgPicture.asset('assets/svg/financeBook.svg',width: 6.wp, height:5.hp ),
                                label:'smart'),
                             ),
                            ]
                          )
                        ]
                      ),
                  )
                )
              ) ,
          
              Directionality(
                textDirection: TextDirection.rtl, 
                child: Padding(
                  padding:  EdgeInsets.all(0.2.wp),
                  child: HomeDevider(
                    icon: Icon(
                      Icons.account_balance_outlined, 
                      color: theme.colorScheme.primaryContainer), 
                    text: "الخدمات العامة",                              
                  ),
                )
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
                        color: theme.colorScheme.surfaceContainerLow,
                        boxShadow:[ BoxShadow(
                          color: theme.colorScheme.shadow, 
                          spreadRadius: 2, // how much the shadow spreads
                          blurRadius: 8,   // blur effect
                          offset: Offset(0, 4)
                        )]
                      ),
                      child: Column(
                        children: [
                          Row(  
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             Expanded(
                               child: CustomHomeContainer(
                                icon: SvgPicture.asset('assets/svg/financeBook.svg',width: 6.wp, height:5.hp ),
                                label:'smart'),
                             ),
                             Expanded(
                               child: CustomHomeContainer(
                                icon: SvgPicture.asset('assets/svg/financeBook.svg',width: 6.wp, height:5.hp ),
                                label:'smart'),
                             ),
                            ]
                          )
                        ]
                      ),
                  )
                )
              ) ,
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
                          color: theme.colorScheme.primary,
                          themeStyle: theme.textTheme.titleMedium,),
                      )
                    ],
                  ),
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding:  EdgeInsets.all(1.wp),
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
                ))
              ],
            ), 
          ),
        ),
      )
    );
  }
}