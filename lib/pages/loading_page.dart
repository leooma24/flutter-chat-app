import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat/services/auth_service.dart';

class LoadingPage extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: ( context, snapshot) {          
          return Center(
            child: Text('Espere...')
          );
        }
      ),
    );
  }

  Future checkLoginState( BuildContext context ) async {
    final authService = Provider.of<AuthService>(context, listen: false );    
    final autentificado = await authService.isLoggedIn();
    if(autentificado) {
      Navigator.pushReplacementNamed(context, 'usuarios');
    } else {
      Navigator.pushReplacementNamed(context, 'login');
    }
    
  }
}