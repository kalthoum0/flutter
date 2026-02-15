import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/extensions/context_extension.dart';
import 'package:flutter_application_2/feature/widgets/custom_button.dart';
import 'package:flutter_application_2/feature/widgets/custom_textff.dart';
import 'package:flutter_application_2/feature/widgets/custome_samll_text.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screentasia/screentasia.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()

class SmartPayPage extends StatefulWidget {
  const SmartPayPage({super.key});

  @override
  State<SmartPayPage> createState() => _SmartPayPageState();
}

class _SmartPayPageState extends State<SmartPayPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController transferController = TextEditingController();
  @override
  void dispose() {
    transferController.dispose();
    super.dispose();
  }
  @override
  
  Widget build(BuildContext context) {    
    
    ThemeData theme = Theme.of(context);
    return Center(
      child: SizedBox(
        width: context.isMobile? 100.wp:75.wp,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.all(1.wp),
              child: Column(
                children: [
                  ImageIcon(
                    AssetImage('assets/images/smartPay.png'),
                    color: theme.colorScheme.primary,
                    size: 20.wp,
                  ),
                  CustomeText(
                    text: 'SamrtPay',
                    themeStyle: theme.textTheme.titleMedium,                
                    color: theme.colorScheme.primary,
                    size: 14,
                    ),
                  SizedBox(height: 1.hp,),
                  CustomeText(
                    textDirection: TextDirection.rtl,
                    text:"سمارت باي هي خدمة دفع رقمية جديدة تتيح لأي عميل في بنك باي إجراء مدفوعات فورية وآمنة عبر نقاط البيع المدعومة دون الحاجة إلى نقد أو بطاقة مصرفية. تعمل هذه الميزة على تحسين تجربة التسوق من خلال توفير طريقة دفع سريعة، سهلة وذكية في المتاجر، الأسواق، ومختلف مواقع تقديم الخدمات.",
                    ),
                  SizedBox(height: 1.hp,),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      CustomeText(
                        text: 'المبلغ المراد تحويله ',
                        themeStyle: theme.textTheme.titleMedium,
                        color: theme.textTheme.titleMedium?.color!.withOpacity(0.7),
                        textDirection: TextDirection.rtl,                    
                      ),
                      // SizedBox(width: 0.5.wp,),
                      CustomeText(
                        text: '(تحويل أموال)',
                        themeStyle: theme.textTheme.titleMedium,
                        color: theme.colorScheme.primary,
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                  SizedBox(height: 0.5.hp,),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Customtextfeild(
                            controller: transferController, 
                            keyboardType: TextInputType.number, 
                            textInputAction: TextInputAction.done,
                            hintText: 'المبلغ المراد تحويله',
                            textDirection: TextDirection.rtl,                  
                            validator: (value){
                              if(value==null || value.isEmpty){
                                return 'الرجاء ادخال المبلغ المراد تحويله';
                              }
                              if(!RegExp(r'^\d+$').hasMatch(value)){
                                return'يرجى إدخال قيمة تحويل صحيحة';
                              }
                             
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 1.hp,),
                        InkWell(                          
                          onTap: (){
                            if(_formKey.currentState!.validate()){
                              showDialog(context: context, builder: (BuildContext context){
                                return Dialog(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 20.wp,
                                        height: 40.hp,
                                        decoration: BoxDecoration(
                                        color: theme.colorScheme.background,
                                        borderRadius: BorderRadius.circular(2.wp)),
                                          child: QrImageView(
                                            data: transferController.text,
                                            version: QrVersions.auto,
                                            size: 12.wp,
                                          )
                                      )
                                    )
                                  );
                                });
                            }
                          },                                                         
                          child: Container(      
                            height: 5.hp,                        
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0.5.wp),
                              color: theme.colorScheme.primary,
                            ),
                            child: Center(
                              child: CustomeText(
                                text: ' QR اصدار رمز',
                                color: Colors.white,),
                            ),
                          ), 
                        ),
                        SizedBox(height: 1.hp,),
                        InkWell(
                              onTap: (){},
                              child: Container(      
                                  height: 5.hp,                        
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.5.wp),
                                    color: theme.colorScheme.background,
                                    border: Border.all(
                                      color: theme.colorScheme.primary,
                                      width: 0.1.wp
                                    )
                                  ),
                                  child: Center(
                                    child: CustomeText(
                                      text: 'حوالات SmartPay',
                                      color: theme.colorScheme.primary,
                                      themeStyle: theme.textTheme.titleMedium,
                                      textDirection: TextDirection.rtl),
                                  ),
                                ), 
                            )
        
                      ],
                    ),
                  ),                                       
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}