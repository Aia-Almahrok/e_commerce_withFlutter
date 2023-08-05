import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final List<Category> categories = [
    Category('Electronics', 'https://images.ctfassets.net/86of3mjdn78g/3xe56s8QA7VBVaeaBFqxBS/a2c1364d3766de9340385d24a3ca851b/10_electronic_brands_avex_Banner.jpg?fm=webp'),
    Category('Fashion', 'https://www.appnova.com/-/media/fashion-Ecommerce.ashx?h=890&la=en&w=1280&hash=A3757E56598B15FF80C5B26F99780528C6CC264D'),
    Category('Home & Kitchen', 'https://cdn.firstcry.com/education/2023/01/13101355/Names-Of-Household-Appliances-In-English.jpg'),
    Category('SkinCare',
        'https://media.istockphoto.com/id/1292373290/photo/smiling-woman-applying-face-cream-sitting-on-bed.jpg?s=2048x2048&w=is&k=20&c=JBGiaZZjVxZR0wk12eb4bQG_VUjLP3ouLlu6qBwFGqU=')

    // Add more categories here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //backgroundColor: Colors.deepPurpleAccent,
      //),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the products page for the selected category
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsPage(category: categories[index]),
                ),
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      categories[index].imageUrl,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 8),
                    Text(
                      categories[index].name,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Category {
  final String name;
  final String imageUrl;

  Category(this.name, this.imageUrl);
}

class ProductsPage extends StatelessWidget {
  final Category category;

  ProductsPage({required this.category});

  // Dummy product data for demonstration
  List<Product> get allProducts {
    if (category.name == 'Electronics') {
      return [
        Product('Dell Labtop', 60,
            'https://www.pngall.com/wp-content/uploads/2016/05/Laptop-PNG.png','Electronics'),
        Product('iphone 13 pro max', 40,
            'https://cdn.mos.cms.futurecdn.net/HagAokvCAhtcJp8Mx9kbCc-1200-80.png.webp','Electronics'),
        Product('arduino uno', 15,
            'https://cdn.sparkfun.com/assets/9/1/e/4/8/515b4656ce395f8a38000000.png','Electronics'),
        Product('Apple airpods', 15,
            'https://www.notebookcheck.net/fileadmin/Notebooks/News/_nc3/photo_1588156979435_379b9d365296_3.jpg','Electronics'),
        Product('Lenovo labtop', 70,
            'https://www.lenovo.com/medias/?context=bWFzdGVyfHJvb3R8MzQ4MTk4fGltYWdlL3BuZ3xoOTUvaDExLzE0NjgzNTMxMTE2NTc0LmpwZ3wxMDgwNjlmYTcxYzYyNWY0ZWU1NjhjMWRhNmRlNDE4MWExM2YyZjBiNDA4NzQ3OWRjZmU2OTYxMDM0ZmMyNDY3','Electronics'),
        Product('Ultrasonic sensor', 15,
            'https://cdn.shopify.com/s/files/1/0559/1970/6265/files/What_is_Ultrasonic_Sensor_fac21db5-c2aa-4894-b7e5-05aa9a1bb468_480x480.png?v=1662815986','Electronics'),
        Product('Apple smart wath', 20,
            'https://images.naptol.com/usr/local/csp/staticContent/product_images/horizontal/750x750/Trendy-Bluetooth-Calling-Smart-Watch-1.jpg','Electronics'),
        // Add more products here
      ];


    } else if (category.name == 'Fashion') {
      return [
        Product('Blouse',20, 'https://m.media-amazon.com/images/I/412e6QcoUrL.jpg', 'Fashion'),
        Product('Suite', 100, 'https://images.squarespace-cdn.com/content/v1/5950a68720099e6f69ce32e4/1644210749710-HBNL3HS13R8PJEFDT4HN/Bottle+Green+Made+Suits+Singapore+Women%27s+Wear.jpg?format=1500w', 'Fashion'),
        Product('Black Pants', 30, 'https://imagescdn.planetfashion.in/img/app/product/7/742714-8344910.jpg?auto=format', 'Fashion'),
        Product('Beige Skirt', 40, 'https://i.etsystatic.com/37713978/r/il/47b91b/4221765059/il_794xN.4221765059_quy8.jpg', 'Fashion'),
        Product('Jeans Pants', 30, 'https://i.etsystatic.com/31614600/r/il/6501e4/4067152988/il_794xN.4067152988_9syk.jpg', 'Fashion'),
        Product('Blue Jacket', 70, 'https://i.etsystatic.com/25028455/r/il/6c9760/4674338589/il_794xN.4674338589_dq9z.jpg', 'Fashion'),
        Product('OFFWhite Jacket', 90, 'https://i.etsystatic.com/22721955/r/il/6b9d38/3686272493/il_794xN.3686272493_7ctd.jpg', 'Fashion'),
        Product('Flowery blouse', 30, 'https://i.etsystatic.com/37083944/r/il/480331/4814602199/il_794xN.4814602199_e03r.jpg', 'Fashion'),
        Product('Boots', 30, 'https://i.etsystatic.com/41479498/r/il/00ce3f/5193557491/il_794xN.5193557491_fohn.jpg', 'Fashion'),
        Product('Hand Bag', 30,
            'https://i.etsystatic.com/44044536/r/il/4f3b70/5073253023/il_794xN.5073253023_6p7o.jpg',
            'Fashion'),



      ];
    } else if (category.name == 'Home & Kitchen') {
      return [
        Product('Cooker', 300, 'https://www.zanussi.com.eg/globalassets/appliances/product-images/zcg92696xa-1200x1200.jpg?preset=medium', 'Home & Kitchen'),
        Product('Fridge', 500,
            'https://www.westinghouse.com.au/remote.jpg.ashx?urlb64=aHR0cHM6Ly9yZXNvdXJjZS5lbGVjdHJvbHV4LmNvbS5hdS9wdWJsaWMvaW1hZ2UyL3Byb2R1Y3QvMTExNTQyLzQyMDcwL1dILVByb2R1Y3Rab29tL2ZyaWRnZXNfd2hlNjA2MHNiX2dhbGxlcnlfMS5wbmc&hmac=kCoB3FIjpo4', 'Home & Kitchen'),
        Product('Microwave', 200,
            'https://btech.com/cdn-cgi/image/quality=50,format=auto/media/catalog/product/cache/44da91c951f82e3217cdcf7eae3f50b0/a/u/au_me6124st-xsa_401_front_silver.jpg', 'Home & Kitchen'),
        Product('Stand Mixer', 250,
            'https://api-rayashop.freetls.fastly.net/media/catalog/product/cache/4e49ac3a70c0b98a165f3fa6633ffee1/u/t/utgbjsd.jpg?format=webp&width=368', 'Home & Kitchen'),
        Product('Hand blinder', 150,
            'https://btech.com/cdn-cgi/image/quality=50,format=auto/media/catalog/product/cache/4709f4e5925590e2003d78a7a1e77edb/m/q/mq9185x.jpg', 'Home & Kitchen'),
        Product('Iron', 100,
            'https://m.media-amazon.com/images/I/719QyOoIoqS._AC_SX679_.jpg', 'Home & Kitchen')
      ];
        //Product('Microwave', 150, 'https://cdn.firstcry.com/education/2023/01/13101355/Names-Of-Household-Appliances-In-English.jpg', 'Home & Kitchen'),
        //Product('Cookware Set', 100, 'https://cdn.firstcry.com/education/2023/01/13101355/Names-Of-Household-Appliances-In-English.jpg', 'Home & Kitchen'),
        //Product('Microwave', 150, 'https://cdn.firstcry.com/education/2023/01/13101355/Names-Of-Household-Appliances-In-English.jpg', 'Home & Kitchen'),
        //Product('Cookware Set', 100, 'https://cdn.firstcry.com/education/2023/01/13101355/Names-Of-Household-Appliances-In-English.jpg', 'Home & Kitchen'),];
    } else {
      return [
        Product('Cleanser', 15,
            'https://cdn.salla.sa/djovA/utj3ABb8ckZBzlYcDnfFEDgB0xE8HHgX3OnPhNDU.jpg',
            'SkinCare'),
        Product('Moisterizer', 15,
            'https://static.beautytocare.com/media/catalog/product/cache/global/image/650x650/85e4522595efc69f496374d01ef2bf13/c/e/cerave-moisturizing-lotion-dry-to-very-dry-skin-236ml_1.jpg',
            'SkinCare'),
        Product('Niasinamide Serum', 35,
            'https://media.ulta.com/i/ulta/2551167?w=720&fmt=webp',
            'SkinCare'),
        Product('Hyaluronic acid serum ', 15,
            'https://media.ulta.com/i/ulta/2556945?w=720&fmt=webp',
            'SkinCare'),
        Product('Sunscreen', 30,
            'https://eg.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/12/232002/1.jpg?2804',
            'SkinCare'),
        Product('Body Splash', 15,
            'https://anwar.store/cdn/shop/products/026439470_1024x1024.jpg?v=1673888708',
            'SkinCare'),
        Product('Body Lotion', 10,
            'https://www.mynavyexchange.com/products/images/large/9503704_0.jpg',
            'SkinCare'),


      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products in ${category.name}'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: allProducts.length,
        itemBuilder: (context, index) {
          return ProductItem(product: allProducts[index]);
        },
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String imageUrl;
  final String category;

  Product(this.name, this.price, this.imageUrl, this.category);
}

class ProductItem extends StatefulWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            widget.product.imageUrl,
            height: 110,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${widget.product.price}'),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
                          onPressed: () {
                            setState(() {
                              _isFavorite = !_isFavorite;
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.add_shopping_cart),
                          onPressed: () {
                            _addToCart(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addToCart(BuildContext context) {
    // Add logic to add the product to the cart
    // For demonstration purposes, we'll show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added ${widget.product.name} to Cart'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}