// Flutter imports:
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.hintText,
    required this.onChanged
  }) : super(key: key);

  final String hintText;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 13, bottom: 5),
      child: SizedBox(
        height: 40,
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 3,
          child: TextFormField(
            autocorrect: false,
            onChanged: onChanged,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 5, right: 5),
              prefixIcon: const Icon(
                Icons.search,
                size: 15,
                color: Color(0xFFD9D9D9),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                height: 1.4,
                color: Color(0xFFD9D9D9),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
