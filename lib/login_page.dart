import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screentasia/screentasia.dart';
import 'custom_button.dart';
import 'custom_textff.dart';
import 'start_up.dart';
// import 'custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  

  @override
  State<LoginPage> createState() => _MyLoginState();
}

class _MyLoginState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  bool _showpassword = false;
  bool _obsc = true;
  void _togglepass(){
    setState(() {
       _showpassword = !_showpassword;
       _obsc = !_obsc;       
    });   
  }
  //Allows me to reach the text within the text feild
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final List<String> phoneNoPrefixes = ['091','092','093','094','095'];
  final countryCode = '+218';
  @override
  void dispose() {    
    //**It is neccessary to use dispose when using controller**//
    phoneController.dispose();
    passController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Container(
      decoration: BoxDecoration(
                // The gradient property is used here
                gradient: LinearGradient(                  
                  // Define the colors for the gradient
                  colors: [
                    Theme.of(context).colorScheme.secondaryFixed,
                    Theme.of(context).colorScheme.secondaryFixedDim, 
                    Theme.of(context).colorScheme.surfaceDim,
                ],
                  // Optional: Define the start and end alignment
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),),
      child: Scaffold(
        backgroundColor: Colors.transparent,
            
       appBar:  AppBar(
                    backgroundColor: Colors.transparent ,
                    actions: [
                       IconButton(
                        onPressed: (){}, 
                        icon: Icon(Icons.help_outline),
                        color:theme.colorScheme.primary,
                        iconSize: 3.hp,),
                      IconButton(
                        onPressed: (){}, 
                        icon: Icon(Icons.language),
                        color:theme.colorScheme.primary,
                        iconSize: 3.hp,),
                      Text('AR',
                      style: TextStyle(
                        color: theme.colorScheme.primary
                        )
                      ),
                      IconButton(
                        onPressed: (){}, 
                        icon: const Icon(Icons.arrow_drop_down),
                        color:theme.colorScheme.primary,
                        iconSize: 5.hp, ),
                      
                      ],
                      leading:IconButton(
                         onPressed: (){
                          Navigator.of(context).pop(
                           MaterialPageRoute(builder: (context)=> LoginPage())
                          );
                         },
                        icon: Icon(Icons.chevron_left),
                        color:theme.colorScheme.primary,
                        iconSize: 4.hp,) ,
                  ),
    
      
      body:               
        SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(                
                children: [                        
                    
                Image.asset('assets/images/logo.png',
                  color: theme.colorScheme.primary,           
                  height: 35.hp,
                  ),
                 
              
                Container(                                                            
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.background,
                    borderRadius: BorderRadius.circular(20),),
                  padding: EdgeInsets.all(15),
                  child: Column(
                 crossAxisAlignment: CrossAxisAlignment.end,              
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [                  
                     
                      Icon(Icons.lock_rounded,
                      color:  theme.colorScheme.primary,
                      size: 20),
                       Text('رقم الهاتف',
                      style: TextStyle(fontSize: 15),),
                  
                    ],),
                    
                    SizedBox(
                      height: 2.hp,
                    ),
              
                    Customtextfeild(               
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: phoneController, 
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Phone number is required';
                      }
                      final phone = value.replaceAll(' ', '');
                      //.hasMatch(phone) → checks if the whole string matches
                      if(!RegExp(r'^\+?\d+$').hasMatch(phone)){
                         return 'Invalid Phone number';
                      }
                       if(phoneNoPrefixes.any((prefix) => phone.startsWith(prefix))){
                        if(phone.length != 10){
                           return 'Invalid Phone number';
                        }
                        return null;
                      }                        
                      else if(phone.startsWith(countryCode)){
                        if(phone.length != 13){
                           return 'Invalid Phone number';
                        }
                        return null ;
                      }
                     
                      return 'Invalid phone number';
                    },
                                                                                                                    
                                        ),
                    SizedBox(
                      height: 3.hp,
                    ),
                    Text('كلمة المرور',
                    style: TextStyle(fontSize: 15)), 
              
                    SizedBox(
                      height: 2.hp,
                    ),
              
                    Customtextfeild(                        
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.done,                      
                      controller: passController,
                      obscureText: _obsc,
                      validator: (value){
                        if(value == null || value.isEmpty)
                        {
                          return 'Password is required';
                        }
                        if(value.length < 8){
                          return 'the length of the password must atleast be 8 charecters';
                        }
                        return null;
                    
                      }, 
                      prefixIcon: IconButton(
                        icon: Icon( _showpassword? Icons.visibility: Icons.visibility_off,
                        color:theme.colorScheme.primary),
                        onPressed: _togglepass)
                    ),
                    SizedBox(
                      height: 5.hp,
                    ),
                    Center(
                      
                      child: Custombutton(
                        //this .validate will trigger each validater in a textformfield                   
                        onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(builder: (context)=> SecondP())
                              // );
                              // Input is valid
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Login successful!'))
                                );
                            }                            
                          },                    
              
                        child: Text('تسجيل الدخول', style: theme.textTheme.titleMedium!.copyWith(
                          color: theme.colorScheme.primary,
                          fontSize: 6.sp,
                          
                        ) ,
                        )
                        ),
                    )
                  ],
                              ) 
                ) 
              ],),
            ),
          ),
        )
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
       
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.          
          
          
            //for responsiveness it sizes up the element to fill the avialable space 
            // ,Expanded(
            //   //ListView needs a lot of space without using expanded it will throw an error
            //   child: ListView.builder(
            //     itemCount: notes.length,
            //     itemBuilder: (context, index) => ListTile(title: Text(notes[index]),)),        
            // ),
          
            ),
    );
  }
}
