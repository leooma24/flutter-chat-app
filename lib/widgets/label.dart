import 'package:flutter/material.dart';

class MyLabels extends StatelessWidget {
  final String ruta;

  const MyLabels({
    Key key, 
    @required this.ruta
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(this.ruta == 'register' ? '¿No tienes cuenta?' : '¿Tienes una cuenta?', style: TextStyle( color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300 ),),
          SizedBox( height: 10 ),
          GestureDetector(
            child: Text(this.ruta == 'register' ? 'Crear una ahora!' : 'Entra ahora!', style: TextStyle( color: Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold ),),
            onTap: () {
              Navigator.pushReplacementNamed(context, this.ruta);
            },
          ),

        ],
      ),
    );
  }
}