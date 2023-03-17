
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget implements PreferredSizeWidget {

  final double height;
  
  SearchBar({ required this.height });

  @override
  State<StatefulWidget> createState() => _SearchBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextField(
        focusNode: _focusNode,
        controller: _controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: '#해시태그_검색',
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Search hashtag and show the list
            },
          ),
          border: const UnderlineInputBorder(),
        ),
      ),
    );
  }
}