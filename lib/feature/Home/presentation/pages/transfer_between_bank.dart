import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:screentasia/screentasia.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../widgets/custome_samll_text.dart';

class TransferBetweenBank extends StatelessWidget {
  const TransferBetweenBank({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            // width: context.isMobile?100.wp: 75.wp,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
              children: [
                SizedBox(height: 10.hp,),
                SvgPicture.asset('assets/svg/onePay.svg',
                height: 20.wp,),
              
              InkWell(
                onTap: (){},
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.background,
                    borderRadius: BorderRadius.circular(1.wp),
                    boxShadow: [BoxShadow(
                      color: theme.colorScheme.shadow, // Light grey/black
                      blurRadius: 15,                        // How "blurry" the shadow is
                      spreadRadius: 0,                       // How much the shadow expands
                      offset: const Offset(0, 8),
                    )]
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.edit,
                      color: theme.colorScheme.primary
                        ),
                      title: CustomeText(
                        text: 'تحويل يدوي',
                        color: theme.colorScheme.primary,
                        size: 3.sp
                      ),
                      subtitle: CustomeText(
                        text: 'ادخال بيانات التحويل يدويا',
                        size: 3.sp),
                  
                      // trailing: Icon(
                      //   Icons.arrow_forward_ios,
                      //   color: theme.colorScheme.primary),
                  ),
                ),              
              ),
              SizedBox(height: 1.hp,),
              Row(children: [
                Expanded(
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.background,
                        borderRadius: BorderRadius.circular(1.wp),
                        boxShadow: [BoxShadow(
                          color: theme.colorScheme.shadow, // Light grey/black
                          blurRadius: 15,                        // How "blurry" the shadow is
                          spreadRadius: 0,                       // How much the shadow expands
                          offset: const Offset(0, 8),
                        )]
                      ),
                      child: ListTile(
                        leading: Icon(Icons.qr_code_scanner,
                        color: theme.colorScheme.primary,),                
                        title: CustomeText(
                          text: 'مسح رمز QR',
                          color: theme.colorScheme.primary,
                          size: 3.sp),
                          
                        subtitle: CustomeText(
                          text: 'تحويل اموال',
                          size: 3.sp),

                        // trailing: Icon(
                        // Icons.arrow_forward_ios,
                        // color: theme.colorScheme.primary)
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 0.5.wp),
                Expanded(
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.background,
                        borderRadius: BorderRadius.circular(1.wp),
                        boxShadow: [BoxShadow(
                          color: theme.colorScheme.shadow, // Light grey/black
                          blurRadius: 15,                        // How "blurry" the shadow is
                          spreadRadius: 0,                       // How much the shadow expands
                          offset: const Offset(0, 8),
                        )]
                      ),
                      child: ListTile(
                        leading:Icon(Icons.qr_code,
                            color: theme.colorScheme.primary,),                
                            title: CustomeText(
                              text: 'اصدار رمز QR',
                              size: 3.sp,
                              color: theme.colorScheme.primary,),
                        subtitle: CustomeText(
                              size: 3.sp,
                              text: 'استلام اموال'),
                        // trailing: Icon(
                        // Icons.arrow_forward_ios,
                        // color: theme.colorScheme.primary)
                      ),
                    ),
                  ),
                )
              ],)
              ],),
            ),
          ),
          
        ),
      )
    );
  }
}