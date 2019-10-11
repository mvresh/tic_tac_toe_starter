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

List<List<Widget>> BoardOfWidgets = [
  [null, null, null],
  [null, null, null],
  [null, null, null]
];
String currentPlayer = 'X';

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
              SizedBox(
                height: 100,
              ),
              Text('TIC TAC TOE',
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white)),
              Text('Player ${currentPlayer} to move',
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 20,
                      color: Colors.white70)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: ReusableBox(
                      width: 70,
                      height: 70,
                      rowNumber: 1,
                      itemNumber: 1,
                      child: BoardOfWidgets[0][0],
                      createText: () {
                        setState(() {
                          BoardOfWidgets[0][0] = Text(
                            currentPlayer,
                            style: TextStyle(fontSize: 35, color: Colors.white),
                          );
                          currentPlayer == 'X'
                              ? currentPlayer = 'O'
                              : currentPlayer = 'X';
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableBox(
                        width: 70,
                        height: 70,
                        rowNumber: 1,
                        itemNumber: 2,
                        child: BoardOfWidgets[0][1],
                        createText: () {
                          setState(() {
                            BoardOfWidgets[0][1] = Text(
                              currentPlayer,
                              style: TextStyle(fontSize: 35, color: Colors.white),
                            );
                            currentPlayer == 'X'
                                ? currentPlayer = 'O'
                                : currentPlayer = 'X';
                          });
                        }),
                  ),
                  Expanded(
                    child: ReusableBox(
                        width: 70,
                        height: 70,
                        rowNumber: 1,
                        itemNumber: 3,
                        child: BoardOfWidgets[0][2],
                        createText: () {
                          setState(() {
                            BoardOfWidgets[0][2] = Text(
                              currentPlayer,
                              style: TextStyle(fontSize: 35, color: Colors.white),
                            );
                            currentPlayer == 'X'
                                ? currentPlayer = 'O'
                                : currentPlayer = 'X';
                          });
                        }),
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
                        rowNumber: 2,
                        itemNumber: 1,
                        child: BoardOfWidgets[1][0],
                        createText: () {
                          setState(() {
                            BoardOfWidgets[1][0] = Text(
                              currentPlayer,
                              style: TextStyle(fontSize: 35, color: Colors.white),
                            );
                            currentPlayer == 'X'
                                ? currentPlayer = 'O'
                                : currentPlayer = 'X';
                          });
                        }),
                  ),
                  Expanded(
                    child: ReusableBox(
                        width: 70,
                        height: 70,
                        rowNumber: 2,
                        itemNumber: 2,
                        child: BoardOfWidgets[1][1],
                        createText: () {
                          setState(() {
                            BoardOfWidgets[1][1] = Text(
                              currentPlayer,
                              style: TextStyle(fontSize: 35, color: Colors.white),
                            );
                            currentPlayer == 'X'
                                ? currentPlayer = 'O'
                                : currentPlayer = 'X';
                          });
                        }),
                  ),
                  Expanded(
                    child: ReusableBox(
                        width: 70,
                        height: 70,
                        rowNumber: 2,
                        itemNumber: 3,
                        child: BoardOfWidgets[1][2],
                        createText: () {
                          setState(() {
                            BoardOfWidgets[1][2] = Text(
                              currentPlayer,
                              style: TextStyle(fontSize: 35, color: Colors.white),
                            );
                            currentPlayer == 'X'
                                ? currentPlayer = 'O'
                                : currentPlayer = 'X';
                          });
                        }),
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
                        rowNumber: 3,
                        itemNumber: 1,
                        child: BoardOfWidgets[2][0],
                        createText: () {
                          setState(() {
                            BoardOfWidgets[2][0] = Text(
                              currentPlayer,
                              style: TextStyle(fontSize: 35, color: Colors.white),
                            );
                            currentPlayer == 'X'
                                ? currentPlayer = 'O'
                                : currentPlayer = 'X';
                          });
                        }),
                  ),
                  Expanded(
                    child: ReusableBox(
                        width: 70,
                        height: 70,
                        rowNumber: 3,
                        itemNumber: 2,
                        child: BoardOfWidgets[2][1],
                        createText: () {
                          setState(() {
                            BoardOfWidgets[2][1] = Text(
                              currentPlayer,
                              style: TextStyle(fontSize: 35, color: Colors.white),
                            );
                            currentPlayer == 'X'
                                ? currentPlayer = 'O'
                                : currentPlayer = 'X';
                          });
                        }),
                  ),
                  Expanded(
                    child: ReusableBox(
                        width: 70,
                        height: 70,
                        rowNumber: 3,
                        itemNumber: 3,
                        child: BoardOfWidgets[2][2],
                        createText: () {
                          setState(() {
                            BoardOfWidgets[2][2] = Text(
                              currentPlayer,
                              style: TextStyle(fontSize: 35, color: Colors.white),
                            );
                            currentPlayer == 'X'
                                ? currentPlayer = 'O'
                                : currentPlayer = 'X';
                          });
                        }),
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

class ReusableRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: ReusableBox(
            width: 70,
            height: 70,
            itemNumber: 1,
            child: null,
          ),
        ),
        Expanded(
          child: ReusableBox(width: 70, height: 70, itemNumber: 2, child: null),
        ),
        Expanded(
          child: ReusableBox(width: 70, height: 70, itemNumber: 3, child: null),
        ),
      ],
    );
  }
}

class ReusableBox extends StatelessWidget {
  double width;
  double height;
  Widget child;
  int itemNumber;
  int rowNumber;
  Function createText;

  ReusableBox(
      {this.width,
      this.height,
      this.child,
      this.itemNumber,
      this.rowNumber,
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
