
import 'package:flutter/material.dart';
import 'package:screentasia/screentasia.dart';

class CustomContainer extends StatelessWidget {
  final Widget img;
  final Widget Txt;
  final double? w ;
  final Color? color;
  final Color? circleColor;
  const CustomContainer({
    super.key,
    required this.img,
    required this.Txt,
    this.w,
    this.color,
    this.circleColor});
  

  @override
  Widget build(BuildContext context) {
    return  
     
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(          
              clipBehavior: Clip.hardEdge, 
              height: 12.5.hp,            
              //width: w?? MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: color?? Theme.of(context).colorScheme.primary,
              ),                          
              child: 
                Stack(                                                                     
                  children:[
                    Positioned(
                    bottom: 60,
                     left: 70,
                    child: 
                    CircleAvatar(
                    backgroundColor:circleColor?? Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                    radius: 60,                                     
                    ),),             
                    Positioned(
                      bottom: 35,
                      left: -40,
                      child: 
                      CircleAvatar(
                      backgroundColor:circleColor?? Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                      radius: 45,                                     
                      ),),             
                    Positioned(
                      bottom: -10,
                      left: -40,
                      child: 
                      CircleAvatar(
                      backgroundColor:circleColor?? Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                      radius: 35,                                     
                      ),), 
                    Positioned.fill(
                      right: 0,
                      child:   
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        img,
                        Txt
                      ],              
                    ),)
                  ],
                )
              ),
        );

          // Stack(
          //   clipBehavior: Clip.hardEdge,               
          //   children: [
          //     Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(16),
          //         color: color?? Theme.of(context).colorScheme.primary,
          //       ),
          //               // height: 10.hp,
          //       // 50.wp,
          //      width: w?? 11.wp,                                
          //       child: Column(
          //        crossAxisAlignment: CrossAxisAlignment.end,
          //        children: [
          //          Img,
          //          Txt
          //        ],              
          //       )
          //     ),
                                    
          //     Positioned(
          //         bottom: 60,
          //          left: 70,
          //         child: 
          //         CircleAvatar(
          //         backgroundColor:circleColor?? Theme.of(context).colorScheme.secondary.withOpacity(0.3),
          //         radius: 60,                                     
          //         ),                 
          //     ),             
          //     Positioned(
          //         bottom: 35,
          //         left: -40,
          //         child: 
          //         CircleAvatar(
          //         backgroundColor:circleColor?? Theme.of(context).colorScheme.secondary.withOpacity(0.3),
          //         radius: 45,                                     
          //         ),                 
          //     ),             
          //     Positioned(
          //         bottom: -10,
          //         left: -40,
          //         child: 
          //         CircleAvatar(
          //         backgroundColor:circleColor?? Theme.of(context).colorScheme.secondary.withOpacity(0.3),
          //         radius: 35,                                     
          //         ),                 
          //     ),             
          //     ],             
              // ));
        
  }
}