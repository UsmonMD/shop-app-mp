import 'package:shop_app/logic/api/api.dart';
import 'package:shop_app/logic/models/products.dart';

class ApiRepository {
  Future<List<Products>> getAllProducts() => Api.getProducts();
  
}
