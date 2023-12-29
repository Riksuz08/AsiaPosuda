import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

import 'package:sample_bloc_mobile/src/data/models/products/products_data.dart';
import 'package:sample_bloc_mobile/src/data/source/choice_chip.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/favorites/bookmark_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/orders/orders_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/products/product_carousel_slider.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/services/http_service.dart';
import '../../bloc/main/main_bloc.dart';
import '../main/favoritePage/FavoriteProductsPage.dart';
import 'components/product_card.dart';

class ProductDetails extends StatefulWidget {
  final ProductItem product;

  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}


class _ProductDetailsState extends State<ProductDetails> {

  final PagingController<int, ProductItem> _pagingController =
  PagingController(firstPageKey: 1);
  bool isVisible = false;
  late List<Map<String, dynamic>> dropdownItems = [];
  Map<String, dynamic> selectedDropdownValues = {};

  void getItemDropDownMenu() {
    for (final item in widget.product.attributes) {
      // Assuming item.name is the name of the option and item.options is the list of options
      final Map<String, dynamic> dropdownItem = {
        'name': item.name,
        'options': item.options.toList(),
      };
      dropdownItems.add(dropdownItem);
    }
    print(dropdownItems.toString());
  }

  @override
  void initState() {
    super.initState();
    getItemDropDownMenu();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }
  Future<void> _launchURLInBrowser() async {
    final url = Uri.parse(widget.product.permalink);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print('Could not launch $url');
    }
  }

  void toggleFavorite() {
    setState(() {
      final isFavorite = FavoriteProductsPage.favoriteProducts.contains(
          widget.product);

      if (isFavorite) {
        FavoriteProductsPage.favoriteProducts.remove(widget.product);
      } else {
        FavoriteProductsPage.favoriteProducts.add(widget.product);
      }
    });
    isVisible = true;
  }

  void toggleOrder() {
    setState(() {
      final isInCart = FavoritesPage.orderProducts.contains(widget.product);

      if (isInCart) {
        final existingProduct =
        FavoritesPage.orderProducts.firstWhere((p) =>
        p.id == widget.product.id);
        existingProduct.quantity = existingProduct.quantity + _count;
      } else {
        widget.product.quantity = _count;
        FavoritesPage.orderProducts.add(widget.product);
      }
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final products = await HttpService().fetchProductsOfSubCategories(
        widget.product.categories.last,
        pageKey,
      );

      _pagingController.appendLastPage(products);
    } on (Error, ) catch (e) {
      _pagingController.error = e;
    }
  }

  int _count = 1;

  @override
  Widget build(BuildContext context) {
    String? inStock;
    if (widget.product.stockstatus.toString() == 'instock') {
      inStock = 'Есть в наличии';
    } else {
      inStock = 'Нет в наличии';
    }
    double generateRandomRating() {
      final random = widget.product.id;

      final lastDigit = random % 10;
      final double rating = (lastDigit / 10 + 4).toDouble();
      return rating;
    }

    return Scaffold(

      body: Stack(
        children: [
          SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    ProductCarouselSlider(product: widget.product),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.product.name,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 6),
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                        SizedBox(width: 6),
                        Text(generateRandomRating().toString(),
                            style: TextStyle(fontSize: 14)),
                        SizedBox(width: 20),
                        Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.topRight,
                          child: Text(
                            inStock,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: widget.product.stockstatus.toString() ==
                                  'instock' ?
                              Color(0xFF79B531) : Colors.red,
                            ),
                          ),
                        ),

                      ],
                    ),
                    Row(
                      children: [

                        const Text('Категории:  ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),),
                        Expanded(child: Text(
                          widget.product.categoriesName.join(', '),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),

                        ),)
                      ],
                    ),
                    SizedBox(height: 5,),
                    Container(

                      height: 1,
                      padding: const EdgeInsets.symmetric(horizontal: 10,),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      color: Colors.grey.shade300,
                    ),


                    SizedBox(height: 6,),
                    Visibility(
                      visible: widget.product.shortdescription.isNotEmpty
                          ? true
                          : false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Краткое описание товара: ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Container(

                            alignment: Alignment.centerLeft,
                            child: Html(
                              data: widget.product.shortdescription,
                              style: {
                                'ul': Style(
                                  fontSize: FontSize(12),
                                  fontWeight: FontWeight.normal,
                                ),
                                'p': Style(
                                  fontSize: FontSize(12),
                                  fontWeight: FontWeight.normal,
                                ),
                                'div': Style(
                                  fontSize: FontSize(12),
                                  fontWeight: FontWeight.normal,
                                ),
                              },
                            ),
                          ),
                        ],
                      ),),

                    Visibility(
                      visible: widget.product.description.isNotEmpty
                          ? true
                          : false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Описание товара: ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Container(

                            alignment: Alignment.centerLeft,
                            child: Html(
                              data: widget.product.description,
                              style: {
                                'ul': Style(
                                  fontSize: FontSize(12),
                                  fontWeight: FontWeight.normal,
                                ),
                                'p': Style(
                                  fontSize: FontSize(12),
                                  fontWeight: FontWeight.normal,
                                ),
                                'div': Style(
                                  fontSize: FontSize(12),
                                  fontWeight: FontWeight.normal,
                                ),
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (final dropdownItem in dropdownItems)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8),
                                // Adjust the left padding as needed
                                child: Text(dropdownItem['name'] ?? ''),
                              ),
                              Wrap(
                                spacing: 8,
                                children: [
                                  for (final option in dropdownItem['options'])
                                    TChoiceChip(
                                      text: option.toString(),
                                      selected: selectedDropdownValues[dropdownItem['name']] ==
                                          option,
                                      onSelected: (value) {
                                        setState(() {
                                          selectedDropdownValues[dropdownItem['name']] =
                                              option;
                                        });
                                      },
                                    ),
                                ],
                              ),
                            ],
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 5,),
                        Image.asset('assets/png/asia_noText.png', width: 30,height: 30,),
                        MaterialButton(
                          onPressed: _launchURLInBrowser,
                          child: Text('Открыть на сайте',style: TextStyle(color: Color(
                              0xFF79B531)),),
                          textColor: Colors.black,
                          padding: const EdgeInsets.all(5.0),
                        ),
                      ],
                    ),
                    
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF79B531),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      child: Column(
                        children: [
                          Text("Доставка",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Image(image:NetworkImage('https://asiaposuda.uz/wp-content/uploads/2021/08/delivery.webp'),width: 100,height: 100,),
                              SizedBox(width: 10,),
                              Expanded(child:Column(
                                children: [
                                  Text('Доставка по всему Ташкенту  30000 сум. \n Доставка по региону по договоренности с клиентом ',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),)


                            ],

                          ),

                        ],
                      )
                    ),
                    SizedBox(height: 10,),

                    Container(
                      height: 1,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      color: Colors.grey.shade300,
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      padding: const EdgeInsets.all(5),
                      child: const Text('Похожие товары',style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400,fontSize: 18),),
                    ),
                    SafeArea(
                      child: PagedGridView<int, ProductItem>(
                        pagingController: _pagingController,
                        shrinkWrap: true,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 250,
                          childAspectRatio: 2 / 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                        ),
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(10),
                        builderDelegate:
                        PagedChildBuilderDelegate<ProductItem>(
                          itemBuilder: (context, item, index) =>
                              ProductCard(products: item),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.transparent
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon:
                    const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      toggleFavorite();
                    },
                    icon: Icon(
                      FavoriteProductsPage.favoriteProducts.contains(
                          widget.product)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.1,
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Цена: ', style: TextStyle(fontSize: 10,color: Color(0xFF727070)),),
                  Text(widget.product.price.toString()+' '+context.tr('uzs')),
                ],
              ),

              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (_count > 1) {
                            _count--;
                          }
                        });
                      },
                      child: const Icon(Icons.remove),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        '$_count',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _count++;
                        });
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  toggleOrder();
                  showCustomSnackBar(context, 'Перейти на корзинку');
                  print(FavoritesPage.orderProducts.toString());
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  backgroundColor: Color(0xFF79B531),
                ),
                child: const Text(
                  'В корзину',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ],
          ),

        ),
      ),


    );
  }
  void navigateToHome() {
    Navigator.of(context).popUntil((route) => route.isFirst);
    context.read<MainBloc>().add(const MainEventChanged(BottomMenu.favorites));

  }
  void showCustomSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: RichText(
          text: TextSpan(
            text: message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Color(0xFF79B531),
        action: SnackBarAction(
          label: 'Go',
          textColor: Colors.white,// Change the label as needed
          onPressed: () {
            // Add the action you want to perform when the button is clicked
            // For example, you can navigate to a new screen.
           navigateToHome();
          },
        ),
      ),
    );
  }



}
