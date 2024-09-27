import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });

  final String name;
  final String price;
  final String image;
  final String description;

  static const String id = "ProductPage";

  @override
  State createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: isLandscape ? _buildLandscapeLayout() : _buildPortraitLayout(),
        ),
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProductImage(),
        const SizedBox(height: 16),
        _buildProductName(),
        const SizedBox(height: 8),
        _buildProductPrice(),
        const SizedBox(height: 16),
        _buildProductDescription(),
        const SizedBox(height: 24),
        _buildAddToCartButton(double.infinity),
      ],
    );
  }

  Widget _buildLandscapeLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: _buildProductImage(),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductName(),
              const SizedBox(height: 8),
              _buildProductPrice(),
              const SizedBox(height: 16),
              _buildProductDescription(),
              const SizedBox(height: 24),
              _buildAddToCartButton(200),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProductImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        widget.image,
        height: 300,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildProductName() {
    return Text(
      widget.name,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildProductPrice() {
    return Text(
      'Price: \$${widget.price}',
      style: const TextStyle(
        fontSize: 20,
        color: Colors.teal,
      ),
    );
  }

  Widget _buildProductDescription() {
    return Text(
      widget.description,
      style: const TextStyle(
        fontSize: 16,
        height: 1.5,
      ),
    );
  }

  Widget _buildAddToCartButton(double width) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: () {
          // Add to cart action
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Add to Cart',
          style: TextStyle(
            fontSize: 18,
            color: Colors.teal,
          ),
        ),
      ),
    );
  }
}