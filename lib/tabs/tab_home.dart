import 'package:flutter/material.dart';
import 'package:vintage_in_stagram/widgets/widget_horizontal_listview.dart';

class HomeTab extends StatelessWidget {
  final List<String> titleList =
      List.of(["#오프라인_매장", "#온라인_매장", "#바시티", "#나이키"]);

  HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        HorizontalScrollView(title: titleList[0]),
        HorizontalScrollView(title: titleList[1]),
        HorizontalScrollView(title: titleList[2]),
        HorizontalScrollView(title: titleList[3]),
      ]),
    );
  }
}