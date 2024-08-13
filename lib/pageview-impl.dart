import 'package:flutter/material.dart';

class PageViewImpl extends StatefulWidget {
  const PageViewImpl({super.key});

  @override
  State<PageViewImpl> createState() => _PageViewImplState();
}

class _PageViewImplState extends State<PageViewImpl> {
  final List<Color> containerList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
    Colors.amber,
    Colors.indigo,
    Colors.lime,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
  ];

  late PageController _pageController;
  late ScrollController _scrollController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      if (_currentPage < containerList.length - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    } else if (_scrollController.position.pixels <=
        _scrollController.position.minScrollExtent) {
      if (_currentPage > 0) {
        _pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(_onScroll);

    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: containerList.length,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          itemBuilder: (context, index) => Container(
            color: containerList[index],
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  ...List.generate(
                    20,
                    (index) => ListTile(
                      leading: const Icon(Icons.list),
                      title: Text(
                        'List Item $index',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                      subtitle: const Text('Subtitle'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
