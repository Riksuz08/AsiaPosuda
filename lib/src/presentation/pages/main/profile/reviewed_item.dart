import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:sample_bloc_mobile/src/config/config.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/services/http_service.dart';
import '../../../../data/models/orderData/order_model.dart';
import '../../../../data/models/products/products_data.dart';
import '../../../../data/models/review/review_model.dart';

class ReviewedItemList extends StatelessWidget {
  final List<OrderModel> orderModels;
  const ReviewedItemList({Key? key, required this.orderModels})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context)
          .size
          .height, // You can adjust the height as needed
      child: ListView.builder(
        itemCount: orderModels.length,
        itemBuilder: (context, index) {
          return WidgetReviewedItem(orderModel: orderModels[index]);
        },
      ),
    );
  }
}

class WidgetReviewedItem extends StatelessWidget {
  final OrderModel orderModel;
  const WidgetReviewedItem({Key? key, required this.orderModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (LineItems lineItem in orderModel.lineItems)
            WidgetReviewedItemInner(
              lineItem: lineItem,
              orderModel: orderModel,
            ),
        ],
      ),
    );
  }
}

class WidgetReviewedItemInner extends StatelessWidget {
  final LineItems lineItem;
  final OrderModel orderModel;

  const WidgetReviewedItemInner({
    Key? key,
    required this.lineItem,
    required this.orderModel,
  }) : super(key: key);

  String formatTimestamp(String timestamp) {
    final DateTime dateTime = DateTime.parse(timestamp).toLocal();
    final String formattedDate = DateFormat('d MMMM y', 'ru').format(dateTime);
    return formattedDate;
  }

  Future<Map<String, dynamic>> getReviewInfo(
      HttpService httpService, int productId) async {
    final List<ProductReview> list =
        await httpService.getReviewOfProducts(productId);

    bool emailFound = list
        .any((review) => review.reviewerEmail == "email998900000001@gmail.com");

    String reviewEmail = emailFound
        ? list
            .firstWhere(
              (review) => review.reviewerEmail == "email998900000001@gmail.com",
            )
            .reviewerEmail
        : "";

    String reviewMessage = emailFound
        ? list
            .firstWhere(
              (review) => review.reviewerEmail == "email998900000001@gmail.com",
            )
            .review
        : "";
    String reviewStar = emailFound
        ? list
            .firstWhere(
              (review) => review.reviewerEmail == "email998900000001@gmail.com",
            )
            .rating
            .toString()
        : "";

    return {
      'emailFound': emailFound,
      'reviewEmail': reviewEmail,
      'reviewMessage': reviewMessage,
      'rating': reviewStar,
    };
  }

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<ProductItem>(
          future: fetch(lineItem.productId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ShimmerLoading();
            } else if (snapshot.hasError) {
              return Container();
            } else {
              final HttpService httpService = HttpService();

              return FutureBuilder<Map<String, dynamic>>(
                future: snapshot.data!.parent != 0
                    ? getReviewInfo(httpService, snapshot.data!.parent)
                    : getReviewInfo(httpService, lineItem.productId),
                builder: (context, reviewInfoSnapshot) {
                  if (reviewInfoSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Container();
                  } else {
                    bool emailFound = reviewInfoSnapshot.data!['emailFound'];
                    String reviewEmail =
                        reviewInfoSnapshot.data!['reviewEmail'];
                    String reviewMessage =
                        reviewInfoSnapshot.data!['reviewMessage'];
                    String reviewStar = reviewInfoSnapshot.data!['rating'];

                    return emailFound
                        ? Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 8),
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 0, color: Colors.white)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          snapshot.data!.images.first,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Html(
                                            data: lineItem.name,
                                            style: {
                                              'body': Style(
                                                fontSize: FontSize(13),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            },
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            children: List.generate(
                                              5,
                                              (index) => Icon(
                                                Icons.star,
                                                color: index <
                                                        int.parse(reviewStar)
                                                    ? Colors.amber
                                                    : Colors.grey,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 0),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 10),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            // decoration: BoxDecoration(
                                            //   color: Colors.grey.shade200,
                                            //   borderRadius: BorderRadius.circular(10),
                                            // ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.message,
                                                      color: Colors.grey,
                                                      size: 20,
                                                    ),
                                                    SizedBox(width: 10),
                                                    Expanded(
                                                      child:
                                                          Text(reviewMessage),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        : Container(); // Don't show container if email is not found
                  }
                },
              );
            }
          },
        ),
      );

  Future<ProductItem> fetch(int id) async {
    final ProductItem variableProduct =
        await HttpService().fetchProductById(id);
    return variableProduct;
  }
}

void _showBottomSheet(BuildContext context, LineItems lineItems,
    OrderModel orderModel, String image, int parent) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) => ReviewButtomSheet(
            lineItems: lineItems,
            orderModel: orderModel,
            image: image,
            parent: parent,
          ));
}

class ReviewButtomSheet extends StatefulWidget {
  final LineItems lineItems;
  final OrderModel orderModel;
  final String image;
  final int parent;
  const ReviewButtomSheet(
      {super.key,
      required this.lineItems,
      required this.orderModel,
      required this.image,
      required this.parent});

  @override
  State<ReviewButtomSheet> createState() => _ReviewButtomSheetState();
}

class _ReviewButtomSheetState extends State<ReviewButtomSheet> {
  final TextEditingController textFieldController = TextEditingController();
  double selectedRating = 0.0;
  HttpService httpService = HttpService();
  String formatTimestamp(String timestamp) {
    final DateTime dateTime = DateTime.parse(timestamp).toLocal();
    final String formattedDate = DateFormat('d MMMM y', 'ru').format(dateTime);
    print('Parent: ${widget.parent}');

    return formattedDate;
  }

  Future<void> publishReview(int productId, String review, String reviewer,
      String email, int rating) async {
    await httpService.reviewProduct(productId, review, reviewer, email, rating);
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0), // Adjust the left padding as needed
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.close),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Оставить отзыв',
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    )
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8, left: 8),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          // Set the background color to grey
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 0.5, color: Colors.grey)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Html(
                            data: widget.lineItems.name,
                            style: {
                              'body': Style(
                                fontSize: FontSize(13),
                                fontWeight: FontWeight.bold,
                              ),
                            },
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Дата заказа: ${formatTimestamp(widget.orderModel.createdAt)}',
                                style: TextStyle(
                                    color: Colors.grey.shade800, fontSize: 12),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Text(
                      'Общая оценка',
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedRating =
                                  index + 1.0; // Set the selected rating
                            });
                          },
                          child: Icon(
                            Icons.star,
                            color: index < selectedRating
                                ? Colors.amber
                                : Colors.grey,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Center(
                    child: TextField(
                      controller: textFieldController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide.none),
                        hintText: 'Введите комментарий',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      ),
                      style: TextStyle(height: 1),
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    print('Selected Rating: ${selectedRating}');
                    if (widget.parent != 0) {
                      print('Product ID: ${widget.parent}');
                      publishReview(
                          widget.parent,
                          textFieldController.text,
                          Config.nameUser.toString(),
                          Config.email,
                          int.parse(selectedRating.toStringAsFixed(0)));
                    } else {
                      print('Product ID: ${widget.lineItems.productId}');
                      publishReview(
                          widget.lineItems.productId,
                          textFieldController.text,
                          Config.nameUser.toString(),
                          Config.email,
                          int.parse(selectedRating.toStringAsFixed(0)));
                    }
                    print('Text Field Text: ${textFieldController.text}');
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        'Опубликовать',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

class ShimmerLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!, // Adjust base color
      highlightColor: Colors.grey[100]!, // Adjust highlight color
      period: Duration(milliseconds: 1000), // Adjust shimmer animation duration
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 8),
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 16,
                    color: Colors.white,
                  ),
                  SizedBox(height: 2),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 12,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
