import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:sample_bloc_mobile/src/core/services/http_service.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../data/models/notification/notification_data.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  HttpService httpService = HttpService();
  List<NotificationModel> notifications = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getNotifications();
  }

  String getTime(int unixTimestamp) {
    // Convert Unix timestamp to DateTime
    final DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);

    // Format the date as "dd MMMM yyyy"
    final String formattedDate =
        "${dateTime.day} ${_getMonthName(dateTime.month)} ${dateTime.year}";
    return formattedDate;
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return "Январь";
      case 2:
        return "Февраль";
      case 3:
        return "Март";
      case 4:
        return "Апрель";
      case 5:
        return "Май";
      case 6:
        return "Июнь";
      case 7:
        return "Июль";
      case 8:
        return "Август";
      case 9:
        return "Сентябрь";
      case 10:
        return "Октябрь";
      case 11:
        return "Ноябрь";
      case 12:
        return "Декабрь";
      default:
        return "";
    }
  }

  Future<void> getNotifications() async {
    final List<NotificationModel> updatedNotifications =
        await httpService.getAllNotifications();
    setState(() {
      notifications = updatedNotifications;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          shadowColor: Colors.grey.shade50,
          backgroundColor: Colors.white,
          title: Text(
            context.tr('notifications'),
            style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
          ),
        ),
        body: isLoading
            ? shimmerEffect()
            : (notifications.isEmpty
                ? Center(
                    child: Text(
                      context.tr('notificempty'),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )
                : ListView.builder(
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      final notification = notifications[index];
                      return Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.15,
                                child: const Icon(
                                  Icons.notifications,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.85,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      getTime(notification.completedAt),
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey.shade700,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      notification.headings,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(notification.contents)
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            height: 0.5,
                            color: Colors.grey.shade400,
                          )
                        ],
                      );
                    },
                  )),
      );

  Widget shimmerEffect() {
    return ListView.builder(
      itemCount: 15, // You can adjust the number of shimmer items
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListTile(
            title: Container(
              height: 16,
              color: Colors.white,
            ),
            subtitle: Container(
              height: 12,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
