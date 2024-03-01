import 'dart:math';

import 'package:clock_app/views/components/clock_option_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  DateTime d = DateTime.now();

  bool _isAnalog = false;
  bool _isStrap = false;
  bool _isDigital = false;
  bool _image = false;

  void startClock() {
    Future.delayed(const Duration(seconds: 1), () {
      d = DateTime.now();
      setState(() {});
      startClock();
    });
  }

  @override
  void initState() {
    super.initState();
    startClock();
  }

  final List<String> _bgImages = [
    "https://www.hdwallpapers.in/download/wall_board_lights_black_background_4k_hd_black_background-1440x2560.jpg",
    "https://getwallpapers.com/wallpaper/full/f/a/c/962468-solid-wallpapers-1080x1920-for-full-hd.jpg",
    "https://e0.pxfuel.com/wallpapers/741/410/desktop-wallpaper-black-phone-25-top-black-phone-black-for-mobile-thumbnail.jpg",
    "https://pub-static.fotor.com/assets/bg/ca5fa97f-7696-414b-bc87-9b5205b27575.jpg",
    "https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDI0LTAxL3Jhd3BpeGVsb2ZmaWNlM19waG90b19vZl9hYnN0cmFjdF9ibGFja19ncm9tZXRyeV9zaW1wbGVfYmxhY2tfYl9iYTczMGU0NS1lMjU2LTQwZTctOTIyOS1jNGMzMWVmNzQwYWVfMS5qcGc.jpg",
  ];

  int _selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Clock Page"),
        backgroundColor: Colors.black54,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            //Header
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                foregroundImage: NetworkImage(
                    "https://edug.in/panel/head_admin/School/school_head/first_photo/DEMO59167.jpg"),
              ),
              accountName: Text("Demo account"),
              accountEmail: Text("dummy@mail.io"),
            ),
            //Options
            clockOptionTile(
              title: "Analog clock",
              val: _isAnalog,
              onChanged: (val) => setState(
                () => _isAnalog = !_isAnalog,
              ),
            ),
            clockOptionTile(
              title: "Strap clock",
              val: _isStrap,
              onChanged: (val) => setState(
                () => _isStrap = !_isStrap,
              ),
            ),
            clockOptionTile(
              title: "Digital clock",
              val: _isDigital,
              onChanged: (val) => setState(
                () => _isDigital = !_isDigital,
              ),
            ),
            clockOptionTile(
              title: "Image",
              val: _image,
              onChanged: (val) => setState(
                () => _image = !_image,
              ),
            ),
            Visibility(
              visible: _image,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _bgImages
                      .map(
                        (e) => GestureDetector(
                          onTap: () {
                            _selectedImage = _bgImages.indexOf(e);
                            setState(() {});
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            margin: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: _bgImages.indexOf(e) == _selectedImage
                                  ? Border.all(color: Colors.grey)
                                  : null,
                              image: DecorationImage(
                                image: NetworkImage(e),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: _image
              ? DecorationImage(
                  image: NetworkImage(
                    _bgImages[_selectedImage],
                  ),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            //BG
            Container(
              height: size.height * 0.63,
              width: size.height * 0.63,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.4),
              ),
            ),
            //AnalogClock
            Visibility(
              visible: _isAnalog,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //allDials
                  ...List.generate(
                    60,
                    (index) => Transform.rotate(
                      angle: index * (pi * 2) / 60,
                      child: Divider(
                        endIndent: index % 5 == 0
                            ? size.width * 0.88
                            : size.width * 0.9,
                        thickness: 2,
                        color: index % 5 == 0 ? Colors.red : Colors.grey,
                      ),
                    ),
                  ),
                  //hourHand
                  Transform.rotate(
                    angle: pi / 2,
                    child: Transform.rotate(
                      angle: d.hour * (pi * 2) / 12,
                      child: Divider(
                        indent: 50,
                        endIndent: size.width * 0.5 - 16,
                        color: Colors.black,
                        thickness: 4,
                      ),
                    ),
                  ),
                  //minuteHand
                  Transform.rotate(
                    angle: pi / 2,
                    child: Transform.rotate(
                      angle: d.minute * (pi * 2) / 60,
                      child: Divider(
                        indent: 30,
                        endIndent: size.width * 0.5 - 16,
                        color: Colors.black,
                        thickness: 2,
                      ),
                    ),
                  ),
                  //secondHand
                  Transform.rotate(
                    angle: pi / 2,
                    child: Transform.rotate(
                      angle: d.second * (pi * 2) / 60,
                      child: Divider(
                        indent: 20,
                        endIndent: size.width * 0.5 - 16,
                        color: Colors.red,
                        thickness: 2,
                      ),
                    ),
                  ),
                  //dot
                  const CircleAvatar(
                    radius: 10,
                  ),
                ],
              ),
            ),
            //StrapClock
            Visibility(
              visible: _isStrap,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //HourStrap
                  Transform.scale(
                    scale: 5,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      value: d.hour / 12,
                    ),
                  ),
                  //MinuteStrap
                  Transform.scale(
                    scale: 4,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      value: d.minute / 60,
                    ),
                  ),
                  //SecondStrap
                  Transform.scale(
                    scale: 3,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      value: d.second / 60,
                    ),
                  ),
                ],
              ),
            ),
            //DigitalClock
            Visibility(
              visible: _isDigital,
              child: Row(
                children: [
                  Text("${d.hour}:${d.minute}:${d.second}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
