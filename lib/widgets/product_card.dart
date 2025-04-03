import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../models/product_model.dart';
import '../shared/icons.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal,
      child: InkWell( 
        onTap: () {
          GoRouter.of(context).push('/product/${product.id}');
        },
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 245, 245, 245),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Image.network(product.thumbnail),
              ),
            ),
            const SizedBox(height: 6),                    
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Text(
                product.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,                  
                  color: Colors.white,                  
                ),
                maxLines: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.price}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        color: product.price < 50
                            ? const Color(0xFFFFE6E6)
                            : const Color(0xFFF5F6F9),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.string(
                        heartIcon,
                        colorFilter: ColorFilter.mode(
                            product.price < 50
                                ? const Color(0xFFFF4848)
                                : const Color(0xFFDBDEE4),
                            BlendMode.srcIn),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
