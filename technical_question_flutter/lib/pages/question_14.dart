import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../widget/reuse_widget.dart';

class Question14 extends StatefulWidget {
  const Question14({super.key});

  @override
  State<Question14> createState() => _Question14State();
}

class _Question14State extends State<Question14> {
  final generateWidget = GenerateWidget();
  final itemInCartController = TextEditingController();
  late List<TextEditingController> itemPriceControllers;
  int noOfItemsInCart = 0;
  double totalPrice = 0.00;

  String formattedTotalClaim = 'MYR 0';
  CurrencyFormat myrSettings = const CurrencyFormat(
    code: 'myr',
    symbol: 'MYR',
    symbolSide: SymbolSide.left,
    thousandSeparator: ',',
    decimalSeparator: '.',
    symbolSeparator: ' ',
  );
  
  void createTextListOfItem(noOfItems) {
    setState(() {
      noOfItemsInCart = int.parse(noOfItems);
      itemPriceControllers = List.generate(
        noOfItemsInCart,
        (index) => MoneyMaskedTextController(decimalSeparator: '.', thousandSeparator: ','),
      );

      formattedTotalClaim = 'RM 0';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 14'),
        backgroundColor: generateWidget.excludeWhiteColor(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: HtmlWidget(
                  '''
                  <h3>Calculate Total Cost of Items in a Cart</h3>
                  <h5>A shopping cart contains various items with their respective prices. Write a function that calculates the total cost of items based on the given criteria</h5>
                  <ol>
                    <li>If the total cost is less than or equal to RM50, apply a 5% discount</li>
                    <li>If the total cost is between RM50 and RM100, apply a 10% discount</li>
                    <li>If the total cost is more than RM100, apply a 15% discount</li>
                  </ol>
                  <h5>Consider the following item prices (example):</h5>
                  <ol>
                    <li>Item 1: RM30</li>
                    <li>Item 2: RM25</li>
                    <li>Item 3: RM50</li>
                    <li>Item 4: RM35</li>
                  </ol>
                ''',
                ),
              ),
              const SizedBox(height: 10),

              generateWidget.createTextFormField(itemInCartController, 'No. of Items', 'Enter no. of items in cart', createTextListOfItem, [FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))], TextInputType.number),

              if(noOfItemsInCart > 0) ... [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(color: generateWidget.excludeWhiteColor()),
                      borderRadius: const BorderRadius.all(Radius.circular(25))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 4.0,
                        ),
                        padding: const EdgeInsets.all(5.0),
                        itemCount: noOfItemsInCart,
                        itemBuilder: (context, index) {
                          int noOfItemIndex = index + 1;
                          return Container(
                            child: generateWidget.createTextFormField(itemPriceControllers[index], 'Item $noOfItemIndex', 'Enter price of item', (p0) => null, [FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))], TextInputType.number),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],

              generateWidget.createSimpleButton('Calculate Total Cost', () {
                totalPrice = 0.00;

                for (int i = 0; i < noOfItemsInCart; i++) {
                  String textItemPrice = itemPriceControllers[i].text;
                  double itemPrice = double.parse(textItemPrice);

                  if(itemPrice <= 50.00){
                    itemPrice = itemPrice * 0.95;
                  }
                  else if(itemPrice > 100.00){
                    itemPrice = itemPrice * 0.85;
                  }
                  else{
                    itemPrice = itemPrice * 0.90;
                  }

                  print(itemPrice);

                  totalPrice+=itemPrice;
                }

                formattedTotalClaim = CurrencyFormatter.format(totalPrice, myrSettings);

                setState(() {
                  formattedTotalClaim;
                });
              }),

              const SizedBox(height: 10),
              const Text('Total Price:', style: TextStyle(fontSize: 15)),
              const SizedBox(height: 10),
              Text(formattedTotalClaim, style: const TextStyle(fontSize: 25)),
              const SizedBox(height: 50),
            ]
          ),
        ),
      ),
    );
  }
}