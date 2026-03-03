import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/extensions/context_extension.dart';
import 'package:flutter_application_2/feature/Card/presentation/bloc/date_picker_bloc.dart';
import 'package:flutter_application_2/feature/Card/presentation/bloc/filter_button_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screentasia/screentasia.dart';

import '../../../widgets/custom_textff.dart';
import '../../../widgets/custome_samll_text.dart';

@RoutePage()
class CardStatement extends StatefulWidget {
  const CardStatement({super.key});

  @override
  State<CardStatement> createState() => _CardStatementState();
}

class _CardStatementState extends State<CardStatement> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextEditingController dateControllerfrom = TextEditingController();
    TextEditingController dateControllerto = TextEditingController();

    DateTimeRange daterangs = DateTimeRange(
      start: DateTime(2010,1,1), 
      end: DateTime(2100,1,1)
    );

    final List<String> filterButtonList = [
      'Registered',
      'Registered',
      'Registered',
    ];

    return Center(
      child: SizedBox(
        width: context.isMobile ? 100.wp : 75.wp,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                context.back();
              },
              icon: Icon(Icons.arrow_back_ios),
              color: theme.colorScheme.primary,
            ),
          ),

          body: Padding(
            padding: EdgeInsets.all(1.wp),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomeText(
                      text: 'Chose your account',
                      themeStyle: theme.textTheme.titleMedium,
                      color: theme.textTheme.titleSmall!.color!.withOpacity(
                        0.5,
                      ),
                      size: theme.textTheme.titleSmall!.fontSize,
                    ),
                  ],
                ),
                SizedBox(height: 1.hp),
                DropdownMenu(
                  menuStyle: MenuStyle(
                    minimumSize: MaterialStateProperty.all(const Size(250, 40)),
                    maximumSize: MaterialStateProperty.all(
                      const Size(250, double.infinity),
                    ), // 250 is width

                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          16,
                        ), // Adjust radius as needed
                      ),
                    ),
                  ),
                  width: double.infinity,
                  textStyle: TextStyle(
                    fontWeight: theme.textTheme.titleMedium!.fontWeight,
                    fontSize: 12,
                    color: theme.textTheme.titleSmall!.color!.withOpacity(0.5),
                  ),
                  trailingIcon: Icon(
                    Icons.arrow_drop_down,
                    color: theme.textTheme.bodyMedium!.color!.withOpacity(
                      0.4,
                    ), // Set your custom color here
                  ),
                  selectedTrailingIcon: Icon(
                    Icons.arrow_drop_up,
                    color: theme.colorScheme.primary,
                  ),
                  inputDecorationTheme: InputDecorationTheme(
                    filled: true,
                    fillColor: theme.colorScheme.shadow.withOpacity(0.15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  enableFilter: true,
                  dropdownMenuEntries: <DropdownMenuEntry<String>>[
                    DropdownMenuEntry(
                      value: 'Medit 01',
                      label: 'Medit 01',
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                          TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    DropdownMenuEntry(
                      value: 'Medit 02',
                      label: 'Medit 02',
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                          TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    DropdownMenuEntry(
                      value: 'Medit 03',
                      label: 'Medit 03',
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                          TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.hp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomeText(
                      text: 'Chose a date range',
                      themeStyle: theme.textTheme.titleMedium,
                      color: theme.textTheme.titleSmall!.color!.withOpacity(
                        0.5,
                      ),
                      size: theme.textTheme.titleSmall!.fontSize,
                    ),
                  ],
                ),
                SizedBox(height: 2.hp),
                BlocConsumer<DatePickerBloc, DatePickerState>(
                  listener: (context, state) {
                    // TODO: implement listener
                    if (state.range != null) {
                      dateControllerfrom.text = state.range!.start.toString().split(" ")[0];
                      dateControllerto.text = state.range!.end.toString().split(" ")[0];
                    }
                  },
                  builder: (context, state) {
                    return Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomeText(
                              text: 'from:',
                              themeStyle: theme.textTheme.titleMedium,
                              color: theme.textTheme.titleSmall!.color!
                                  .withOpacity(0.5),
                              size: theme.textTheme.titleSmall!.fontSize,
                            ),
                             Customtextfeild(
                              controller: dateControllerfrom,
                              keyboardType: TextInputType.datetime,
                              textInputAction: TextInputAction.done,
                              color: theme.colorScheme.shadow.withOpacity(
                                0.15,
                              ),
                              prefixIcon: Icon(
                                Icons.calendar_month_outlined,
                                color: theme.colorScheme.primary,
                              ),
                              ontap: () async {
                                final DateTimeRange? picked = await showDateRangePicker(
                                  context: context,
                                  firstDate: DateTime(2022),
                                  lastDate: DateTime.now(),
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: theme.colorScheme.primary, // SmartBank Blue
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );
                                if (picked != null) {
                                  context.read<DatePickerBloc>().add(SelectRange(picked));
                                }
                              }
                            )                          
                          ],
                        ),
                      ),
                      SizedBox(width: 1.wp),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomeText(
                              text: 'to:',
                              themeStyle: theme.textTheme.titleMedium,
                              color: theme.textTheme.titleSmall!.color!
                                  .withOpacity(0.5),
                              size: theme.textTheme.titleSmall!.fontSize,
                            ),
                           Customtextfeild(
                              controller: dateControllerto,
                              keyboardType: TextInputType.datetime,
                              textInputAction: TextInputAction.done,
                              color: theme.colorScheme.shadow.withOpacity(
                                0.15,
                              ),
                              prefixIcon: Icon(
                                Icons.calendar_month_outlined,
                                color: theme.colorScheme.primary,
                              ),
                              ontap: () async {
                                final DateTimeRange? picked = await showDateRangePicker(
                                  context: context,
                                  firstDate: DateTime(2022),
                                  lastDate: DateTime.now(),
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: theme.colorScheme.primary, // SmartBank Blue
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );  
                                if (picked != null) {
                                  context.read<DatePickerBloc>().add(SelectRange(picked));                                  
                                }                              
                              },
                            )                                                        
                          ],
                        ),
                      ),
                    ],
                  );
                  },
                ),
                SizedBox(height: 1.hp),
                InkWell(
                  onTap: () {},
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
                            child: CustomeText(
                              text: 'Display card statement',
                              themeStyle: theme.textTheme.bodyMedium,
                              size: theme.textTheme.titleSmall!.fontSize,
                              color: Colors.white,
                              //size: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 2.hp),
                Divider(thickness: 0.1.wp, color: theme.colorScheme.outline),
                SizedBox(height: 2.hp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomeText(
                      text: 'Quick filterring',
                      themeStyle: theme.textTheme.titleMedium,
                      color: theme.textTheme.titleSmall!.color!.withOpacity(
                        0.8,
                      ),
                      size: theme.textTheme.titleSmall!.fontSize,
                    ),
                  ],
                ),
                SizedBox(height: 1.hp),

                Row(
                  children: List.generate(3, (index) {
                    return BlocBuilder<FilterButtonBloc, FilterButtonState>(
                      builder: (context, state) {
                        bool isSelected = state.selectedIndex == index;
                        final Color bgColor = isSelected
                            ? theme.colorScheme.primary
                            : theme.colorScheme.shadow.withOpacity(0.2);
                        final Color brdr = isSelected
                            ? theme.colorScheme.primary
                            : theme.colorScheme.shadow.withOpacity(0.3);
                        final Color textColor = isSelected
                            ? theme.colorScheme.background
                            : theme.colorScheme.primary;
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.5.wp),
                          child: InkWell(
                            onTap: () {
                              context.read<FilterButtonBloc>().add(
                                ChangeColor(index),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.wp),
                                border: Border.all(color: brdr, width: 0.1.wp),
                                color: bgColor,
                              ),
                              child: Padding(
                                padding:  EdgeInsets.all(0.5.wp),
                                child: CustomeText(
                                  text: filterButtonList[index],
                                  color: textColor,
                                  themeStyle: theme.textTheme.titleMedium,
                                  size: 12,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),

                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
