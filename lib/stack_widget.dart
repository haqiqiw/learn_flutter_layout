import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        buildProfile(),
        const SizedBox(height: 24),
        buildImages(),
      ],
    );
  }

  Widget buildProfile() {
    const urlProfile =
        'https://merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/egg-3442-4c317615ec1fd800728672f2c168aca5@1x.jpg';

    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          color: Colors.blueGrey,
          height: 120,
        ),
        Positioned(
          bottom: -20,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 4,
                  )
                ],
                image: const DecorationImage(
                  image: NetworkImage(urlProfile),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildImages() {
    const urlImage1 =
        'https://images.unsplash.com/photo-1497752531616-c3afd9760a11?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGFuaW1hbHxlbnwwfHwwfHw%3D&w=1000&q=80';
    const urlImage2 =
        'https://images.unsplash.com/photo-1474511320723-9a56873867b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YW5pbWFsfGVufDB8fDB8fA%3D%3D&w=1000&q=80';
    const urlImage3 =
        'https://images.unsplash.com/photo-1560114928-40f1f1eb26a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y3V0ZSUyMGFuaW1hbHxlbnwwfHwwfHw%3D&w=1000&q=80';

    return Container(
      padding: const EdgeInsets.all(32),
      child: Stack(
        children: <Widget>[
          buildImage(
            urlImage: urlImage1,
            margin: const EdgeInsets.symmetric(
              horizontal: 40,
            ).copyWith(
              top: 0,
            ),
          ),
          buildImage(
            urlImage: urlImage2,
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ).copyWith(
              top: 60,
            ),
          ),
          buildImage(
            urlImage: urlImage3,
            margin: const EdgeInsets.symmetric().copyWith(
              top: 120,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage({
    required String urlImage,
    required EdgeInsets margin,
  }) {
    return Container(
      margin: margin,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(urlImage),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.25),
                BlendMode.darken,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
