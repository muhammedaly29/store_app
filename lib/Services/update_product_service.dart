import 'package:store_app/Helper/api.dart';
import 'package:store_app/Models/product_and_rating_model.dart';

class UpdateProduct {
  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
    required int id,
  }) async {
    print('Product id = $id');
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id', // Assuming update by ID
      body: {
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "category": category,
      },
      token: '',
    );
    return ProductModel.fromJson(data);
  }
}
