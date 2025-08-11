import 'package:flutter/material.dart';
import 'package:shop/components/product/secondary_product_card.dart';
import 'package:shop/models/product_model.dart';

import '../../../../constants.dart';
import '../../../../route/route_constants.dart';
import '../../../../components/empty_state.dart';

class MostPopular extends StatelessWidget {
  const MostPopular({
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
            "Most popular",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // While loading use 👇
        // SeconderyProductsSkelton(),
        if (demoPopularProducts.isEmpty)
          const SizedBox(height: 114, child: EmptyState(title: 'No items'))
        else
          SizedBox(
            height: 114,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: demoPopularProducts.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(
                  left: defaultPadding,
                  right: index == demoPopularProducts.length - 1
                      ? defaultPadding
                      : 0,
                ),
                child: SecondaryProductCard(
                  image: demoPopularProducts[index].image,
                  brandName: demoPopularProducts[index].brandName,
                  title: demoPopularProducts[index].title,
                  price: demoPopularProducts[index].price,
                  priceAfetDiscount: demoPopularProducts[index].priceAfetDiscount,
                  dicountpercent: demoPopularProducts[index].dicountpercent,
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
