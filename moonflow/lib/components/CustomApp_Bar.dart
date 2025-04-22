import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});


  @override
  Widget build(BuildContext context) {
    return AppBar(
      //backgroundColor : Theme.of(context).colorScheme.inversePrimary,
      leading: Builder(
        builder: (context) {
          return IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: ClipOval(
              child: Image.asset(
                'assets/profilLogo.png',
                fit: BoxFit.cover,
                )
                ),
          );
        },
      ), //tout truc qui sera avant le titre de notre AppBar
      title: Text("Moonflow"),
      centerTitle: true,
      elevation:
          16.0, //ajoute de l'ombre entre la appbar et le body pour voir la difference
      actions: [
        //toutes les actions qui viennent apres le titre
        IconButton(onPressed: () {}, icon: Icon(Icons.calendar_month)),
      ], //liste de widget
    );
  }
   @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
