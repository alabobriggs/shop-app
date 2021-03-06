import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/order_button.dart';
import '../widgets/cart_item.dart';
import '../providers/cart.dart' show CartProvider;

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total",
                    style: const TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      "\$${cart.totalAmount.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 20,
                        color:
                            Theme.of(context).primaryTextTheme.headline6.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  OrderButton(cart: cart)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (context, idx) => CartItem(
                id: cart.items.values.toList()[idx].id,
                productId: cart.items.keys.toList()[idx],
                price: cart.items.values.toList()[idx].price,
                quantity: cart.items.values.toList()[idx].quantity,
                title: cart.items.values.toList()[idx].id,
              ),
            ),
          )
        ],
      ),
    );
  }
}
