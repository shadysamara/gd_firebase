import 'package:flutter/material.dart';
import 'package:gd_firebase/firestore/providers/app_provider.dart';
import 'package:provider/provider.dart';

class AllProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('All Products'),
      ),
      body: Consumer<AppProvider>(builder: (context, provider, x) {
        return Container(
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
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                provider.allProducts[index].imageUrl),
                          ),
                          title: Text(provider.allProducts[index].name),
                          subtitle:
                              Text(provider.allProducts[index].description),
                          trailing: Text(
                              provider.allProducts[index].price.toString()),
                        );
                      }),
        );
      }),
    );
  }
}
