import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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


class _TicTacToePageState extends State<TicTacToePage> {


  Widget XIcon = Icon(Icons.remove,size: 50,color: Colors.white,);
  Widget OIcon = Icon(FontAwesomeIcons.circle,size: 50,color: Colors.white,);
  String title = '$currentPlayer to move ';

  highlightWinningWidgets(List<Widget>widget1,List<Widget>widget2,List<Widget>widget3){

  }
  checkWinner(List<List<Widget>>board,Widget x){
    if (board[0][0] == x && board[0][1] == x && board[0][2] == x) {

      return true;

    } else if (board[1][0] == x && board[1][1] == x && board[1][2] == x) {
      return true;
    } else if (board[2][0] == x && board[2][1] == x && board[2][2] == x) {
      return true;
    } else if (board[0][0] == x && board[1][0] == x && board[2][0] == x) {
      return true;
    } else if (board[0][1] == x && board[1][1] == x && board[2][1] == x) {
      return true;
    } else if (board[0][2] == x && board[1][2] == x && board[2][2] == x) {
      return true;
    } else if (board[0][0] == x && board[1][1] == x && board[2][2] == x) {
      return true;
    } else if (board[0][2] == x && board[1][1] == x && board[2][0] == x) {
      return true;
    } else {
      return false;
    }
  }

  refreshEverything(int row,int column){
    print('$currentPlayer');
    if(currentPlayer == 'X' && BoardOfWidgets[row][column] == null ){
      BoardOfWidgets[row][column] = AnimatedOpacity(opacity: 1,duration: Duration(seconds: 4),curve: Cubic(0.4, 0.0, 0.2, 1.0),child: XIcon);
    }
    else if(currentPlayer == 'O' && BoardOfWidgets[row][column] == null){
      BoardOfWidgets[row][column] = AnimatedOpacity(opacity: 1,duration: Duration(seconds: 4),curve: Cubic(0.4, 0.0, 0.2, 1.0),child: OIcon);
    }

    if (currentPlayer == 'X') {
      currentPlayer = 'O';
    } else {
      currentPlayer = 'X';
    }
    title = '$currentPlayer to move';

    if(checkWinner(BoardOfWidgets,XIcon)){
      title = 'X is the winner';
    }
    else if(checkWinner(BoardOfWidgets, OIcon)){
      title = 'O is the winner';
    }

    setState(() {

    });
  }

  Reset(){
    BoardOfWidgets = List.generate(boardSize, (_) => List.filled(boardSize,null));
    currentPlayer = 'X';
    title = '$currentPlayer to move';
    setState(() {

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
              Center(
                child: Text('TIC TAC TOE',
                    style: TextStyle(
                        fontFamily: 'Varela',
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white)),
              ),
              Text(title,
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
                      child: BoardOfWidgets[0][0],
                      createIcon: () => refreshEverything(0,0),
                    ),
                  ),
                  Expanded(
                    child: ReusableBox(
                      width: 70,
                      height: 70,
                      child: BoardOfWidgets[0][1],
                      createIcon:() => refreshEverything(0,1),
                    ),
                  ),
                  Expanded(
                    child: ReusableBox(
                      width: 70,
                      height: 70,
                      child: BoardOfWidgets[0][2],
                      createIcon: () => refreshEverything(0,2),
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
                      createIcon: () => refreshEverything(1,0),
                    ),
                  ),
                  Expanded(
                    child: ReusableBox(
                      width: 70,
                      height: 70,
                      child: BoardOfWidgets[1][1],
                      createIcon:() => refreshEverything(1,1),
                    ),
                  ),
                  Expanded(
                    child: ReusableBox(
                      width: 70,
                      height: 70,
                      child: BoardOfWidgets[1][2],
                      createIcon:() => refreshEverything(1,2),
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
                      createIcon: () => refreshEverything(2,0),
                    ),
                  ),
                  Expanded(
                    child: ReusableBox(
                      width: 70,
                      height: 70,
                      child: BoardOfWidgets[2][1],
                      createIcon: () =>  refreshEverything(2,1),
                    ),
                  ),
                  Expanded(
                    child: ReusableBox(
                      width: 70,
                      height: 70,
                      child: BoardOfWidgets[2][2],
                      createIcon: () =>  refreshEverything(2,2),
                    ),
                  ),
                ],
              ),
              ReusableBox(width: 140,height: 70,child: Text('RESET',
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white)),
              createIcon: () => Reset(),)
            ],
          )
        ],
      ),
    );
  }
}

class ReusableBox extends StatelessWidget {
  double width;
  double height;
  Widget child;
  Function createIcon;

  ReusableBox(
      {this.width,
        this.height,
        this.child,
        this.createIcon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: createIcon,
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