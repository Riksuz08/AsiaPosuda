import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

class MyReviews extends StatefulWidget {
  const MyReviews({super.key});

  @override
  State<MyReviews> createState() => _MyReviewsState();
}

class _MyReviewsState extends State<MyReviews> {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.grey.shade50,
        backgroundColor: Colors.white,
        title:  Text(context.tr('my_reviews'), style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal),),
      ),
      body:Center(
        child: Text("Здесь пусто",style: TextStyle(fontSize: 18,color: Colors.grey[600],fontWeight: FontWeight.bold),),
      ),

  );
}
