import 'package:flutter/material.dart';
import 'package:flutter_008/contact/formpage.dart';

class FloatButton extends StatelessWidget {
  const FloatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
     
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FormPage()));
         
        },
        child: const Icon(Icons.add_outlined),
      ),

     
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}








// import 'package:flutter/material.dart';
// import 'package:flutter_008/contact/formpage.dart';

// class FloatButton extends StatelessWidget {
//   const FloatButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final floatingActionButtonLoaction = FloatingActionButtonLocation.endDocked;
//     return FloatingActionButton(
      
//       onPressed: () {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => FormPage()));
//       },
//       child: const Icon(Icons.add_outlined),
      
//     );
  
//   }
// }
