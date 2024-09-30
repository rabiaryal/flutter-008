import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
   Widget displaySnackBar(BuildContext context, String message){
    return SnackBar(content: Text("$message + Delete"),
    duration: const Duration(seconds: 3),
  
    );
    
   }
    void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
      
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 4,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}