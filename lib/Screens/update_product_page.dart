import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/Models/product_and_rating_model.dart';
import 'package:store_app/Services/update_product_service.dart';
import 'package:store_app/Widgets/custom_button.dart';
import 'package:store_app/Widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});

  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, description, image, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Upadte Product',
                style: TextStyle(fontWeight: FontWeight.bold)),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      productName = data;
                    },
                    hintText: 'Product Name',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      description = data;
                    },
                    hintText: 'Description',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      price = data;
                    },
                    hintText: 'Price',
                    inputType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      image = data;
                    },
                    hintText: 'Image',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                      text: 'Update',
                      onTap: () async{
                        isLoading = true;
                        setState(() {});
                        try {
                         await updateProduct(product);
                          print('Success');
                        } catch (e) {
                          print(e.toString());
                          
                        }
                        isLoading = false;
                          setState(() {});
                      })
                ],
              ),
            ),
          )),
    );
  }

 Future<void> updateProduct(ProductModel product) async {
  await  UpdateProduct().updateProduct( id: product.id,
        title: productName == null ? product.title : productName !,
        price: price == null ? product.price.toString() : price!,
        description: description == null ? product.description : description !,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
