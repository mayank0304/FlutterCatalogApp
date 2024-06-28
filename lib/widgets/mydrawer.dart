import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var imgUrl =
        "https://firebasestorage.googleapis.com/v0/b/mayank-dish-app.appspot.com/o/mayank.jpeg?alt=media&token=4aecebce-a88b-4aad-8d98-ec9061cdc217";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
                
              ),
                margin: EdgeInsets.zero,
                accountName: const Text("Mayank", textScaler: TextScaler.linear(1.2),),
                accountEmail: const Text("mayank771768@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imgUrl),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaler: TextScaler.linear(1.2),
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaler: TextScaler.linear(1.2),
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.white,
              ),
              title: Text(
                "Contact us",
                textScaler: TextScaler.linear(1.2),
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(MyRoutes.loginRoute);
              },
              leading: const Icon(
                Icons.login_rounded,
                color: Colors.white,
              ),
              title: const Text(
                "Login",
                textScaler: TextScaler.linear(1.2),
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
