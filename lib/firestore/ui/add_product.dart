import 'package:flutter/material.dart';
import 'package:gd_firebase/firestore/models/product_model.dart';
import 'package:gd_firebase/firestore/providers/app_provider.dart';
import 'package:gd_firebase/firestore/ui/widgets/custom_button.dart';
import 'package:gd_firebase/firestore/ui/widgets/custom_testfield.dart';
import 'package:provider/provider.dart';

class AddNewProduct extends StatelessWidget {
  bool isForEdit;
  String productId;
  AddNewProduct({this.isForEdit = false, this.productId});
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
                        ? provider.imageUrl == null
                            ? CircleAvatar(
                                radius: 90,
                              )
                            : CircleAvatar(
                                radius: 90,
                                backgroundImage:
                                    NetworkImage(provider.imageUrl))
                        : CircleAvatar(
                            radius: 90,
                            backgroundImage: FileImage(provider.file)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextfield(
                    controller: provider.nameController,
                    label: 'Name',
                  ),
                  CustomTextfield(
                    controller: provider.descriptionController,
                    label: 'Description',
                  ),
                  CustomTextfield(
                    controller: provider.priceController,
                    textInputType: TextInputType.number,
                    label: 'Price',
                  ),
                  isForEdit
                      ? CustomButton(
                          title: 'Edit Product',
                          function: () {
                            provider.editProduct(this.productId);
                          },
                        )
                      : CustomButton(
                          title: 'Add Product',
                          function: () {
                            provider.addProduct();
                          },
                        )
                ],
              ),
            ));
      }),
    );
  }
}
