import 'package:flutter/material.dart';
import 'package:shop/components/product/product_card.dart';
import 'package:shop/models/product_model.dart';

import '../../../../constants.dart';
import '../../../../route/route_constants.dart';
import '../../../../components/empty_state.dart';

class BestSellers extends StatelessWidget {
  const BestSellers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Best sellers",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // While loading use 👇
        // const ProductsSkelton(),
        if (demoBestSellersProducts.isEmpty)
          const SizedBox(height: 220, child: EmptyState(title: 'No items'))
        else
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: demoBestSellersProducts.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(
                  left: defaultPadding,
                  right: index == demoBestSellersProducts.length - 1
                      ? defaultPadding
                      : 0,
                ),
                child: ProductCard(
                  image: demoBestSellersProducts[index].image,
                  brandName: demoBestSellersProducts[index].brandName,
                  title: demoBestSellersProducts[index].title,
                  price: demoBestSellersProducts[index].price,
                  priceAfetDiscount:
                      demoBestSellersProducts[index].priceAfetDiscount,
                  dicountpercent: demoBestSellersProducts[index].dicountpercent,
                  press: () {
                    Navigator.pushNamed(context, productDetailsScreenRoute,
                        arguments: index.isEven);
                  },
                ),
              ),
            ),
          )
      ],
    );
  }
}
