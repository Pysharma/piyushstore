import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../product/product_module.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Product>> futureProducts;
  bool isSortedAscending = true;

  void initState() {
    super.initState();
    futureProducts = fetchProducts();
  }

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<Product> products = jsonResponse.map((product) => Product.fromJson(product)).toList();
      products.sort((a, b) => a.price.compareTo(b.price));
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  void sortProducts() {
    setState(() {
      isSortedAscending = !isSortedAscending;
      futureProducts = futureProducts.then((products) {
        products.sort((a, b) => isSortedAscending ? a.price.compareTo(b.price) : b.price.compareTo(a.price));
        return products;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('piyush store'),
        centerTitle: true,

        backgroundColor: Colors.teal,
        actions: [
          IconButton(onPressed: sortProducts,
              icon: Icon(Icons.sort_rounded),color: Colors.white),
        ],
      ),

      body: Center(
        child: FutureBuilder<List<Product>>(
          future: futureProducts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Product>? products = snapshot.data;
              return ListView.builder(
                itemCount: products?.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Image.network(products![index].image, height: 50, width: 50),
                      title: Text(products[index].title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price: \$${products[index].price}'),
                          Text('Category: ${products[index].category}'),
                          Text('Description: ${products[index].description}'),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
