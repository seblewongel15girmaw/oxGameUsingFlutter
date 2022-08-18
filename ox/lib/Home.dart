

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool turnO=true;
  int count=0;
  int winnerOcount=0;
  int winnerXcount=0;
  bool isFull=false;
  List<String>xoData=[
' ',
' ',
' ',
' ',
' ',
' ',
' ',
' ',
' ',
];

  
void showD(context,String msg){
    showDialog(
        context: context, builder: (context){
        return AlertDialog(
          title: Text("Winner"),
          content: Text(msg),
          actions: [
            TextButton(onPressed: (){

              Navigator.pop(context);
            }, child: Text("ok"))
          ],
        );
      },

      );

}

void gameStarter(context){
  showDialog(
        context: context, builder: (context){
        return AlertDialog(
          title: Text("Who wants start the game"),
          content: Row(
            children: [
              ElevatedButton(onPressed: (){
                setState(() {
                  turnO=false;
                });
                
                 Navigator.pop(context);
                

              }, 
              child: Text("player X"),),
              SizedBox(width: 5),

              ElevatedButton(onPressed: (){
                setState(() {
                     turnO=true;
                });
          
              Navigator.pop(context);
              }, 
              child: Text("player O"))
            ],
          ),
          // actions: [
          //   TextButton(onPressed: (){

          //     Navigator.pop(context);
          //   }, child: Text("ok"))
          // ],
        );
      },

      );
}

  void checkWinner(context){
     var message=(xoData[0]=="X") ? "X is winner":" O is winner";
     var message1=(xoData[2]=="X") ? "X is winner" : " O is winner";
     var message2=(xoData[3]=="X") ? "X is winner" : " O is winner";
     var message3=(xoData[6]=="X") ? "X is winner" : " O is winner";
     var message4=(xoData[1]=="X") ? "X is winner" : " O is winner";
     
    // first row
    if(xoData[0]==xoData[1] && xoData[1]==xoData[2] && xoData[0]!=' '){
      
        setState(() {
         winnerOcount=winnerOcount+1;
      });
        
      
      showD(context, message);
     
   
      clear();
    }
    // second Row
    else if(xoData[3]==xoData[4] && xoData[3]==xoData[5] && xoData[3]!=' '){
          showDialog(
        context: context, builder: (context){
        return AlertDialog(
          title: Text("Winner"),
          content: Text(message2),
          actions: [
            TextButton(onPressed: (){

              Navigator.pop(context);
            }, child: Text("ok"))
          ],
        );
      },

      );
       clear();
    }
    // third row
    else if(xoData[6]==xoData[7] && xoData[6]==xoData[8] && xoData[6]!=' '){
          showDialog(
        context: context, builder: (context){
        return AlertDialog(
          title: Text("Winner"),
          content: Text(message3),
          actions: [
            TextButton(onPressed: (){

              Navigator.pop(context);
            }, child: Text("ok"))
          ],
        );
      },

      );
       clear();
    }
    // first column
    else if(xoData[0]==xoData[3] && xoData[3]==xoData[6] && xoData[0]!=' '){
          showDialog(
        context: context, builder: (context){
        return AlertDialog(
          title: Text("Winner"),
          content: Text(message),
          actions: [
            TextButton(onPressed: (){

              Navigator.pop(context);
            }, child: Text("ok"))
          ],
        );
      },

      );
       clear();
    }
    // second column
    else if(xoData[1]==xoData[4] && xoData[4]==xoData[7] && xoData[1]!=' '){
          showDialog(
        context: context, builder: (context){
        return AlertDialog(
          title: Text("Winner"),
          content: Text(message4),
          actions: [
            TextButton(onPressed: (){

              Navigator.pop(context);
            }, child: Text("ok"))
          ],
        );
      },

      );
       clear();
    }
    // third column 
    else if(xoData[2]==xoData[5] && xoData[5]==xoData[8] && xoData[2]!=' '){
          showDialog(
        context: context, builder: (context){
        return AlertDialog(
          title: Text("Winner"),
          content: Text(message1),
          actions: [
            TextButton(onPressed: (){

              Navigator.pop(context);
            }, child: Text("ok"))
          ],
        );
      },

      );
       clear();
    }
    // first diagonal
     else if(xoData[0]==xoData[4] && xoData[4]==xoData[8] && xoData[0]!=' '){
          showDialog(
        context: context, builder: (context){
        return AlertDialog(
          title: Text("Winner"),
          content: Text(message),
          actions: [
            TextButton(onPressed: (){

              Navigator.pop(context);
            }, child: Text("ok"))
          ],
        );
      },

      );
       clear();
    }
  // second diagonal
   else if(xoData[2]==xoData[4] && xoData[4]==xoData[6] && xoData[2]!=' '){
          showDialog(
        context: context, builder: (context){
        return AlertDialog(
          title: Text("Winner"),
          content: Text(message1),
          actions: [
            TextButton(onPressed: (){

              Navigator.pop(context);
            }, child: Text("ok"))
          ],
        );
      },

      );
      clear();
    }
    else if(count==9){
      showDialog(
        context: context, builder: (context){
        return AlertDialog(
          title: Text("Winner"),
          content: Text("Draw"),
          actions: [
            TextButton(onPressed: (){

              Navigator.pop(context);
            }, child: Text("ok"))
          ],
        );
      },

      );
      clear();
    }

    print(winnerOcount);
      

  }

  void clear(){
               for(int i=0;i<9;i++){
              xoData[i]=' ';
            }
            count=0;
              }
  
  




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Tic Tac Toe"),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(onPressed: (){
            setState(() {
             clear();
             gameStarter(context);

              
            });

            }, icon: Icon(Icons.refresh)),
          ),

        ],

      ),
      body: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: Column(
          children: [
            // status
            Padding(
              padding: const EdgeInsets.only(bottom:15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("Player O",style: TextStyle(fontSize: 18),),
                      SizedBox(height: 10),
                      Text("$winnerOcount",style: TextStyle(fontSize: 25),)
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text("Player x",style: TextStyle(fontSize: 18),),
                      SizedBox(height: 10),
                      Text("$winnerXcount",style: TextStyle(fontSize: 25),)
                    ],
                  ),
                
                ],
                
              ),
            ),
            Expanded(
              flex: 3,

              child: GridView.builder(
                itemCount: 9,
                
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,), itemBuilder: (Context,index){
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if(turnO){
                        if(xoData[index]==' '){
                          xoData[index]='O';
                          count=count+1;
                        }
                        
                      }
                      else{
                        if(xoData[index]==' '){
                          xoData[index]='X';
                          count=count+1;
                        }
                          
                      }
                      turnO=!turnO;
                       
                        
                    });

                    //  draw();
                    checkWinner(context);
                   
                   
                    
                  },
                  child: Container(
                     decoration: BoxDecoration(
                      border: Border.all(color: Colors.white)
                     ),
                     child: Center(child: Text(xoData[index])),
                  ),
                );
            
              },
              ),
            ),
            

            Padding(
              padding: const EdgeInsets.only(bottom:40.0),
              
              child:turnO?Text("Turn of O"):Text("Turn of X"),
             
              
            ),
          ],
        
        ),
      ),
    );
    
  }
}