import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController controller = TextEditingController();
  List<Bird> selectedBirds = [];
  List<Bird> allBirds = [
    Bird(
        name: "Chestnut-headed Bee-eater",
        image:
            "https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcSwfSNy-jDW8YEt2Gs1c4jTuPLji3ORUBlQKt864EmVpqesvJgxQXyjmJQ6CKANWm52Kn-9h39-SguZu4U"),
    Bird(
        name: "Eurasian Hoopoe",
        image:
            "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcRPkaOdtXoLECnC1KDjYP7rpFvzhYPmdiNnEnnO9aOn94T-acieG6F9rdw9HaIB45JpJoRblDEzw-jEbUA"),
    Bird(
        name: "Changeable Hawk-eagle",
        image:
            "https://cdn.download.ams.birds.cornell.edu/api/v1/asset/145284511/1800"),
    Bird(
        name: "Brahminy Starling",
        image:
            "https://cdn.download.ams.birds.cornell.edu/api/v1/asset/133728841/1800"),
    Bird(
        name: "Blue-tailed Bee-eater",
        image:
            "https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcQfqpMSf_pQS1N8-tAQFiikl1Tjf0INmP4tHiMVoi8rssRSmjDvFrAf2nUMszzLTfNvNwRmBDFDd0GCuqQ"),
    Bird(
        name: "Indian Peafowl",
        image:
            "https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcTuga17uytePeXtHwUYGIoL34rtoLKV1nRIIc_xIQaMJidyMyvHo6TMOhtXdIEKfKW2MnjrPevQtxtSowc"),
    Bird(
        name: "Common Kingfisher",
        image:
            "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcRBVg2F98UeEqwZheXO0zbN6zyPgkzxqTMJbDtEriIVzZGYSfh7c2BGiNmydhjmWHWYJJBKFooK1pRmh7o"),
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(searchListener);
  }

  @override
  void dispose() {
    controller.removeListener(searchListener);
    controller.dispose();
    super.dispose();
  }

  void searchListener() {
    search(controller.text);
  }

  void search(String query) {
    if (query.isEmpty) {
      setState(() {
        selectedBirds = allBirds;
      });
    } else {
      setState(() {
        selectedBirds = allBirds
            .where((e) => e.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          hintText: "Search",
          controller: controller,
          padding: const MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 15),
          ),
          leading: const Icon(Icons.search),
          trailing: const [Icon(Icons.mic)],
        ),
      ),
      body: ListView.builder(
        itemCount:
            selectedBirds.isEmpty ? allBirds.length : selectedBirds.length,
        itemBuilder: (BuildContext context, int index) {
          final Bird item =
              selectedBirds.isEmpty ? allBirds[index] : selectedBirds[index];

          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: item.image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    item.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Bird {
  final String name;
  final String image;

  Bird({required this.name, required this.image});
}
