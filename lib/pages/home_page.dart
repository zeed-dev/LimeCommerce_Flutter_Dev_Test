import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mini_apps/common/enum_state.dart';
import 'package:mini_apps/common/style.dart';
import 'package:mini_apps/extensions/ext.dart';
import 'package:mini_apps/models/dumy_category.dart';
import 'package:mini_apps/viewModel/category_view_model.dart';
import 'package:mini_apps/viewModel/product_view_model.dart';
import 'package:mini_apps/widgets/category_widget.dart';
import 'package:mini_apps/widgets/product_card_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  int _limit = 10;

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() {
    _getProducts(_limit);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getProducts(_limit += 10);
      }
    });
  }

  _getProducts(int limit) {
    Future.microtask(() => Provider.of<ProductViewModel>(context, listen: false)
        .getProduct(limit: limit, skip: 10));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: _buildLoadMoreProgress(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          _buildTitle(),
          _buildCategories(),
          _buildProduct(),
        ],
      ),
    );
  }

  Widget _buildLoadMoreProgress() {
    return Consumer<ProductViewModel>(
      builder: (context, state, _) {
        return Visibility(
          visible: state.isLoading,
          child: const CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildProduct() {
    return Consumer<ProductViewModel>(
      builder: (context, state, _) {
        if (state.state == RequestState.loading) {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state.state == RequestState.loaded) {
          return Expanded(
            child: GridView.count(
              controller: _scrollController,
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              childAspectRatio: ProductCard.itemWidth / ProductCard.itemHeight,
              mainAxisSpacing: 16,
              crossAxisSpacing: 10,
              padding: paddingOnly(left: 24.0, right: 24.0),
              children: List.generate(state.products.length, (index) {
                return ProductCard(product: state.products[index]);
              }),
            ),
          );
        }

        if (state.state == RequestState.error) {
          return Expanded(
            child: Center(
              child: Text(
                state.errMsg,
                style: kSubtitle.copyWith(
                  color: Colors.red,
                  fontSize: 14,
                ),
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }

  Widget _buildCategories() {
    return Consumer<CategoriesViewModel>(
      builder: (context, state, _) {
        return Container(
          height: 44,
          margin: const EdgeInsets.only(bottom: 20),
          width: double.infinity,
          child: ListView.builder(
            itemCount: mockData.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              final categopry = mockData[index];
              return CategoriesWidget(
                categopry: categopry,
                isActive: state.selectedIndex == index,
                index: index,
                onTap: () {
                  state.selectedIndexChange = index;
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: paddingOnly(
        left: 24.0,
        right: 24.0,
        top: 12.0,
        bottom: 20.0,
      ),
      child: Text(
        "We think you might enjoy these specially selected products",
        style: kHeading6.copyWith(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: bgColor,
      elevation: 0,
      centerTitle: false,
      leading: Icon(
        Icons.location_on,
        color: kgrey,
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: kgrey,
          ),
          onPressed: () => log('Search'),
        ),
      ],
      title: Text(
        "Café Jack",
        style: kSubtitle.copyWith(
          color: kgrey,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
