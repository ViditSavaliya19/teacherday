import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacherday/screens/userScreen/userProvider.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({Key? key}) : super(key: key);

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  UserProvider? userProviderTrue;
  UserProvider? userProviderFalse;

  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).getProduct();
  }

  @override
  Widget build(BuildContext context) {
    userProviderFalse = Provider.of<UserProvider>(context, listen: false);
    userProviderTrue = Provider.of<UserProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                userProviderFalse!.filterPrice();
              },
              icon: const Icon(Icons.filter_list_alt),
            ),IconButton(
              onPressed: () {
                userProviderFalse!.getProduct();
              },
              icon: const Icon(Icons.filter_list_alt),
            ),
          ],
        ),
        body: Center(
          child: ListView.builder(
              itemCount: userProviderTrue!.productList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(
                    "${userProviderTrue!.productList[index].image}",
                    height: 100,
                    width: 100,
                  ),
                  title: Text("${userProviderTrue!.productList[index].title}"),
                  subtitle:
                      Text("${userProviderTrue!.productList[index].category}"),
                  trailing:
                      Text("${userProviderTrue!.productList[index].price}"),
                );
              }),
        ),
      ),
    );
  }
}