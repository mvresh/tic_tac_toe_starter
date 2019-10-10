import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TicTacToePage(),
  ));
}

class TicTacToePage extends StatefulWidget {
  @override
  _TicTacToePageState createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/tttbg.jpg",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 100,),
              Text('TIC TAC TOE', style: TextStyle(
                fontFamily:'Varela',
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.white
              )),
              Text('Player X to move', style: TextStyle(
                fontFamily:'Varela',
                fontSize: 20,
                  color: Colors.white70
              )),
              ReusableRow(),
              ReusableRow(),
              ReusableRow(),
              SizedBox(height: 30,),
              ReusableBox(width:160,height: 60,child: Center(
                child: Text('Result', style: TextStyle(
                    fontFamily:'Varela',
                    fontSize: 24,
                    color: Color(0xFFFFFFFF),
                )),
              ),),
            ],
          )
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  const ReusableRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: ReusableBox(width: 70,height: 70),
        ),
        Expanded(
          child: ReusableBox(width: 70,height: 70),
        ),
        Expanded(
          child: ReusableBox(width: 70,height: 70),
        ),

      ],
    );
  }
}

class ReusableBox extends StatelessWidget {
  double width;
  double height;
  Widget child;
  ReusableBox({this.width ,this.height,this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,height: height,
      margin: EdgeInsets.all(12),
      child: child,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF).withOpacity(0.4),
        borderRadius: BorderRadius.all(Radius.circular(12))
      ),
    );
  }
}
