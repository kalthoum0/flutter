import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/extensions/context_extension.dart';
import 'package:flutter_application_2/core/router/router.gr.dart';
import 'package:flutter_application_2/feature/Card/data/Mapper/card_settings_class.dart';
import 'package:flutter_application_2/feature/Card/presentation/bloc/freeze_card_bloc.dart';
import 'package:flutter_application_2/feature/Card/presentation/bloc/settings_sheet_bloc.dart';
import 'package:flutter_application_2/feature/Card/presentation/widgets/credit_card.dart';
import 'package:flutter_application_2/feature/Card/presentation/widgets/details_containers.dart';
import 'package:flutter_application_2/feature/Card/presentation/widgets/settings_container.dart';
import 'package:flutter_application_2/feature/widgets/custom_textff.dart';
import 'package:flutter_application_2/feature/widgets/custome_samll_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:screentasia/screentasia.dart';

import '../../../Home/presentation/widgets/transfer_Container.dart';
import '../../domain/entities/card_dialog_type.dart';
import '../widgets/bottom_sheet.dart';
import '../widgets/freeze_unfreeze_dialog.dart';
import '../widgets/pin_dialog.dart' show PinDialog;

@RoutePage()
class CardPage extends StatefulWidget {
  const CardPage({super.key});
  
  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  
  @override
  Widget build(BuildContext context) {
    final List<CardSettings> cardSettingsList = [
    CardSettings(
      icon: Icons.lock,
      label: 'Freeze card',
      onTap: () {
        context.read<FreezeCardBlocBloc>().add(
          OpenFreezeDialog(type: CardDialogType.freeze),
        );
      },
    ),
    CardSettings(
      icon: Icons.lock_open,
      label: 'Unfreeze card',
      onTap: () {
        context.read<FreezeCardBlocBloc>().add(
          OpenFreezeDialog(type: CardDialogType.Unfreeze),
        );
      },
    ),
    CardSettings(
      icon: Icons.key,
      label: 'Set PIN',
      onTap: () {
        context.read<FreezeCardBlocBloc>().add(
          OpenFreezeDialog(type: CardDialogType.setPin),
        );
      },
    ),
    CardSettings(
      icon: Icons.edit,
      label: 'Reset PIN',
      onTap: () {
        context.read<FreezeCardBlocBloc>().add(
          OpenFreezeDialog(type: CardDialogType.resetPin),
        );
      },
    ),
    CardSettings(icon: Icons.password, label: 'Card Number', onTap: () {}),
    CardSettings(
      icon: Icons.description,
      label: 'View card statement',
      onTap: () {},
    ),
  ];
    ThemeData theme = Theme.of(context);
    return BlocListener<FreezeCardBlocBloc, FreezeCardBlocState>(
      listener: (context, state) {                  
        if(state is ShowCardDialog ){
         
          Widget dialog;

          switch (state.dialogType){
            case CardDialogType.freeze:
              dialog =  const FreezeUnfreezeDialog(message: 'are you sure');   
              break;  
            case CardDialogType.Unfreeze:
            dialog = const FreezeUnfreezeDialog(message: 'Unfreeze');
            break;
            case CardDialogType.setPin:
            dialog = PinDialog(
              lable: 'PIN تعيين', 
              description1: 'Set password', 
              twoTextFrames: false, 
             );
             break;  
            case CardDialogType.resetPin:
            dialog = PinDialog(
              lable: " PIN تغيير", 
              description1: 'New password', 
              description2: 'Old password',
              twoTextFrames: true);  
            default: 
            dialog = Placeholder();
          }

          (showDialog(
            context: context,
            builder: (_) => dialog,
          ));
        }
      },
      child: Center(
        child: SizedBox(
          width: context.isMobile ? 100.wp : 75.wp,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  //context.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: theme.colorScheme.primary,
                ),
              ),
              title: Image.asset(
                'assets/images/logo.png',
                color: Theme.of(context).colorScheme.primary,
                height: 15.hp,
              ),
              centerTitle: true,

              
            ),

            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding:  EdgeInsets.all(1.wp),
                  child: SizedBox(
                    width: 65.wp,
                    child: Column(                      
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomeText(text: 'Chose your account',
                            themeStyle: theme.textTheme.titleMedium,
                            color: theme.textTheme.titleSmall!.color!.withOpacity(0.5),
                            size: 14),
                          ],
                        ),
                        SizedBox(height: 1.hp,),
                        DropdownMenu(
                          menuStyle: MenuStyle(
                            minimumSize: MaterialStateProperty.all(const Size(250, 40)),
                             maximumSize: MaterialStateProperty.all(const Size(250, double.infinity)), // 250 is width
                           
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16), // Adjust radius as needed
                                ),
                              ),
                          ),
                          width: double.infinity,
                          textStyle: TextStyle(
                            fontWeight: theme.textTheme.titleMedium!.fontWeight,
                            fontSize: theme.textTheme.titleSmall!.fontSize,
                            color: theme.textTheme.titleSmall!.color!.withOpacity(0.5),                            
                          ),
                          trailingIcon: Icon(
                              Icons.arrow_drop_down, 
                              color: theme.textTheme.bodyMedium!.color!.withOpacity(0.4) // Set your custom color here
                          ),
                          selectedTrailingIcon:  Icon(
                            Icons.arrow_drop_up,
                            color: theme.colorScheme.primary,
                          ),
                          inputDecorationTheme: InputDecorationTheme(                            
                            filled: true,
                            fillColor: theme.colorScheme.shadow.withOpacity(0.15),
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none, // 🔥 no border color
                          ),
                          ),
                          enableFilter: true,
                          dropdownMenuEntries: <DropdownMenuEntry<String>>[
                            
                            DropdownMenuEntry(
                              value: 'Medit 01', 
                              label: 'Medit 01', 
                              style: ButtonStyle(
                                textStyle: MaterialStateProperty.all(
                                TextStyle(                                                                    
                                  fontSize: 12,
                                ),
                            ))),
                            DropdownMenuEntry(value: 'Medit 02', label: 'Medit 02',
                            style: ButtonStyle(
                                textStyle: MaterialStateProperty.all(
                                TextStyle(                                                                    
                                  fontSize: 12,
                                ),
                            ))),
                            DropdownMenuEntry(value: 'Medit 03', label: 'Medit 03',
                            style: ButtonStyle(
                                textStyle: MaterialStateProperty.all(
                                TextStyle(                                                                    
                                  fontSize: 12,
                                ),
                            ))),                           
                        ]),

                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 1.wp),
                          child: CreditCard(),
                        ),
                        CardContainer(
                          label: 'Balance',
                          data: '45,678.90\$',
                          color: theme.colorScheme.primary,
                          icon: Icon(
                            Icons.wallet,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CardContainer(
                                label: 'Card Type',
                                data: 'Visa Signature',
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            Expanded(
                              child: CardContainer(
                                label: 'Currency',
                                data: 'LYD',
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CardContainer(
                                label: 'Creation Date',
                                data: '2025-11-03',
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            Expanded(
                              child: CardContainer(
                                label: 'Last activation',
                                data: '2025-11-05',
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ],
                        ),                                                  
                         
                        SizedBox(height: 3.hp),
                        BlocListener<SettingsSheetBloc, SettingsSheetState>(
                          listener: (context, state) {
                            if (state is ShowSettingsDialog) {
                              showModalBottomSheet(
                                context: context,
                                builder: (_) => const BottomSheets(),
                              );
                            }
                          },
                          child: InkWell(
                            onTap: () {
                              context.read<SettingsSheetBloc>().add(
                                OpenSettingsPressed(),
                              );
                            },
                            child: Container(
                              height: 5.hp,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(1.wp),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.settings,
                                          color: theme.colorScheme.background,),
                                          SizedBox(width: 0.5.wp,),    
                                          CustomeText(
                                            text: 'Card settings',
                                            themeStyle: theme.textTheme.titleMedium,
                                            size: theme.textTheme.titleSmall!.fontSize,
                                            color: Colors.white,
                                            //size: 14,
                                          ),                                                                                
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        
                        ),
                        SizedBox(height: 1.hp),
                        Container(
                          decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1.wp),
                                    border: Border.all(
                                      color: theme.colorScheme.primary,
                                      width: 0.1.wp,
                                    ),
                                  ),
                          child: ListTile(
                            leading: Icon(Icons.description,
                            color: theme.colorScheme.primary,
                            size: 2.5.wp,),
                             
                            title: CustomeText(
                              text: 'View Card Statement',
                              color: theme.colorScheme.primary,
                              themeStyle: theme.textTheme.titleMedium,
                              size:theme.textTheme.titleSmall!.fontSize, 
                              //size: 12
                            ),

                            trailing: IconButton(
                            icon: Icon(Icons.arrow_forward_ios,),
                            onPressed: (){context.pushRoute(CardStatementRoute());},
                            color: theme.colorScheme.primary),
                            
                          ),
                        ),
                        SizedBox(height: 3.hp,)

                        //  Row(                   
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,       
                        //    children: [
                        //      Expanded(
                        //        child: InkWell(
                        //         onTap: () {
                        //           context.pushRoute(CardStatementRoute());
                        //         },
                        //         child: Container(
                        //           decoration: BoxDecoration(
                        //             color: theme.colorScheme.background,
                        //             borderRadius: BorderRadius.circular(1.wp),
                        //             border: Border.all(
                        //               color: theme.colorScheme.primary,
                        //               width: 0.1.wp,
                        //             ),
                        //           ),
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: [
                        //               Padding(
                        //                 padding: const EdgeInsets.all(8.0),
                        //                 child: Column(
                        //                   children: [
                        //                     // SvgPicture.asset(
                        //                     //   'assets/svg/financeBook.svg',
                        //                     //   width: 7.wp,
                        //                     //   height: 7.hp,
                        //                     // ),
                        //                     Icon(Icons.description,
                        //                     size: 2.wp,
                        //                     color: theme.colorScheme.primary,),
                        //                     CustomeText(
                        //                       text: 'View card statement',
                        //                       themeStyle: theme.textTheme.titleMedium,
                        //                       color: theme.colorScheme.primary,
                        //                       size:theme.textTheme.titleSmall!.fontSize, 
                        //                       //size: 12
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //      ),
                        //      SizedBox(width: 1.wp),
                        //      Expanded(
                        //        child: InkWell(
                        //         onTap: () {
                        //           context.pushRoute(CardStatementRoute());
                        //         },
                        //         child: Container(
                        //           decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(1.wp),
                        //             border: Border.all(
                        //               color: theme.colorScheme.primary,
                        //               width: 0.1.wp,
                        //             ),
                        //           ),
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: [
                        //               Padding(
                        //                 padding: const EdgeInsets.all(8.0),
                        //                 child: Column(
                        //                   children: [
                        //                     // SvgPicture.asset(
                        //                     //   'assets/svg/financeBook.svg',
                        //                     //   width: 7.wp,
                        //                     //   height: 7.hp,
                        //                     // ),
                        //                     Icon(Icons.settings
                        //                     ,size: 2.wp,
                        //                     color: theme.colorScheme.primary,),
                        //                     CustomeText(
                        //                       text: 'Card settings',
                        //                       color: theme.colorScheme.primary,
                        //                       themeStyle: theme.textTheme.titleMedium,
                        //                       size:theme.textTheme.titleSmall!.fontSize, 
                        //                       //size: 12
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //                                ),
                        //      ),
                        //    ],
                        //  ),

                       
                       
                      
                        // SizedBox(height: 2.hp,),
                        // ListView.builder(
                        //   shrinkWrap: true,
                        //     physics: NeverScrollableScrollPhysics(),
                        //     itemCount: (cardSettingsList.length / 2).ceil(),
                        //     itemBuilder: (context, index){
                        //     final firstIndex = index * 2;
                        //     final secondIndex = firstIndex + 1;

                        //     final firstItem = cardSettingsList[firstIndex];
                        //     final secondItem = secondIndex < cardSettingsList.length
                        //         ? cardSettingsList[secondIndex]
                        //         : null;
                        //    return Column(
                        //      children: [
                        //        Row(
                        //         children: [
                        //           Expanded(
                        //             child: InkWell(
                        //               onTap: firstItem.onTap,
                        //               child: SettingsContainer(
                        //                 icon: firstItem.icon,
                        //                 derscription: firstItem.label,
                        //               ),
                        //             ),
                        //           ),
                               
                        //           SizedBox(width: 10),
                               
                        //           Expanded(
                        //             child: secondItem != null
                        //                 ? InkWell(
                        //                     onTap: secondItem.onTap,
                        //                     child: SettingsContainer(
                        //                       icon: secondItem.icon,
                        //                       derscription: secondItem.label,
                        //                     ),
                        //                   )
                        //                 : SizedBox(), // if odd number of items
                        //           ),
                        //         ],
                        //       ),
                        //       SizedBox(
                        //         height: 1.hp,
                        //       )
                        //      ],                             
                        //    );
                        //   }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
