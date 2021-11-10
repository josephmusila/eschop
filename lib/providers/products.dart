import 'package:flutter/material.dart';
import 'package:shop/providers/productsModel.dart';

class ProvideProducts with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Coca Cola Can',
      description: 'Quench your thirst.',
      price: 75.00,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRy55L_QGNmNX7_-5-uKFZbxSJxaEpz3CF_8w&usqp=CAU',
    ),
    Product(
      id: 'p6',
      title: 'Fanta 500ml',
      description: 'Quench your thirst',
      price: 50.00,
      imageUrl:
          'https://res.cloudinary.com/dyc0ieeyu/image/upload/c_fit/v1/products/fanta-orange-500ml.jpg',
    ),
    Product(
      id: 'p7',
      title: 'Vegies',
      description: 'Fresh from the Farm',
      price: 30.21,
      imageUrl:
          'https://thumbs.dreamstime.com/z/set-fresh-vegetables-fruits-bright-beautiful-backgroun-set-fresh-vegetables-fruits-bright-beautiful-background-115738555.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Bikes',
      description: 'go wherever you want',
      price: 790.99,
      imageUrl:
          'https://thumbs.dreamstime.com/z/retro-bicycles-bikes-29277055.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Bikes',
      description: 'go wherever you want',
      price: 790.99,
      imageUrl:
          'https://thumbs.dreamstime.com/z/retro-bicycles-bikes-29277055.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Bikes',
      description: 'go wherever you want',
      price: 790.99,
      imageUrl:
          'https://thumbs.dreamstime.com/z/retro-bicycles-bikes-29277055.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Bikes',
      description: 'go wherever you want',
      price: 790.99,
      imageUrl:
          'https://thumbs.dreamstime.com/z/retro-bicycles-bikes-29277055.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Bikes',
      description: 'go wherever you want',
      price: 790.99,
      imageUrl:
          'https://thumbs.dreamstime.com/z/retro-bicycles-bikes-29277055.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Bikes',
      description: 'go wherever you want',
      price: 790.99,
      imageUrl:
          'https://thumbs.dreamstime.com/z/retro-bicycles-bikes-29277055.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Bikes',
      description: 'go wherever you want',
      price: 790.99,
      imageUrl:
          'https://thumbs.dreamstime.com/z/retro-bicycles-bikes-29277055.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Bikes',
      description: 'go wherever you want',
      price: 790.99,
      imageUrl:
          'https://thumbs.dreamstime.com/z/retro-bicycles-bikes-29277055.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Bikes',
      description: 'go wherever you want',
      price: 790.99,
      imageUrl:
          'https://thumbs.dreamstime.com/z/retro-bicycles-bikes-29277055.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Bikes',
      description: 'go wherever you want',
      price: 790.99,
      imageUrl:
          'https://thumbs.dreamstime.com/z/retro-bicycles-bikes-29277055.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Bikes',
      description: 'go wherever you want',
      price: 790.99,
      imageUrl:
          'https://thumbs.dreamstime.com/z/retro-bicycles-bikes-29277055.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Bikes',
      description: 'go wherever you want',
      price: 790.99,
      imageUrl:
          'https://thumbs.dreamstime.com/z/retro-bicycles-bikes-29277055.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Bikes',
      description: 'go wherever you want',
      price: 790.99,
      imageUrl:
          'https://thumbs.dreamstime.com/z/retro-bicycles-bikes-29277055.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Bikes',
      description: 'go wherever you want',
      price: 790.99,
      imageUrl:
          'https://thumbs.dreamstime.com/z/retro-bicycles-bikes-29277055.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Bikes',
      description: 'go wherever you want',
      price: 790.99,
      imageUrl:
          'https://thumbs.dreamstime.com/z/retro-bicycles-bikes-29277055.jpg',
    ),
    Product(
      id: 'p9',
      title: 'Beef',
      description: 'No preservatives added',
      price: 48.10,
      imageUrl: 'https://thumbs.dreamstime.com/z/raw-meat-17630391.jpg',
    ),
  ];

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavourite).toList();
  }

  //var showFavouritesOnly = false;

  List<Product> get items {
    /* if (showFavouritesOnly) {
      return _items.where((element) => element.isFavourite).toList();
    }*/
    return [..._items];
  }

  /*
  void showFavouritesMyOnly() {
    showFavouritesOnly = true;
    notifyListeners();
  }

  void showAll() {
    showFavouritesOnly = false;
    notifyListeners();
  }*/
  void addProduct(Product product) {
    final newProduct = Product(
        id: DateTime.now().toString(),
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl);
    _items.add(newProduct);
    //_items.insert(0,newproduct); //at the start of the list
    notifyListeners();
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((element) => element.id == id);
    if (prodIndex > 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print("..........");
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
