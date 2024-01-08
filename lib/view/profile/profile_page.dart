import 'package:agriplant/resourses/img_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_order_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 15),
          child: CircleAvatar(
            radius: 62,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: const CircleAvatar(
              radius: 60,
              foregroundImage: AssetImage(profileImg),
            ),
          ),
        ),
        Center(
          child: Text(
            "Jessi Williams",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Center(
          child: Text(
            "jessiwills@gmail.com",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const SizedBox(height: 25),
        ListTile(
          title: const Text("My orders"),
          leading: const Icon(Icons.shopping_bag_rounded),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyOrderPage(),
                ));
          },
        ),
        ListTile(
          title: const Text("About us"),
          leading: const Icon(CupertinoIcons.info_circle),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Logout"),
          leading: const Icon(Icons.logout),
          onTap: () {},
        ),
      ],
    );
  }
}
