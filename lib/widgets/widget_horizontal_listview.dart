import 'package:flutter/material.dart';
import 'package:vintage_in_stagram/models/product.dart';
import 'package:vintage_in_stagram/providers/home_data_provider.dart';

class HorizontalScrollView extends StatelessWidget {

  final String title;
  List<Product> sampleList = HomeDataProvider().generateMockData();

  HorizontalScrollView({ required this.title });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(bottom: 10)),
        Row(
          children: [
            const Padding(padding: EdgeInsets.only(left: 10)),
            HashtagTitle(title: title),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.21,
          child: ListView.separated(
            padding: const EdgeInsets.all(10),
            scrollDirection: Axis.horizontal,
            itemCount: sampleList.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductBox(information: sampleList[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Padding(padding: EdgeInsets.all(10));
            },
          ),
        ),
        const Divider(thickness: 1),
      ],
    );
  }
}

class HashtagTitle extends StatelessWidget {
  final String title;

  const HashtagTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
    );
  }
}

class ProductBox extends StatelessWidget {
  final Product information;

  ProductBox({ required this.information });

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          information.imageURL,
          width: 100,
        ),
        SizedBox(
          width: 100,
          child: Text(information.name),
        )
      ],
    );
  }
}