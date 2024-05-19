part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoadingState extends ProductsState {}

final class ProductsLoadedState extends ProductsState {
  final List<Products> products;

  ProductsLoadedState({required this.products});
}


final class ProductsErrorState extends ProductsState {}
