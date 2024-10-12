// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:srh360app/core/util/helper/show_snackbar.dart';
import 'package:srh360app/gen/colors.gen.dart';
import 'package:srh360app/main.dart';
import 'package:srh360app/presentation/pages/sign_in_page.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final newPasswordController = TextEditingController();
  String selectedLanguage = 'en-US';

  @override
  void dispose() {
    newPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          margin:const EdgeInsets.only(bottom: 30),
          alignment: Alignment.centerLeft,
          child: Text('Settings',style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold
          ),),),
        Expanded(
          child: Container(
            width: 100.sw,
            decoration: const BoxDecoration(
            color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
            ),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: SingleChildScrollView(
      child: Column(
      
        children: [
          const SizedBox(height: 30),
             Align(
              alignment: Alignment.centerLeft,
               child: Text('Account',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                           fontWeight: FontWeight.bold
                         ),),
            
             ),
             _buildTile(text:'Change Password',onPressed: (){
             showDialog(context: context, builder: (_) => AlertDialog(
              title: SizedBox(width: 60.sw,child:  TextField(
                controller: newPasswordController,
                decoration: const InputDecoration(
                  hintText: 'New Password'
                ),
              ),),
              actions: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                  
                }, child: const  Text("Cancel"),),
                TextButton(onPressed: () async{
                  try{
                    if(newPasswordController.text.isNotEmpty){
                         Navigator.pop(context);
                  await FirebaseAuth.instance.currentUser?.updatePassword(newPasswordController.text);
                 showSnackbar(context, description: 'Password Updated');
                 newPasswordController.clear();
                    }
                    
                  }
                  on FirebaseAuthException catch(error){
showSnackbar(context, description: error.message ?? error.toString());

                  }
                  catch(error){
showSnackbar(context, description: error.toString());
                  }
                 
                }, child: const Text("Save"),),
                
              ],
             ));
            },),
             _buildTile(text:'Log Out',onPressed: () async{
             await  FirebaseAuth.instance.signOut();
        Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignInPage(),
                                  ),
                                );
            },),
            _buildTile(text:'Delete Account',onPressed: (){
              showDialog(context: context, builder: (_) => AlertDialog(title: const Text('Are you sure you want to delete your account?'),actions: [
                TextButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: const Text('Cancel',)),
                TextButton(onPressed: () async{
                
try{
                    if(newPasswordController.text.isNotEmpty){
                         Navigator.pop(context);
                  await FirebaseAuth.instance.currentUser?.delete();

                 showSnackbar(context, description: 'Account Deleted');
                 Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignInPage(),
                                  ),
                                );
                    }
                    
                  }
                  on FirebaseAuthException catch(error){
showSnackbar(context, description: error.message ?? error.toString());

                  }
                  catch(error){
showSnackbar(context, description: error.toString());
                  }
                
              }, child: const Text('Delete',style: TextStyle(color: Colors.red),
              ))],),);
            },),
            _buildTile(text:'Language',onPressed: (){
             showDialog(context: context, builder: (_) => StatefulBuilder(
               builder: (context,setState) {
                 return AlertDialog(
                  title: const Text('Select Language'),
                  actions: [
                    TextButton(onPressed: (){
                      if(selectedLanguage == 'en-US'){

                    context.setLocale(const Locale('en','US'));
                      }else if(selectedLanguage == 'am'){
                        context.setLocale(const Locale('am'));
                      }
                      Navigator.of(context).pop();

                    }, child: const Text('Save'))
                  ],
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                  children: [
                    RadioListTile(
                      title: const Text('English'),
                      value: 'en-US', groupValue: selectedLanguage, onChanged: (l){
                      if(l != null){
                        setState((){
                        selectedLanguage = l;
                      });
                      }
                      
                    }),
                    RadioListTile(
                      title: const Text('Amharic'),
                      value: 'am', groupValue: selectedLanguage, onChanged: (l){
                      if(l != null){
                        setState((){
                        selectedLanguage = l;
                      });
                      }
                      
                    })
                  ],
                  ),
                 );
               }
             ));
            },),
            const SizedBox(height: 25),
            Align(
              alignment: Alignment.centerLeft,
               child: Text('Privacy & Security',style: Theme.of(context).textTheme.titleMedium!.copyWith(
                           fontWeight: FontWeight.bold
                         ),),
                         
            
             ),
            const SizedBox(height: 15),

               _buildTile(text:'Term & Conditions',onPressed: (){
              //
            },),
             _buildTile(text:'Privacy Policy',onPressed: (){
              //
            },),
        ],
      ),
    ),
    
          ),
        )
      ],
    );
  }
  
  _buildTile({required String text, required Function() onPressed}) {
    return InkWell(
          borderRadius: BorderRadius.circular(20),

      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding:const  EdgeInsets.only(left: 20),
        width: 100.sw,
        alignment: Alignment.centerLeft,
        height: 60,
        decoration: BoxDecoration(
        color: ColorName.secondaryColor[50],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(text,style: Theme.of(context).textTheme.titleMedium,),
      ),
    );
  }
}
