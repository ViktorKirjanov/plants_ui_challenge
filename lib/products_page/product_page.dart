import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:plants_ui_challenge/products_page/_widgets/avatar.dart';
import 'package:plants_ui_challenge/products_page/_widgets/found_header.dart';
import 'package:plants_ui_challenge/products_page/_widgets/product_card.dart';
import 'package:plants_ui_challenge/products_page/_widgets/serch_textfield.dart';
import 'package:plants_ui_challenge/products_page/_widgets/settings_button.dart';
import 'package:plants_ui_challenge/styles/colors.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<Map<String, dynamic>> _items = List.generate(
    50,
    (index) => {'id': index, 'title': 'Item $index'},
  );

  final ScrollController _scrollController = ScrollController();

  double _offset = 0.0;
  double _avatarValue = 1.0;
  double _maxAppbarSize = 0.0;
  bool _isMax = false;

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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.grey3,
        body: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              elevation: 0.0,
              shadowColor: AppColors.grey1,
              surfaceTintColor: AppColors.grey3,
              backgroundColor: AppColors.grey3,
              expandedHeight: kToolbarHeight + 80,
              floating: true,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final currentHeight = constraints.biggest.height;
                  if (!_isMax) {
                    _maxAppbarSize = currentHeight;
                    _isMax = true;
                  }

                  _avatarValue = 1.0 - (_maxAppbarSize - currentHeight) / 45.0;
                  if (_avatarValue < 0.0) _avatarValue = 0.0;
                  if (_avatarValue > 1.0) _avatarValue = 1.0;
                  return const SizedBox.shrink();
                },
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: () {},
                  ),
                  const Text(
                    'Search Products',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Avatar(avatarValue: _avatarValue),
                ],
              ),
              bottom: const PreferredSize(
                preferredSize: Size(double.infinity, 80.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: SearchTextField(),
                          ),
                          SizedBox(width: 16.0),
                          SettingButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 96.0),
              sliver: SliverMasonryGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 32.0,
                mainAxisSpacing: 0.0,
                childCount: _items.length + 1,
                itemBuilder: (context, index) => index == 0
                    ? const FouneHeader()
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 32.0),
                        child: PoductCard(
                          item: _items[index - 1],
                          index: index,
                          offset: _offset,
                        ),
                      ),
              ),
            ),
          ],
        ),
      );
}
