import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final List<String> _categories = ['TRABALHO', 'ESTUDOS', 'CASA'];
  int _category = 0;

  void _selectForward() {
    setState(() {
      _category++;
    });
  }

  void _selectBackward() {
    setState(() {
      _category--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: _category > 0 ? _selectBackward : null,
            icon: Icon(
              Icons.arrow_back_ios,
              color: _category > 0
                  ? Colors.white
                  : Color.fromARGB(66, 255, 255, 255),
            )),
        SizedBox(
          width: 120,
          child: Text(
            _categories[_category].toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w300,
                letterSpacing: 1.2),
          ),
        ),
        IconButton(
            onPressed:
                _category < _categories.length - 1 ? _selectForward : null,
            icon: Icon(
              Icons.arrow_forward_ios,
              color: _category < _categories.length - 1
                  ? Colors.white
                  : Color.fromARGB(66, 255, 255, 255),
            ))
      ],
    );
  }
}
