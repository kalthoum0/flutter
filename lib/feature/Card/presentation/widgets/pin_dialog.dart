import 'package:flutter/material.dart';
import 'package:flutter_application_2/feature/Card/presentation/bloc/freeze_card_bloc.dart';
import 'package:flutter_application_2/feature/widgets/custom_textff.dart';
import 'package:flutter_application_2/feature/widgets/custome_samll_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screentasia/screentasia.dart';

class PinDialog extends StatelessWidget {
  final String lable;
  final bool twoTextFrames;
  final String description1;
  final String? description2;
  // final TextEditingController pinController1;
  // final TextEditingController? pinController2;

  const PinDialog({
    required this.lable,
    required this.description1,
    this.description2,
    required this.twoTextFrames,
    // required this.pinController1,
    // this.pinController2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocListener<FreezeCardBlocBloc, FreezeCardBlocState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is ConfirmFreeze){
          
        }
      },
      child: AlertDialog(
        backgroundColor: theme.colorScheme.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomeText(
              text: lable,
              themeStyle: theme.textTheme.titleMedium,
              color: theme.colorScheme.primary,
            ),

            SizedBox(height: 2.hp),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomeText(
                  text: description1,
                  themeStyle: theme.textTheme.titleMedium,
                  color: theme.textTheme.titleMedium!.color?.withOpacity(0.7),
                ),
              ],
            ),

            Customtextfeild(
              height: 0.1.hp,
              // controller: pinController1,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.done,
              color: theme.colorScheme.shadow.withOpacity(0.3),
            ),

            if (twoTextFrames) ...[
              Column(
                children: [
                  SizedBox(height: 1.hp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomeText(
                        text: description2!,
                        themeStyle: theme.textTheme.titleMedium,
                        color: theme.textTheme.titleMedium!.color?.withOpacity(
                          0.7,
                        ),
                      ),
                    ],
                  ),
                  Customtextfeild(
                    // controller: pinController2!,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.done,
                    color: theme.colorScheme.shadow.withOpacity(0.3),
                  ),
                ],
              ),
            ],
            SizedBox(height: 2.hp),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: theme.colorScheme.primary, // border color
                    width: 0.1.wp,
                  ),
                ),
                child: CustomeText(
                  text: "متابعة",
                  color: theme.colorScheme.primary,
                  themeStyle: theme.textTheme.titleMedium,
                ),
              ),
            ),
            SizedBox(height: 1.hp),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: theme.colorScheme.error, // border color
                    width: 0.1.wp,
                  ),
                ),
                child: CustomeText(
                  text: 'الغاء',
                  color: theme.colorScheme.error,
                  themeStyle: theme.textTheme.titleMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
