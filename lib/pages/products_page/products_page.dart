import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:plants_ui_challenge/blocs/products_bloc/products_bloc.dart';
import 'package:plants_ui_challenge/pages/products_page/_widgets/avatar.dart';
import 'package:plants_ui_challenge/pages/products_page/_widgets/found_header.dart';
import 'package:plants_ui_challenge/pages/products_page/_widgets/loader.dart';
import 'package:plants_ui_challenge/pages/products_page/_widgets/product_card.dart';
import 'package:plants_ui_challenge/pages/products_page/_widgets/serch_textfield.dart';
import 'package:plants_ui_challenge/pages/products_page/_widgets/settings_button.dart';
import 'package:plants_ui_challenge/styles/colors.dart';
import 'package:plants_ui_challenge/widgets/keyboard_dismisser.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  static MaterialPageRoute<void> route() => MaterialPageRoute(
        builder: (_) => const ProductsPage(),
      );

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
          backgroundColor: AppColors.grey3,
          body: BlocProvider<ProductsBloc>(
            create: (context) => ProductsBloc()..add(GetProductsEvent()),
            child: const _ProductsPageView(),
          ),
        ),
      );
}

class _ProductsPageView extends StatefulWidget {
  const _ProductsPageView();

  @override
  State<_ProductsPageView> createState() => _ProductsPageViewState();
}

class _ProductsPageViewState extends State<_ProductsPageView> {
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
  Widget build(BuildContext context) => CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
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
                  onPressed: Navigator.of(context).pop,
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
            bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 80.0),
              child: BlocBuilder<ProductsBloc, ProductsState>(
                builder: (_, state) {
                  if (state is SuccessProductsState) {
                    return const Column(
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
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
          BlocBuilder<ProductsBloc, ProductsState>(
            builder: (_, state) {
              if (state is LoadingProductsState) {
                return const Loader();
              } else if (state is SuccessProductsState) {
                return SliverPadding(
                  padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 96.0),
                  sliver: SliverMasonryGrid.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 32.0,
                    mainAxisSpacing: 0.0,
                    childCount: state.products.length + 1,
                    itemBuilder: (context, index) => index == 0
                        ? FoundHeader(
                            count: state.products.length,
                          )
                        : Padding(
                            padding: const EdgeInsets.only(bottom: 32.0),
                            child: PoductCard(
                              product: state.products[index - 1],
                              index: index,
                              offset: _offset,
                            ),
                          ),
                  ),
                );
              } else {
                return const SliverFillRemaining(
                  child: SizedBox.shrink(),
                );
              }
            },
          ),
        ],
      );
}
