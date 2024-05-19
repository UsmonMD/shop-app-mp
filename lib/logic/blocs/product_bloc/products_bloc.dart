import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/logic/api/api_repository.dart';
import 'package:shop_app/logic/models/products.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ApiRepository apiRepository;

  ProductsBloc({required this.apiRepository}) : super(ProductsInitial()) {
    on<ProductsLoadEvent>((event, emit) async {
      emit(ProductsLoadingState());

      try {
        final List<Products> products = await apiRepository.getAllProducts();
        
        emit(
          ProductsLoadedState(products: products),
        );
      } catch (_) {
        emit(ProductsErrorState());
      }
    });
  }
}

// .where((element) => element.category == 'men\'s clothing').toList()







// .where((element) => element.category == 'men\'s clothing')
//                 .toList()