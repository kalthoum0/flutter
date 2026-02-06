import 'package:flutter/material.dart';
import 'package:flutter_application_2/feature/widgets/custom_textff.dart';
import 'package:flutter_application_2/feature/widgets/custome_samll_text.dart';
import 'package:screentasia/screentasia.dart';

class SmartPayPage extends StatefulWidget {
  const SmartPayPage({super.key});

  @override
  State<SmartPayPage> createState() => _SmartPayPageState();
}

class _SmartPayPageState extends State<SmartPayPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController transferController = TextEditingController();
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          ImageIcon(
            AssetImage('assets/images/smartPay.png'),
            color: theme.colorScheme.primary,
          ),
          CustomeText(
            text: 'SamrtPay',
            themeStyle: theme.textTheme.titleMedium,
            size: 5.sp,
            color: theme.colorScheme.primary,
            ),
          CustomeText(
            text:"سمارت باي هي خدمة دفع رقمية جديدة تتيح لأي عميل في بنك باي إجراء مدفوعات فورية وآمنة عبر نقاط البيع المدعومة دون الحاجة إلى نقد أو بطاقة مصرفية. تعمل هذه الميزة على تحسين تجربة التسوق من خلال توفير طريقة دفع سريعة، سهلة وذكية في المتاجر، الأسواق، ومختلف مواقع تقديم الخدمات.",
            color: Colors.black),

          Row(
            children: [
              CustomeText(
                text: 'المبلغ المراد تحويله',
                themeStyle: theme.textTheme.titleMedium,
                color: Colors.black,
              ),
              CustomeText(
                text: '(تحويل أموال)',
                themeStyle: theme.textTheme.titleMedium,
                color: theme.colorScheme.primary,
              ),
            ],
          ),

          Customtextfeild(
            controller: transferController, 
            keyboardType: TextInputType.number, 
            textInputAction: TextInputAction.none,
            hintText: 'المبلغ المراد تحويله',)

          

        ],
      )
    );
  }
}