import 'package:flutter/material.dart';
import 'package:syanatech/Screeens/DiscountCode.dart';
import 'package:syanatech/constants.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PayInCreditCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PayInCreditCardState();
  }
}

class PayInCreditCardState extends State<PayInCreditCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CreditCardForm(
                  formKey: formKey,
                  obscureCvv: true,
                  obscureNumber: true,
                  cardNumber: cardNumber,
                  cvvCode: cvvCode,
                  cardHolderName: cardHolderName,
                  expiryDate: expiryDate,
                  themeColor: Colors.blue,
                  cardNumberDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Credit Card Number',
                  ),
                  cardHolderDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name On Card',
                  ),
                  expiryDateDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Expired Date',
                    hintText: 'XX/XX',
                  ),
                  cvvCodeDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'CVV',
                    hintText: 'XXX',
                  ),
                  onCreditCardModelChange: onCreditCardModelChange,
                ),
                Container(
                  width: double.infinity,
                  child: DiscountCode(),
                  margin: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    primary: const Color(0xff1b447b),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: const Text(
                      'Validate',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'halter',
                        fontSize: 14,
                        package: 'flutter_credit_card',
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print('valid!');
                    } else {
                      print('invalid!');
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
