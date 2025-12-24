import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/custom_container.dart';
import 'package:flutter_application_2/custome_text.dart';
import 'package:screentasia/screentasia.dart';

import 'login_page.dart';

class StartUp extends StatefulWidget {
  const StartUp({super.key});

  @override
  State<StartUp> createState() => _MyStartUpState();
}

class _MyStartUpState extends State<StartUp> {
  @override
  Widget build(BuildContext context) {
   
      return Scaffold(
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
        child: Container(
          
          padding:EdgeInsets.symmetric(horizontal: 5),
          child: Column(                             
            children: [      
              CarouselSlider(                
                options: CarouselOptions(height: 15.hp,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 1),
                autoPlayAnimationDuration: const Duration(milliseconds: 700)),
                items: ['assets/images/img_slider1.jpg','assets/images/img_slider2.jpg','assets/images/img_slider1.jpg'].map((i) {
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
                 w: 23.wp,
                Img: Image.asset('assets/images/bank_Icon.png', color:Colors.white,width: 4.wp,), 
                Txt: CustomeText(text:  'الحساب المصرفي')             
              ),
          
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                InkWell(
                  onTap:  (){
                    Navigator.of(context).push(
                     MaterialPageRoute(builder: (context)=> LoginPage())
                    );
                  },                 
                  child: CustomContainer(
                    Img: Image.asset('assets/images/midwhats.png',color:Colors.white,width: 4.wp,), 
                    Txt: CustomeText(text: 'ميد واتس') , 
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    circleColor: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                ),
          
                  CustomContainer(
                  Img: Image.asset('assets/images/smartPay.png',color:Colors.white,width: 4.wp,), 
                  Txt: CustomeText(text:  'سمارت باي') 
                  )
              ],),
          
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                CustomContainer(
                  Img: Image.asset('assets/images/customerServe.png',color:Colors.white,width: 4.wp,), 
                  Txt: CustomeText(text:  'اتصل بنا') 
                  ),
                  CustomContainer(
                  Img: Image.asset('assets/images/online.png',color:Colors.white,width: 4.wp,), 
                  Txt: CustomeText(text:  'الموقع الالكتروني') )
                  
              ],),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [              
                CustomContainer(
                  
                  Img: Image.asset('assets/images/bank_Icon.png',color:Colors.white,width: 4.wp,), 
                  Txt:CustomeText(text:  'فتح حساب مصرفي') 
                  ),
                  CustomContainer(
                  Img: Image.asset('assets/images/location_Icon.png',color:Colors.white,width: 4.wp,), 
                  Txt: CustomeText(text:  'الفروغ') 
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
        ),
      )
    );
  }
}

// class StartUp extends StatelessWidget {
//   const StartUp({super.key});

//   @override
//   Widget build(BuildContext context) {
//   }
// }