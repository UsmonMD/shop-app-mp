import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/logic/blocs/product_bloc/products_bloc.dart';
import 'package:shop_app/logic/blocs/tab_index/tab_index_bloc.dart';
import 'package:shop_app/logic/api/api_repository.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  // static final apiRepository = ApiRepository();

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments;
    final String title = arg is String ? arg : 'Error';
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsBloc(apiRepository: ApiRepository())
            ..add(ProductsLoadEvent()),
        ),
        BlocProvider(
          create: (context) => TabIndexBloc()..add(TabIndexNewIndexEvent(0)),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 20,
          leading: const SizedBox(),
          bottom: AppBar(
            title: Text(title),
            centerTitle: true,
          ),
        ),
        body: const ProductListBody(),
      ),
    );
  }
}

class ProductListBody extends StatelessWidget {
  const ProductListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 13, left: 16),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: TabBarItems(),
          ),
          GridItems(),
        ],
      ),
    );
  }
}

class GridItems extends StatelessWidget {
  const GridItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoadingState) {
          return const Center(
            child: CupertinoActivityIndicator(
              animating: true,
            ),
          );
        }
        if (state is ProductsErrorState) {
          return const Center(
            child: Text('Error fetching data'),
          );
        }
        if (state is ProductsLoadedState) {
          return Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.only(
                top: 16,
                right: 16,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 250,
              ),
              itemBuilder: (context, i) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Image.network(
                            '${state.products[i].image}',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '${state.products[i].title}',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: state.products.length,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class TabBarItems extends StatelessWidget {
  const TabBarItems({super.key});
  static List<String> tags = [
    'men\'s clothing',
    'jewelery',
    'electronics',
    'women\'s clothing',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabIndexBloc, TabIndexState>(
      builder: (context, state) {
        if (state is TabChangeIndexState) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  context.read<TabIndexBloc>().add(TabIndexNewIndexEvent(i));
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: state.index == i ? Colors.blue : Colors.white,
                  ),
                  alignment: Alignment.center,
                  width: 110,
                  child: Text(
                    tags[i],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: state.index == i ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (__, _) => const SizedBox(width: 8),
            itemCount: 4,
          );
        }
        return const SizedBox();
      },
    );
  }
}
