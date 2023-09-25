import 'package:flutter/material.dart';


class DialogUtils{

  static void showLoadingDialog(BuildContext context,
      String message){
    showDialog(context: context,
        builder: (buildContext){
          return AlertDialog(
            content: Row(
              children: [
                const CircularProgressIndicator(),
                const SizedBox(width: 12,),
                Text(message)
              ],
            ),
          );
        },barrierDismissible: false
    );
  }
  static void hideDialog(BuildContext context){
    Navigator.pop(context);
  }
  static void showMessage(BuildContext context,
      String message, {
        String? postActionName,
        VoidCallback? posAction,
        String? negActionName,
        VoidCallback? negAction,
        bool dismissible = true
      }){
    List<Widget> actions = [];
    if(postActionName!=null){
      actions.add(TextButton(onPressed: (){
        Navigator.pop(context);
        posAction?.call();
      },
          child: Text(postActionName,style: const TextStyle(
              fontSize: 20
          ),)));
    }
    if(negActionName!=null){
      actions.add(TextButton(onPressed: (){
        Navigator.pop(context);
        negAction?.call();
      },
          child: Text(negActionName,style: const TextStyle(
              fontSize: 20
          ),)));
    }

    showDialog(context: context,
        builder: (buildContext){
          return AlertDialog(
              content: Text(message,style: const TextStyle(
                color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 22
              ),),
              actions: actions
          );
        },
        barrierDismissible: dismissible
    );
  }
}