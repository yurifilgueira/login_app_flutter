import 'package:flutter/material.dart';
import 'package:login_app/app/widgets/forms/account_details_widgets/account_details.dart';
import 'package:login_app/app/widgets/title_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
                child: const Align(
                  alignment: Alignment.center,
                  child: TitleWidget(title: "Profile",),
                )),
            const AccountDetails(),
          ],
        ),
      ),
    );

  }
}
