import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

class MyChats extends StatefulWidget {
  const MyChats({super.key});

  @override
  State<MyChats> createState() => _MyChatsState();
}

class _MyChatsState extends State<MyChats> {
  ImageProvider logo = AssetImage("assets/png/asia.png");
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.grey.shade50,
        backgroundColor: Colors.white,
        title:  Text(context.tr('my_chats'), style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 18),),
      ),
      body:Column(
        children: [
          GestureDetector(
            onTap: (){
              shooModalBottomSheetCustom();
            },
            child: Container(
              height: 80,
              color: Colors.white,
              child: Row(
                children: [
                  Image(image: logo),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Поддержка Asia Posuda',style: TextStyle(fontWeight: FontWeight.bold),),
                        Text('Свяжитесь с нами удобным \n для вас способом')
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(color: Colors.grey.shade200,),
          )
        ],
      )

  );
  void shooModalBottomSheetCustom(){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context)=> Container(
          decoration:  BoxDecoration(

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          height: MediaQuery.of(context).size.height*0.32,
          width: MediaQuery.of(context).size.width,
          // color:Colors.white,
          child: Column(

            children: [
              SizedBox(height: 20,),
              Text('Связатся с нами',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              SizedBox(height: 20,),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset('assets/png/telegram.png',width: 50,height: 50,),
                      Text('Telegram')
                    ],
                  ),
                  SizedBox(width: 40,),
                  Column(
                    children: [
                      SizedBox(height: 5),
                      Image.asset('assets/png/phone.png',width: 40,height: 40,),
                      SizedBox(height: 5),
                      Text('Телефон')
                    ],
                  )
                ],
              ),
              SizedBox(height: 20,),
             GestureDetector(
               onTap: (){Navigator.pop(context);},
               child:  Text('Отменить'),
             )

            ],
          ),
        )
    );
  }
}
