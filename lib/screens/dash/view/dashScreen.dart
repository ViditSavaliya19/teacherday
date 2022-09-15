import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacherday/screens/dash/model/studentModel.dart';
import 'package:teacherday/screens/dash/provider/dashProvider.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  DashProvider? dashProviderTrue;
  DashProvider? dashProviderFalse;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtID = TextEditingController();
  TextEditingController txtSTD = TextEditingController();

  @override
  Widget build(BuildContext context) {
    dashProviderFalse = Provider.of<DashProvider>(context, listen: false);
    dashProviderTrue = Provider.of<DashProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView.builder(
            itemCount: dashProviderTrue!.l1.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("${dashProviderFalse!.l1[index].name}"),
                subtitle: Text("${dashProviderFalse!.l1[index].std}"),
                leading: Text("${dashProviderFalse!.l1[index].id}"),
                trailing: IconButton(
                  onPressed: () {
                    dashProviderFalse!.remove(index);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red ,
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: SizedBox(
                      height: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: txtID,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("GRID"),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: txtName,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("NAME"),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: txtSTD,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("STD"),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              StudentModel s1 = StudentModel(
                                  id: txtID.text,
                                  name: txtName.text,
                                  std: txtSTD.text);

                              dashProviderFalse!.addData(s1);
                              Navigator.pop(context);
                            },
                            child: Text("Add"),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
