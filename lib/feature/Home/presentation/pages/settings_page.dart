import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/extensions/context_extension.dart';
import 'package:flutter_application_2/core/router/router.dart';
import 'package:flutter_application_2/feature/widgets/custome_samll_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screentasia/screentasia.dart';
import '../../bloc/theme_bloc.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    
    return Center(
      child: SizedBox(
        width: context.isMobile? 100.wp: 75.wp,
        child: Scaffold(  
          appBar: AppBar(
            leading: IconButton(
              onPressed: (){
                context.back();
              },
              icon: Icon(
                Icons.arrow_back_ios),
                color: theme.colorScheme.primary,),
          ),       
           body:Padding(
             padding: EdgeInsets.all(1.wp),
             child: Column(children: [
              ListTile(
                leading: Icon(
                  Icons.light_mode,
                  color: theme.colorScheme.primary,),
                title: CustomeText(
                  text: 'System Theme',
                  themeStyle: theme.textTheme.titleMedium,) ,
                trailing: 
                BlocBuilder<ThemeBloc,ThemeState>(                  
                  builder: (context, state){
                    bool isLight = state is ThemeLight;
                    return Switch(
                    value: isLight,                     
                    onChanged: (isLight){
                      context.read<ThemeBloc>().add( ThemeToggle(themeMode: isLight ? ThemeMode.light : ThemeMode.dark));
                    }
                    );
                  }                 
                ),),
              
              Divider(
                thickness: 0.1.wp,
                color: theme.colorScheme.outline
              ),
              ListTile(         
                leading: Icon(
                  Icons.language,     
                  color: theme.colorScheme.primary),
                title: CustomeText(
                  text: 'Language',
                  themeStyle: theme.textTheme.titleMedium),
              )
                   ],),
           ),
        ),
      ),
    );
  }
}