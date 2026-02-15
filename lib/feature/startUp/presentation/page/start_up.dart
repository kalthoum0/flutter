import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/extensions/context_extension.dart';
import 'package:flutter_application_2/core/router/router.dart';
import 'package:flutter_application_2/core/router/router.gr.dart';
import 'package:flutter_application_2/feature/startUp/presentation/widgets/custom_container.dart';
import 'package:flutter_application_2/feature/widgets/custome_samll_text.dart';
import 'package:screentasia/screentasia.dart';

import '../../../login/presentation/page/login_page.dart';

@RoutePage()

class StartUpPage extends StatefulWidget {
  const StartUpPage({super.key});

  @override
  State<StartUpPage> createState() => _MyStartUpPageState();
}

class _MyStartUpPageState extends State<StartUpPage> {
  @override
  Widget build(BuildContext context) {
   
      return Center(
        child: SizedBox(
          width: context.isMobile? 100.wp: 75.wp,
          child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            actions: [
              IconButton(
                onPressed: (){}, 
                icon: Icon(Icons.help_outline),
                color: Theme.of(context).colorScheme.primary,
                iconSize: 5.hp ),
            ],
            leading: IconButton(
              onPressed: (){},
              icon: Icon(Icons.settings),
              color: Theme.of(context).colorScheme.primary,
              iconSize: 4.hp
            ),
            title:  Image.asset('assets/images/logo.png',
                    color: Theme.of(context).colorScheme.primary,
                    height: 15.hp  )
          ),
          
          body: SingleChildScrollView(
            child: Column(                                      
              children: [      
                CarouselSlider(                
                  options: CarouselOptions(height: 17.hp,
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
                      );
                },
                ); 
                }).toList(),),
            
                SizedBox(height: 2.hp,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0.5.wp),
                  child: Column(children: [
                     CustomContainer(
                  //  w: 24.wp,
                  w: MediaQuery.of(context).size.width *0.94,
                  img: Image.asset('assets/images/bank_Icon.png', color:Colors.white,width: 4.wp,), 
                  Txt: CustomeText(text:  'الحساب المصرفي',padding:true,color: Colors.white)             
                ),
                
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, spacing: 8.0,
                  children: [
                  Expanded(
                    child: InkWell(
                      onTap:  (){
                        context.pushRoute(LoginPageRoute());
                      },                 
                      child: CustomContainer(
                        img: Image.asset('assets/images/midwhats.png',color:Colors.white,width: 4.wp,), 
                        Txt: CustomeText(text: 'ميد واتس',padding:true,color: Colors.white) , 
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        circleColor: Theme.of(context).colorScheme.onSecondaryContainer,
                        ),
                    ),
                  ),
                          
                    Expanded(
                      child: CustomContainer(
                      img: Image.asset('assets/images/smartPay.png',color:Colors.white,width: 4.wp,), 
                      Txt: CustomeText(text:  'سمارت باي',padding:true,color: Colors.white) 
                      ),
                    )
                ],),
            
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, spacing: 8.0, 
                  children: [
                  Expanded(
                    child: CustomContainer(
                      img: Image.asset('assets/images/customerServe.png',color:Colors.white,width: 4.wp,), 
                      Txt: CustomeText(text:  'اتصل بنا',padding:true ,color:Colors.white) 
                      ),
                  ),
                    Expanded(
                      child: CustomContainer(
                      img: Image.asset('assets/images/online.png',color:Colors.white,width: 4.wp,), 
                      Txt: CustomeText(text:  'الموقع الالكتروني',padding:true,color:Colors.white) ),
                    )
                    
                ],),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, spacing: 8.0, 
                  children: [              
                  Expanded(
                    child: CustomContainer(
                      
                      img: Image.asset('assets/images/bank_Icon.png',color:Colors.white,width: 4.wp,), 
                      Txt:CustomeText(text:  'فتح حساب مصرفي',padding:true,color:Colors.white) 
                      ),
                  ),
                    Expanded(
                      child: CustomContainer(
                      img: Image.asset('assets/images/location_Icon.png',color:Colors.white,width: 4.wp,), 
                      Txt: CustomeText(text:  'الفروغ',padding:true,color:Colors.white) 
                      ),
                    )
                ],)                       
                ],),
                )
            
               
                             
                
                // Container(
                //   padding: EdgeInsets.all(10),
                //   margin: EdgeInsets.all(20),
                //   color: Theme.of(context).colorScheme.primary,
                  // child: Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     // Image.asset('assets/images/bank_Icon', color:Colors.white,),
                  //     Text('Bank account',style: TextStyle(color: Colors.white))
                  //   ],
                  // )
                // )
              ],
            ),
          )
              ),
        ),
      );
  }
}

// class StartUpPage extends StatelessWidget {
//   const StartUp({super.key});

//   @override
//   Widget build(BuildContext context) {
//   }
// }