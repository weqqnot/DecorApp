import 'dart:async';

import 'package:flutter/material.dart';

class AutoImageSlider extends StatefulWidget {
  final Function(int index) onTap;
  const AutoImageSlider({super.key, required this.onTap});

  @override
  State<AutoImageSlider> createState() => _AutoImageSliderState();
}

class _AutoImageSliderState extends State<AutoImageSlider> {
  final PageController _controller = PageController();
  final List<String> _image = [
    'assets/images/sale_off.png',
    'assets/images/sale_off.png',
    'assets/images/sale_off.png',
  ];

  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < _image.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _controller.animateToPage(_currentPage,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
    _controller.addListener(() {
      final page = _controller.page?.round() ?? 0;
      if (page != _currentPage) {
        setState(() {
          _currentPage = page;
        });
      }
    });
  }
  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 140,
          width: MediaQuery.of(context).size.width - 30,
          child: PageView.builder(
            controller: _controller,
            itemCount: _image.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (widget.onTap != null) {
                    widget.onTap!(index);
                  }
                },
                child: Image.asset(
                  _image[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_image.length, (index) {
            return GestureDetector(
                onTap: () {
              _controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: _currentPage == index ? 12 : 8,
            height: 8,
            decoration: BoxDecoration(
            color: _currentPage == index ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.circular(4),
            ),
            ),
            );}),
        ),
      ],
    );
  }
}
