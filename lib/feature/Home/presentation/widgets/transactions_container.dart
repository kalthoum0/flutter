import 'package:flutter/material.dart';
import 'package:flutter_application_2/feature/widgets/custome_samll_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:screentasia/screentasia.dart';

class TransactionsContainer extends StatelessWidget {
  final String transactionValue;
  final String dateAndTime;
  const TransactionsContainer({
    super.key,
    required this.dateAndTime,
    required this.transactionValue});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
 
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(1.wp),
      color: theme.colorScheme.background,
      boxShadow: [BoxShadow(
       color: const Color.fromARGB(255, 112, 112, 112).withOpacity(0.3), 
                  blurRadius: 4, 
                  spreadRadius: 0, 
                  offset: const Offset(2, 2),
      )]
    ),
    child: ListTile(
      leading: 
      CircleAvatar(
        child: SvgPicture.asset('assets/svg/financeBook.svg'),
      ),
      title:CustomeText(text: 'SmartATM') ,
      subtitle:Row(
        mainAxisSize: MainAxisSize.min,
        children: [
        CustomeText(text: dateAndTime,
          color:  Colors.grey,
          ),
        SizedBox(width: 1.wp,),
        Icon(
          Icons.check_box,
          size: 1.wp,
          color: theme.colorScheme.primary,
        )
      ],) ,
      trailing:Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomeText(
            text: transactionValue,            
            themeStyle: theme.textTheme.titleMedium,),
          SizedBox(width: 0.5.wp,),
          CustomeText(
            text: 'د.ل',
            color: theme.colorScheme.primary,
            themeStyle: theme.textTheme.titleMedium)
      ],)
       ,
    ),
  );
  }
}