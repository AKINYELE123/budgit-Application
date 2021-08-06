import 'package:budgit/ui/KeyboardKey.dart';
import 'package:budgit/util/hexcolor.dart';
import 'package:flutter/material.dart';

class CustomKeyboard extends StatefulWidget {
  const CustomKeyboard({Key? key}) : super(key: key);

  @override
  _CustomKeyboardState createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {

  Color _black =HexColor("#000000");
  Color _grey =HexColor("#FBFBFB");
  Color _white =HexColor("#E5E5E5");

  late List<List<dynamic>> keys;

   late String amount;

  @override
  void initState(){
    super.initState();

    keys = [
      ["1", "2", "3"],
      ["4", "5", "6"],
      ["7", "8", "9"],
      [".", "0", Icon(Icons.arrow_back_ios)],
    ];

    amount = "";
  }

  onKeyTap(val){
    setState(() {
      amount = amount + val;
    });
  }

  onBackspacePress(){
    setState(() {
      amount = amount.substring(0, amount.length -1);
    });
  }


  renderKeyboard(){
    return  keys.map(
            (x) => Row(
          children: x.map(
                (y) {
              return Expanded(
                child: KeyboardKey(
                  label: y,
                  value: y,
                  onTap: (val){
                    if(val is Widget){
                      onBackspacePress();
                    }else{
                      onKeyTap(val);
                    }
                  },
                ),
              );
            },
          ).toList(),
        )
    ).toList();
  }

  renderAmount(){
    String display = "\$0";

    if(this.amount.length > 0){
      display = "\$" + amount;
    }

    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
      child: Expanded(
        child: Center(
          child: Text(
            display,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: _black,
                fontFamily: 'Caros',
              fontSize: 65.0
            ),
          ),
        ),
      ),
    );
  }

  renderText(){
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 16, right: 16,
            ),
              child: Image.asset(
                  'images/image.png',
                ),
          ),
          Container(
            margin: EdgeInsets.only(right: 100),
            height: 50.0,
            width: 200,
            decoration: BoxDecoration(
              color: _grey,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
                child: Text(
                "N5,000  left", style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w900,
                    fontFamily: 'Caros',
                color: _black
                )
            ),
            ),
          ),
        ],
      ),
    );
  }
  
  renderConfirmButton(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          //child: Padding(
            //padding: const EdgeInsets.all(20.5),
            child: Container(
                width: 150.0,
                height: 50.0,
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: _grey
                ),
                child: Center(
                  child: Text(
                    "Credit", style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25.0,
                      fontFamily: 'Caros',
                      color: _black
                  ),
                  ),
                )
            ),
          ),
       // ),
        Container(
          child: Container(
              width: 150.0,
              height: 50.0,
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: _grey,
              ),
              child: Center(
                child: Text(
                  "Debit", style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25.0,
                    fontFamily: 'Caros',
                    color: _black
                ),
                ),
              )
          ),
        ),
      ],

    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _white,
      body: SafeArea(
        child: Column(
            children:[
              //renderImage(),
              renderText(),
              renderAmount(),
              ...renderKeyboard(),
              renderConfirmButton(),
            ]
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 20,
        unselectedFontSize: 30,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_rounded, color: _black), title: Text("First")),
          BottomNavigationBarItem(icon: Icon(Icons.collections_bookmark_rounded, color: _black), title: Text("Second")),
          BottomNavigationBarItem(icon: Icon(Icons.description, color: _black), title: Text("Third")),
          BottomNavigationBarItem(icon: Icon(Icons.date_range_sharp, color: _black), title: Text("Forth")),
        ],),
    );
  }

}
