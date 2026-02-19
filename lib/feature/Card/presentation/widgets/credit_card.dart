import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:screentasia/screentasia.dart';


class CreditCard extends StatelessWidget {
  String cardNumber = "4242 4242 4242 4242";
  String expiryDate = "12/28";
  String cardHolderName = "John Doe";
  String cvvCode = "123";
  bool isCvvFocused = false;
 
   CreditCard({   
    super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
      ),
      child: CreditCardWidget(
        width: 25.wp,
        height: 20.hp,
        cardBgColor:theme.colorScheme.primary ,
        cardNumber: cardNumber,
        expiryDate: expiryDate,
        cardHolderName: cardHolderName,
        cvvCode: cvvCode,
        showBackView: false,  
        glassmorphismConfig: null,
        enableFloatingCard: true,
        floatingConfig: FloatingConfig(
          isGlareEnabled: true,
          isShadowEnabled: true,
          shadowConfig: FloatingShadowConfig(),
        ),
        onCreditCardWidgetChange: (CreditCardBrand brand){}
      ),
    );
  }
}