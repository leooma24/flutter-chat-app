import 'package:chat/helpers/mostrar_alerta.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/widgets/boton_azul.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/label.dart';
import 'package:chat/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {  

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
                MyLogo(titulo: 'Registro',),
                _Form(),
                MyLabels(ruta: 'login',),
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
  final nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>( context );
    return Container(
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
         children: <Widget> [
           CustomInput(
             icon: Icons.perm_identity,
             placeholder: 'Nombre',             
             textController: nameCtrl,
           ),
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
             onPressed: authService.autenticando ? null : () async {
               FocusScope.of(context).unfocus(); 
               final registerOk = await authService.register(
                 nameCtrl.text.trim(),
                 emailCtrl.text.trim(), 
                 passwordCtrl.text.trim()); 
                if( registerOk == true )  {
                  Navigator.pushReplacementNamed(context, 'usuarios');
                }  else {
                  mostrarAlerta(context, 'Registro incorrecto', registerOk);
                }          
             },
           )
           
         ]
       )
    );
  }
}


