import 'package:flutter/material.dart';
import 'package:gd_firebase/firestore/models/product_model.dart';
import 'package:gd_firebase/firestore/providers/app_provider.dart';
import 'package:gd_firebase/firestore/ui/widgets/custom_button.dart';
import 'package:gd_firebase/firestore/ui/widgets/custom_testfield.dart';
import 'package:provider/provider.dart';

class AddNewProduct extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('New Product Screen'),
      ),
      body: Consumer<AppProvider>(builder: (context, provider, x) {
        return Container(
            margin: EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () {
                      provider.pickNewImage();
                    },
                    child: provider.file == null
                        ? CircleAvatar(
                            radius: 90,
                          )
                        : CircleAvatar(
                            radius: 90,
                            backgroundImage: FileImage(provider.file)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextfield(
                    controller: nameController,
                    label: 'Name',
                  ),
                  CustomTextfield(
                    controller: descriptionController,
                    label: 'Description',
                  ),
                  CustomTextfield(
                    controller: priceController,
                    textInputType: TextInputType.number,
                    label: 'Price',
                  ),
                  CustomButton(
                    title: 'Add Product',
                    function: () {
                      Product product = Product(
                          name: nameController.text,
                          description: descriptionController.text,
                          price: num.parse(priceController.text));
                      provider.addProduct(product);
                    },
                  )
                ],
              ),
            ));
      }),
    );
  }
}
