import 'package:flutter/cupertino.dart';

class HomeScreenIos extends StatefulWidget {
  const HomeScreenIos({Key? key}) : super(key: key);

  @override
  State<HomeScreenIos> createState() => _HomeScreenIosState();
}

class _HomeScreenIosState extends State<HomeScreenIos> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Icon(
          CupertinoIcons.back,
          size: 20,
        ),
        middle: Text("IOS"),
        trailing: Icon(
          CupertinoIcons.settings,
          size: 20,
        ),
      ),
      child: Center(
        child: CupertinoButton.filled(
          onPressed: () {

            showCupertinoDialog(context: context, builder: (context){
              return CupertinoAlertDialog(
                title: Text("Are you sure to Exit !"),
                actions: [
                  CupertinoDialogAction(child: Text("OK"),onPressed: (){
                    Navigator.pop(context);
                  },),
                  CupertinoDialogAction(child: Text("NO"),onPressed: (){},),
                ],
              );

            });


          },
          child: Text("Submit"),
        ),
      ),
    );
  }
}
