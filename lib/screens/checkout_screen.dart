import 'package:app/Objects/cartItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CheckoutDialog extends StatefulWidget {
  final ListOfCartItems itemList;
  CheckoutDialog({Key? key, required this.itemList}) : super(key: key);

  @override
  _CheckoutDialogState createState() => _CheckoutDialogState();
}

class _CheckoutDialogState extends State<CheckoutDialog> {
  final holderName = TextEditingController();
  final cardNumber = TextEditingController();
  final expirationDate = TextEditingController();
  final fullAddress = TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
    ]);
    holderName.dispose();
    cardNumber.dispose();
    expirationDate.dispose();
    fullAddress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width * 0.9;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
              top: screenHeight * 0.04,
              bottom: screenHeight * 0.02,
            ),
            child: Column(
              children: [
                // forms
                Container(
                  // color: Colors.green,
                  height: screenHeight * 0.67,
                  width: screenWidth,
                  child: forms(screenHeight * 0.67, screenWidth, holderName,
                      cardNumber, expirationDate, fullAddress),
                ),

                // disclaimer
                Container(
                  height: screenHeight * 0.17,
                  width: screenWidth,
                  // color: Colors.blue,
                  child: disclaimer(screenHeight * 0.17, screenWidth),
                ),

                // buttons
                Container(
                  height: screenHeight * 0.1,
                  // color: Colors.pink,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      cancelButton(screenHeight * 0.12, screenWidth),
                      paymentButton(screenHeight * 0.12, screenWidth,
                          holderName, cardNumber, expirationDate, fullAddress),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget forms(
      double sectionHeight,
      double screenWidth,
      TextEditingController holderName,
      TextEditingController cardNumber,
      TextEditingController expirationDate,
      TextEditingController fullAddress) {
    TextStyle style = TextStyle(
      color: Colors.white,
      fontFamily: "Manrope",
      fontSize: sectionHeight * 0.03,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Name of card holder",
          style: style,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: sectionHeight * 0.02,
            bottom: sectionHeight * 0.05,
          ),
          child: TextField(
            controller: holderName,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3.0),
                borderRadius: BorderRadius.circular(30),
              ),
              hintText: 'Full name',
              hintStyle: TextStyle(
                color: Colors.grey[800],
              ),
              contentPadding: EdgeInsets.only(left: 20.0),
            ),
          ),
        ),
        Text(
          "Credit card number",
          style: style,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: sectionHeight * 0.02,
            bottom: sectionHeight * 0.05,
          ),
          child: TextField(
            controller: cardNumber,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3.0),
                borderRadius: BorderRadius.circular(30),
              ),
              hintText: 'Card number',
              hintStyle: TextStyle(
                color: Colors.grey[800],
              ),
              contentPadding: EdgeInsets.only(left: 20.0),
            ),
          ),
        ),
        Text(
          "Expiration date",
          style: style,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: sectionHeight * 0.02,
            bottom: sectionHeight * 0.05,
          ),
          child: TextField(
            controller: expirationDate,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3.0),
                borderRadius: BorderRadius.circular(30),
              ),
              hintText: 'MM/YY',
              hintStyle: TextStyle(
                color: Colors.grey[800],
              ),
              contentPadding: EdgeInsets.only(left: 20.0),
            ),
          ),
        ),
        Text(
          "Address",
          style: style,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: sectionHeight * 0.02,
          ),
          child: TextField(
            controller: fullAddress,
            textAlignVertical: TextAlignVertical.top,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3.0),
                borderRadius: BorderRadius.circular(30),
              ),
              hintText: 'Full address',
              hintStyle: TextStyle(
                color: Colors.grey[800],
              ),
              contentPadding: EdgeInsets.only(
                  top: 14, left: 20.0, bottom: sectionHeight * 0.27 - 14),
            ),
          ),
        ),
      ],
    );
  }

  Widget disclaimer(double sectionHeight, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: sectionHeight * 0.06),
          child: Text(
            "Disclaimer",
            style: TextStyle(
              color: Colors.grey[600],
              fontFamily: "Manrope",
              fontWeight: FontWeight.w800,
              fontSize: sectionHeight * 0.15,
            ),
          ),
        ),
        Text(
          """Fair use is a use permitted by copyright statute that might otherwise be infringing. Non-profit, educational or personal use tips the balance in favor of fair use.""",
          style: TextStyle(
            color: Colors.grey[800],
            fontFamily: "Manrope",
            fontWeight: FontWeight.normal,
            fontSize: sectionHeight * 0.1,
          ),
        )
      ],
    );
  }

  Widget paymentButton(
      double sectionHeight,
      double screenWidth,
      TextEditingController holderName,
      TextEditingController cardNumber,
      TextEditingController expirationDate,
      TextEditingController fullAddress) {
    return Container(
      height: sectionHeight * 0.7,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          backgroundColor: MaterialStateColor.resolveWith(
              (states) => Colors.lightGreenAccent[400]!),
        ),
        onPressed: () {
          print("Name: " + holderName.text);
          print("Card: " + cardNumber.text);
          print("Date: " + expirationDate.text);
          print("Address: " + fullAddress.text);
          setState(() {
            widget.itemList.clearQueue();
          });
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: sectionHeight * 0.2),
          child: Text(
            'Make Payment',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w800,
              fontFamily: 'Manrope',
            ),
          ),
        ),
      ),
    );
  }

  Widget cancelButton(double sectionHeight, double screenWidth) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(30.0),
      ),
      height: sectionHeight * 0.7,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          backgroundColor: MaterialStateColor.resolveWith(
              (states) => Theme.of(context).primaryColor),
        ),
        onPressed: () => {Navigator.pop(context)},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: sectionHeight * 0.2),
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
              fontFamily: 'Manrope',
            ),
          ),
        ),
      ),
    );
  }
}
