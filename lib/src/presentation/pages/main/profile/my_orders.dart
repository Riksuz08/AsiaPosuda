import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
    initialIndex: 1,
    length: 2,
    child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.grey.shade50,
        elevation: 0,
        backgroundColor: Colors.white,
        title:  Text(context.tr('my_orders'), style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal),),
        bottom: const TabBar(
          tabs: <Widget>[
            Tab(
              text: 'Активные',
            ),
            Tab(
             text: 'Все',
            ),

          ],
        ),
      ),
      body:  TabBarView(
        children: <Widget>[
          Center(
            child: Text("Здесь пусто",style: TextStyle(fontSize: 18,color: Colors.grey[600],fontWeight: FontWeight.bold),),
          ),
          Center(
            child: Text("Здесь пусто",style: TextStyle(fontSize: 18,color: Colors.grey[600],fontWeight: FontWeight.bold),),
          ),

        ],
      ),
    )
  );

}
