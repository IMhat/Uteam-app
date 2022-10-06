import 'package:app_uteam/models/models.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        margin: const EdgeInsets.only(top: 0, bottom: 30),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _ProductDetails(
              title: product.title,
              //productName: product.productName,
              productImage: product.productImage,
              description: product.description,
              points: product.points,
              // createAt: product.createAt
            ),
          ],
        ),
      ),
    );
  }

  // BoxDecoration _cardBorders() => BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(25),
  //         boxShadow: [
  //           BoxShadow(
  //               color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
  //         ]);
}

class _ProductDetails extends StatefulWidget {
  final String? title;
  final String? productImage;
  final String? description;
  final String? points;

  // final String? createAt;

  const _ProductDetails({
    this.title,
    this.productImage,
    this.description,
    this.points,
    // this.createAt
  });

  @override
  State<_ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<_ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 150,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[850]!.withOpacity(0.29),
              offset: const Offset(-10, 10),
              blurRadius: 10,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey,
            width: 90,
            height: 90,
            child: Image.network(
                // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnFpzAock9OwEq9Jt3m1mfDR7CLAF73Q1GYJnUJUk&s.jpg"
                widget.productImage.toString()),
          ),
          Column(
            children: [
              Text(
                widget.title.toString(),
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Icon(Icons.person),
              const Text("Uteam"),
              Container(
                child: const MyButtonCanje(),
              )
            ],
          ),

          Text(
            widget.points.toString(),
            style: const TextStyle(
                fontSize: 15, color: Colors.blue, fontWeight: FontWeight.bold),
          ),

          // Text(
          //   widget.createAt.toString(),
          //   style: const TextStyle(fontSize: 15, color: Colors.white),
          // ),
        ],
      ),
    );
  }
}

class MyButtonCanje extends StatelessWidget {
  const MyButtonCanje({super.key});

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.pushNamed(
          context,
          '',
        );
      },
      // The custom button
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          gradient: const LinearGradient(begin: AlignmentDirectional.topEnd, colors: [
            Color.fromARGB(255, 242, 133, 157),
            Color.fromARGB(255, 167, 79, 211)
          ]),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Text(
          'Canjear',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
