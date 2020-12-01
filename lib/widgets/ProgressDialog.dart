import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  final String dataMessage;

  ProgressDialog({this.dataMessage});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.tealAccent,
      child: Container(
        height: 100,
        width: 500,
        // alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blueGrey[50], // box color
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
              ),
              // Here in the text we will pass the message fromdifferent pages
              // so lets define the variable at top and pass that variable from constructor of this class

              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  dataMessage,
                  style: TextStyle(
                    color: Colors.black87,
                  ), //text color
                ),
              )
            ], // children
          ),
        ),
      ),
    );
  }
}
