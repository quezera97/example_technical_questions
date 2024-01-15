import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../widget/reuse_widget.dart';

class Question7 extends StatefulWidget {
  const Question7({super.key});

  @override
  State<Question7> createState() => _Question7State();
}

class _Question7State extends State<Question7> {
  final generateWidget = GenerateWidget();
  final kmController = TextEditingController(text: '0');
  String formattedTotalClaim = 'MYR 0';

  CurrencyFormat myrSettings = const CurrencyFormat(
    code: 'myr',
    symbol: 'MYR',
    symbolSide: SymbolSide.left,
    thousandSeparator: ',',
    decimalSeparator: '.',
    symbolSeparator: ' ',
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question 7'),
        backgroundColor: generateWidget.excludeWhiteColor(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.5),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: HtmlWidget(
                  '''
                    <h3> A courier company, PosMax want to use a computer program to determine payable sum of their mileage claims. The payable sum is calculated using this table </h3>
                    <table>
                      <tr>
                        <th>KM</th>
                        <th></th>
                        <th>Cents per KM</th>
                      </tr>
                      <tr>
                        <td>First 500</td>
                        <th></th>
                        <td>50</td>
                      </tr>
                      <tr>
                        <td>Next 200</td>
                        <th></th>
                        <td>40</td>
                      </tr>
                      <tr>
                        <td>Each extra km</td>
                        <th></th>
                        <td>30</td>
                      </tr>
                    </table>
                    <ol>
                      <li>If the travel took 100 km, they should pay RM50.00</li>
                      <li>If the travel took 600 km, they should pay RM290.00 (that is 250 + 40)</li>
                      <li>If the travel took 800 km, they should pay RM360.00 (that is 250 + 80 + 30)</li>
                    </ol>
                  <b>Note : Please develop code without using && or || syntax</b>
                  ''',
                ),
              ),
              const SizedBox(height: 10),
      
              generateWidget.createTextFormField(kmController, 'KM', 'Enter distance (KM)', (p0) => null, [FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))], TextInputType.number),
            
              generateWidget.createSimpleButton('Calculate Total Claim', () {
                double first500 = 0.5;
                double next200 = 0.4;
                double extraKm = 0.3;
                double km500 = 500.0;
                double km200 = 200.0;
                double total700 = 700.0;

                double distance = double.parse(kmController.text);

                double totalClaim = 0.0;
      
                if (distance <= km500) {
                  totalClaim = distance * first500;
                } else if (distance <= total700) {
                  totalClaim = km500 * first500 + (distance - km500) * next200;
                } else {
                  totalClaim = km500 * first500 + km200 * next200 + (distance - total700) * extraKm;
                }

                formattedTotalClaim = CurrencyFormatter.format(totalClaim, myrSettings);

                setState(() {
                  formattedTotalClaim;
                });
              }),
              const SizedBox(height: 50),
              const Text('Total Claim: ', style: TextStyle(fontSize: 15)),
              Text(formattedTotalClaim, style: const TextStyle(fontSize: 30)),
            ]
          ),
        ),
      ),
    );
  }
}