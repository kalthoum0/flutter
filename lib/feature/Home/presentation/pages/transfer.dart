import 'package:flutter/material.dart';
import 'package:flutter_application_2/feature/Home/presentation/widgets/transfer_Container.dart';
import 'package:flutter_svg/svg.dart';
import 'package:screentasia/screentasia.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TransferContainer(
                      icon: SvgPicture.asset('assets/images/financeBook.svg', width: 9.wp, height: 9.hp,), 
                      label: 'التحويل المباشلر'),
                  ),
                  Expanded(
                    child: TransferContainer(
                      icon: SvgPicture.asset('assets/images/financeBook.svg', width: 9.wp, height: 9.hp,), 
                      label: 'التحويل المباشلر'),
                  ),
                ],
              ),
              SizedBox(height: 1.hp,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TransferContainer(
                      icon: SvgPicture.asset('assets/images/financeBook.svg', width: 9.wp, height: 9.hp,), 
                      label: 'التحويل المباشلر'),
                  ),
                  Expanded(
                    child: TransferContainer(
                      icon: SvgPicture.asset('assets/images/financeBook.svg', width: 9.wp, height: 9.hp,), 
                      label: 'التحويل المباشلر'),
                  ),
                ],
              ),
               SizedBox(height: 1.hp,),
               Row(
                  children: [
                   Expanded(
                    child: TransferContainer(
                      icon: SvgPicture.asset('assets/images/financeBook.svg', width: 9.wp, height: 9.hp,), 
                      label: 'التحويل المباشلر'),
                  ),]
                )
            ],
          ),
      ),
      
    );
  }
}