import 'package:flutter/material.dart';

 class THelperFunctions {
  Color? getColor(String value) {
    if(value=='Qizil'){
      return Colors.red;
    }else if(value=='Sariq'){
      return Colors.yellow;
    }else if(value=='Ko\'k'){
      return Colors.blue;
    }else if(value=='Jigarrang'){
      return Colors.brown;
    }else if(value=='Kulrang'){
      return Colors.grey;
    }else if(value=='Olovrang'){
      return Colors.orange;
    }else if(value=='Pushti'){
      return Colors.pinkAccent;
    }else if(value=='Yashil'){
      return Colors.green;
    }
    else if(value=='Qora'){
      return Colors.black;
    }
    else if(value=='Oq'){
      return Colors.white;
    }
    else{
      return null;
    }
  }
}