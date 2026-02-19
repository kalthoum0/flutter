import 'package:flutter/material.dart';
import 'package:flutter_application_2/feature/Card/presentation/widgets/freeze_unfreeze_dialog.dart';
import 'package:flutter_application_2/feature/Card/presentation/widgets/pin_dialog.dart';
import 'package:flutter_application_2/feature/widgets/custome_samll_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screentasia/screentasia.dart';
import '../../data/Mapper/card_settings_class.dart';
import '../../domain/entities/card_dialog_type.dart' show CardDialogType;
import '../bloc/freeze_card_bloc.dart';

class BottomSheets extends StatelessWidget {
  const BottomSheets({super.key});
  
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    final List<CardSettings> cardSettingsList = [
      CardSettings(
        icon: Icons.lock,
        label: 'Freeze card',
        onTap: () {
         context.read<FreezeCardBlocBloc>().add(OpenFreezeDialog(type: CardDialogType.freeze));
        },
      ),
      CardSettings(icon: Icons.lock_open, label: 'Unfreeze card', onTap: () {
        context.read<FreezeCardBlocBloc>().add(OpenFreezeDialog(type: CardDialogType.Unfreeze));
      }),
      CardSettings(icon: Icons.key, label: 'Set PIN', onTap: () {
        context.read<FreezeCardBlocBloc>().add(OpenFreezeDialog(type: CardDialogType.setPin));
      }),
      CardSettings(icon: Icons.edit, label: 'Reset PIN', onTap: () {
        context.read<FreezeCardBlocBloc>().add(OpenFreezeDialog(type: CardDialogType.resetPin));
      }),
      CardSettings(icon: Icons.password, label: 'Card Number', onTap: () {}),
      CardSettings(
        icon: Icons.description,
        label: 'View card statement',
        onTap: () {},
      ),
    ];

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
      child: Container(
        width: 75.wp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.wp),
          color: Theme.of(context).colorScheme.background,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CustomeText(
                  text: 'Card Settings',
                  themeStyle: theme.textTheme.titleMedium,
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: cardSettingsList.length,
                itemBuilder: (context, index) {
                  final item = cardSettingsList[index];
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                         item.onTap();
                        },
                        child: ListTile(
                          leading: Icon(
                            item.icon,
                            color: theme.colorScheme.primary,
                          ),
                          title: CustomeText(
                            text: item.label,
                            themeStyle: theme.textTheme.bodyMedium,
                          ),
                        ),
                      ),

                      if(item.label =='Card Number')...[
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 1.wp),
                          child: Divider(
                            thickness: 0.1.wp,
                            color: theme.colorScheme.outline,
                          ),
                        )
                      ]
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
