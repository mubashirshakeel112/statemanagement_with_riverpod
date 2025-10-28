import 'package:flutter/material.dart';
import 'package:riverpod_advance/utils/helpers/global_keys.dart';

void showAppSnackBar(String message, String title, {bool isError = false}) {
  scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(
      backgroundColor: isError ? Colors.red : Colors.green,
      content: Row(
        children: [
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle
            ),
            child: Icon( isError ? Icons.highlight_remove_rounded : Icons.check, color: isError ? Colors.red : Colors.green,),
          ),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),),
              SizedBox(height: 2,),
              Text(message, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),)
            ],
          )
        ],
      ),
    ),
  );
}
