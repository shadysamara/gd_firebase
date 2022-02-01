import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gd_firebase/firestore/data/auth_helper.dart';
import 'package:gd_firebase/firestore/providers/app_provider.dart';
import 'package:gd_firebase/firestore/ui/add_product.dart';
import 'package:gd_firebase/router_helper.dart';
import 'package:provider/provider.dart';

class AllProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return Scaffold(
          floatingActionButton: Visibility(
            visible: provider.loggedUser?.isAdmin ?? false,
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                RouterHelper.routerHelper
                    .routingToSpecificWidgetWithoutPop(AddNewProduct());
              },
            ),
          ),
          appBar: AppBar(
            title: Text('All Products'),
            actions: [
              IconButton(
                  onPressed: () {
                    provider.logOut();
                  },
                  icon: Icon(Icons.logout))
            ],
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: provider.allProducts == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : provider.allProducts.isEmpty
                    ? Center(
                        child: Text('No Products Found'),
                      )
                    : ListView.builder(
                        itemCount: provider.allProducts.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            background: Container(
                              alignment: Alignment.center,
                              color: Colors.red,
                              child: Text(
                                'Delete',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            key: ObjectKey(provider.allProducts[index]),
                            onDismissed: (DismissDirection direction) {
                              provider.deleteProduct(
                                  provider.allProducts[index].id);
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(
                                    provider.allProducts[index].imageUrl),
                              ),
                              title: Text(provider.allProducts[index].name),
                              subtitle: Row(
                                children: [
                                  Text(provider.allProducts[index].description),
                                  Spacer(),
                                  Text(provider.allProducts[index].price
                                          .toString() +
                                      ' \$')
                                ],
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    provider.goToEditProduct(
                                        provider.allProducts[index]);
                                  },
                                  icon: Icon(Icons.edit)),
                            ),
                          );
                        }),
          ));
    });
  }
}
