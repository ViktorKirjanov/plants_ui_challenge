import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _items = List.generate(
    50,
    (index) => {'id': index, 'title': 'Item $index'},
  );

  final ScrollController _scrollController = ScrollController();

  double _offset = 0.0;

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {
        _offset = _scrollController.offset;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Container(
                height: 200.0,
                color: Colors.greenAccent,
              ),
              MasonryGridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _items.length + 1,
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 32.0,
                ),
                crossAxisCount: 2,
                mainAxisSpacing: 32.0,
                crossAxisSpacing: 32.0,
                itemBuilder: (context, index) => index == 0
                    ? Container(
                        height: 100,
                        color: Colors.red,
                        child: const Center(
                          child: Text(
                            'Found \n11 Results',
                            style: TextStyle(
                              fontSize: 32.0,
                            ),
                          ),
                        ),
                      )
                    : ItemCard(
                        item: _items[index - 1],
                        index: index,
                        offset: _offset,
                      ),
              ),
            ],
          ),
        ),
      );
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.item,
    required this.index,
    required this.offset,
  });

  final Map<String, dynamic> item;
  final int index;
  final double offset;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final currentBottomPosition = height + offset;
    const delta = 100.0;

    const double foundHeight = 100;

    final indexInColumn = index ~/ 2;
    // late double startPosition;
    late double endPosition;

    if (index % 2 != 0) {
      // startPosition = indexInColumn * (300.0 + 32.0) + delta;
      endPosition = (indexInColumn + 1) * (300.0 + 32.0) - 32.0 + delta;
    } else {
      if (index == 0) {
        // startPosition = 0;
        endPosition = foundHeight;
      } else {
        // startPosition = indexInColumn * (300.0 + 32.0) - x + delta;
        endPosition = (indexInColumn + 1) * (300.0 + 32.0) - 32.0 - foundHeight + delta;
      }
    }

    double topPaddingValue = 1 - (endPosition - currentBottomPosition - foundHeight + delta) / 300;
    double opacityValue = 1 - (endPosition - currentBottomPosition - 50 + delta) / 300;
    if (topPaddingValue < 0) topPaddingValue = 0;
    if (topPaddingValue > 1) topPaddingValue = 1.0;

    if (opacityValue < 0.0) opacityValue = 0.0;
    if (opacityValue > 1.0) opacityValue = 1.0;

    return Padding(
      padding: EdgeInsets.only(top: 100 * (1 - topPaddingValue)),
      child: Opacity(
        opacity: opacityValue,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            key: ValueKey(item['id']),
            height: 300,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text('topPaddingValue : ${topPaddingValue.toStringAsFixed(2)}'),
                // Text('offset: ${offset.toStringAsFixed(2)}'),
                // Text('position: ${currentBottomPosition.toStringAsFixed(2)}'),
                // Text('start position: ${startPosition.toStringAsFixed(2)}'),
                // Text('end position: ${endPosition.toStringAsFixed(2)}'),
                Image.asset('assets/images/lucky-jade-plant.jpg'),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: SizedBox(
                    height: 72.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lucky Jade Plant anfanf ajnsf kanfkj nafnk',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              r'$12.99',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 14.0,
                              ),
                            ),
                            Icon(
                              CupertinoIcons.heart_circle_fill,
                              size: 30.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
