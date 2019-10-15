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

int boardSize = 3;

List<List<Widget>> BoardOfWidgets = List.generate(boardSize, (_) => List.filled(boardSize,null));

String currentPlayer = 'X';

String secondaryTitle = '$currentPlayer to move';

class _TicTacToePageState extends State<TicTacToePage> {


  ReusableCreateText(int i, int j) {
    bool winnerCheckerIsTrue = false;
  setState(() {

    if(BoardOfWidgets[i][j] == null){
      //BoardOfWidgets[i][j] = XOFiller(i,j);
    }
    if(BoardOfWidgets[i][0] == BoardOfWidgets[i][1] && BoardOfWidgets[i][1] == BoardOfWidgets[i][2] && BoardOfWidgets[i][1] != null){
      winnerCheckerIsTrue = true;
    }
    else if(BoardOfWidgets[0][j] == BoardOfWidgets[1][j] && BoardOfWidgets[1][j] == BoardOfWidgets[2][j] && BoardOfWidgets[1][j] != null){
      winnerCheckerIsTrue = true;
    }
    else if(BoardOfWidgets[0][0] == BoardOfWidgets[1][1] && BoardOfWidgets[1][1] == BoardOfWidgets[2][2] && BoardOfWidgets[1][1] != ' '){
      winnerCheckerIsTrue = true;
    }
    else if(BoardOfWidgets[0][2] == BoardOfWidgets[1][1] && BoardOfWidgets[1][1] == BoardOfWidgets[2][0] && BoardOfWidgets[1][1] != ' '){
      winnerCheckerIsTrue = true;
    }
    if(winnerCheckerIsTrue){
      secondaryTitle = '$currentPlayer is the winner!';
    }
    else {
      secondaryTitle = '$currentPlayer to move';
    }
    currentPlayer == 'X'
    ? currentPlayer = 'O'
        : currentPlayer = 'X';
    });
  }


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
              SizedBox(
                height: 100,
              ),
              Text('TIC TAC TOE',
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white)),
              TitleText(secondaryTitle),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: ReusableBox(
                      width: 70,
                      height: 70,
                      child: BoardOfWidgets[0][0],
                      createText: ReusableCreateText(0, 0),
                    ),
                  ),
                  Expanded(
                    child: ReusableBox(
                      width: 70,
                      height: 70,
                      child: BoardOfWidgets[0][1],
                      createText: ReusableCreateText(0, 1),
                    ),
                  ),
                  Expanded(
                    child: ReusableBox(
                      width: 70,
                      height: 70,
                      child: BoardOfWidgets[0][2],
                      createText: ReusableCreateText(0, 2),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: ReusableBox(
                      width: 70,
                      height: 70,
                      child: BoardOfWidgets[1][0],
                      createText: ReusableCreateText(1, 0),
                    ),
                  ),
                  Expanded(
                    child: ReusableBox(
                      width: 70,
                      height: 70,
                      child: BoardOfWidgets[1][1],
                      createText: ReusableCreateText(1, 1),
                    ),
                  ),
                  Expanded(
                    child: ReusableBox(
                      width: 70,
                      height: 70,
                      child: BoardOfWidgets[1][2],
                      createText: ReusableCreateText(1, 2),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: ReusableBox(
                      width: 70,
                      height: 70,
                      child: BoardOfWidgets[2][0],
                      createText: ReusableCreateText(2, 0),
                    ),
                  ),
                  Expanded(
                    child: ReusableBox(
                      width: 70,
                      height: 70,
                      child: BoardOfWidgets[2][1],
                      createText: ReusableCreateText(2, 1),
                    ),
                  ),
                  Expanded(
                    child: ReusableBox(
                      width: 70,
                      height: 70,
                      child: BoardOfWidgets[2][2],
                      createText: ReusableCreateText(2, 2),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ReusableBox(
                width: 160,
                height: 60,
                child: Center(
                  child: Text('Result',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 24,
                        color: Color(0xFFFFFFFF),
                      )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class XOFiller extends StatelessWidget {
int row;
int column;
XOFiller(this.row,this.column);

  @override
  Widget build(BuildContext context) {
    return Text(currentPlayer,
      style: TextStyle(fontSize: 35, color: Colors.white),
    );
  }
}

class TitleText extends StatelessWidget {
 String title;
 TitleText(this.title);


  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 20,
            color: Colors.white70));
  }
}

class ReusableBox extends StatelessWidget {
  double width;
  double height;
  Widget child;
  Function createText;

  ReusableBox(
      {this.width,
      this.height,
      this.child,
      this.createText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: createText,
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.all(12),
        child: Center(child: child),
        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF).withOpacity(0.4),
            borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
    );
  }
}
