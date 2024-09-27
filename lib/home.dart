import 'package:elegant_essence_test/product.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final String id = "HomePage";
  final Function toggleTheme;

  const HomePage({Key? key, required this.toggleTheme}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildPortraitLayout()
              : _buildLandscapeLayout();
        },
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Image(
            image: AssetImage("images/freestocks-_3Q3tsJ01nc-unsplash.jpg"),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "Featured Products",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Text(
            "Summer Collection 2024 With New Designs",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          ItemCard(
            name: "Luxe Stella Dress",
            title: "5990.00",
            image: "images/fp2.jpg",
          ),
          ItemCard(
            name: "Flower Printed Maxi Dress",
            title: "5990.00",
            image: "images/fp4.jpg",
          ),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Image(
            image: AssetImage("images/freestocks-_3Q3tsJ01nc-unsplash.jpg"),
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "Featured Products",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Text(
            "Summer Collection 2024 With New Designs",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ItemCard(
                  name: "Luxe Stella Dress",
                  title: "5990.00",
                  image: "images/fp2.jpg",
                ),
              ),
              Expanded(
                child: ItemCard(
                  name: "Flower Printed Maxi Dress",
                  title: "5990.00",
                  image: "images/fp4.jpg",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String name;
  final String title;
  final String image;

  const ItemCard({
    Key? key,
    required this.name,
    // required this.name,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            // Product image
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Product details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Price: $title",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductPage(
                            name: name,
                            price: title,
                            image: image,
                            description: 'This dress is a graceful, ankle-length sleeveless design, featuring a belted waist and button-up front. Made from a lightweight fabric with a subtle striped pattern, the dress offers a breezy, flowing silhouette, perfect for a summer day. The fitted bodice contrasts with the flared skirt, creating an elegant yet relaxed look. Ideal for both casual outings and special occasions, its versatile style is enhanced by delicate detailing that complements a variety of accessories. The dress is seen here paired with a natural, barefoot look, embodying a carefree, nature-inspired aesthetic.',
                          ),
                        ),
                      );
                    },
                    child: Text('View More'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}