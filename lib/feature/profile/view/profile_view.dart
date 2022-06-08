import 'package:flutter/material.dart';
import 'package:flutter_buddy_app/feature/profile/view_model/profile_view_model.dart';
import 'package:flutter_buddy_app/product/ui_helper/colors.dart';
import 'package:flutter_buddy_app/product/ui_helper/text_style.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileViewModel _profileViewModel = ProfileViewModel();
  
  bool headPhoto = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _profileViewModel,
      child: SafeArea(
          bottom: true,
          top: true,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                color: !headPhoto ? MyColors.myBorderColor : Colors.blueAccent,
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: IconButton(
                          color: Colors.black,
                          onPressed: () {
                            print("clicked camera");
                            headPhoto = !headPhoto;
                            setState(() {});
                          },
                          icon: Icon(Icons.add_a_photo_rounded)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 100),
                      decoration: BoxDecoration(
                        color: MyColors.scaffoldBackground,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(50),
                            topLeft: Radius.circular(50)),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          const Center(
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://pbs.twimg.com/profile_images/1527007156289028096/xs3xTEXm_400x400.jpg'),
                              minRadius: 50,
                              maxRadius: 50,
                            ),
                          ),
                          Container(
                            child: Text("Mihriban Şahin",
                                style: MyTextStyle(
                                    textStyleType: TextStyleOptions.TITLE)),
                          ),
                          Container(
                            child: Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                style: MyTextStyle(
                                    textStyleType: TextStyleOptions.NORMAL),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
