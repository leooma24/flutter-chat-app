import 'package:chat/widgets/boton_azul.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/label.dart';
import 'package:chat/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * .9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyLogo(titulo: 'Messenger',),
                _Form(),
                MyLabels(ruta: 'register',),
                Text('Términos y condiciones de uso', style: TextStyle(fontWeight: FontWeight.w200),),
                SizedBox( height: 1 )
              ]
            ),
          ),
        ),
      ) 
    );
  }
}

class _Form extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
         children: <Widget> [
           CustomInput(
             icon: Icons.mail_outline,
             placeholder: 'Correo',
             keyboardType: TextInputType.emailAddress,
             textController: emailCtrl,
           ),
           CustomInput(
             icon: Icons.lock_outline,
             placeholder: 'Contraseña',             
             textController: passwordCtrl,
             isPassword: true,
           ),
           BotonAzul(
             text: 'Ingrese',
             onPressed: () {
               print(emailCtrl.text);
               print(passwordCtrl.text);
             },
           )
           
         ]
       )
    );
  }
}


