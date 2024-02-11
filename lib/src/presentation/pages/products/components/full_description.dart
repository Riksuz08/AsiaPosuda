import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

class FullDescription extends StatefulWidget {
  final String fulldesctription;
  const FullDescription({super.key, required this.fulldesctription});

  @override
  State<FullDescription> createState() => _FullDescriptionState();
}

class _FullDescriptionState extends State<FullDescription> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.grey.shade50,
        backgroundColor: Colors.white,
        title: Text(
          context.tr('aboutproduct'),
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Html(
                  data: widget.fulldesctription,
                  style: {
                    'ul': Style(
                      fontSize: FontSize(15),
                      fontWeight: FontWeight.bold,
                    ),
                    'p': Style(
                      fontSize: FontSize(15),
                      fontWeight: FontWeight.bold,
                    ),
                    'div': Style(
                      fontSize: FontSize(15),
                      fontWeight: FontWeight.bold,
                    ),
                  },
                ),
              ),
            ],
          ),
        ),
      ));
}
