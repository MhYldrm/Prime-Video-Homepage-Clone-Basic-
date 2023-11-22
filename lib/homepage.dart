import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int secilenindeks = 0;

  int barrSecilenIndeks =0;

  int downIcerikIndeks = 0;

  var icerikListesi = [
    Image.asset("images/got.jpg"),
    Image.asset("images/lotr.png"),
    Image.asset("images/chernobly.jpeg"),
    Image.asset("images/theboys.png"),
    Image.asset("images/highcastle.png"),
    Image.asset("images/theoffice.png"),
    Image.asset("images/psycho.jpeg"),
    Image.asset("images/1984.png"),
    Image.asset("images/buyukacik.jpeg"),
    Image.asset("images/air.jpeg"),
    Image.asset("images/fotoram.png"),
    Image.asset("images/fortune.jpeg"),
    Image.asset("images/moonfall.jpeg"),
  ];

  var downIcerikler = [
    Image.asset("images/cmylmz.jpg"),
    Image.asset("images/dayi.jpg"),
    Image.asset("images/dag2.jpg"),
    Image.asset("images/vizontele.jpg"),
    Image.asset("images/bihter.jpg"),
    Image.asset("images/bergen.jpg"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label:"Anasayfa"),
          BottomNavigationBarItem(icon: Icon(Icons.file_download_outlined),label:"İndirilenler"),
          BottomNavigationBarItem(icon: Icon(Icons.search),label:"Bul"),
        ],
        currentIndex: secilenindeks,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (indeks){
          setState(() {
            secilenindeks = indeks;
          });
        },
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("images/appbar.jpg",width: 430,height: 140,),
            SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider(
                      items: icerikListesi,
                      options: CarouselOptions(
                        height: 220,
                        autoPlay: false,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayAnimationDuration: const Duration(milliseconds: 800),
                        autoPlayInterval: const Duration(seconds: 2),
                        enlargeCenterPage: true,
                        onPageChanged: (indeks,reason){
                          setState(() {
                            barrSecilenIndeks = indeks;
                          });
                        }
                      ),
                  ),
                  const SizedBox(height: 5,),
                  AnimatedSmoothIndicator(
                      activeIndex: barrSecilenIndeks,
                      count: icerikListesi.length,
                    effect:  WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 10,
                      dotColor: Colors.grey.shade600,
                      activeDotColor: Colors.white,
                      paintStyle: PaintingStyle.fill,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Prime",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,color: Colors.blue),),
                  Text("-Türk Filmleri ve Dizileri  >",style: TextStyle(fontSize: 23,color: Colors.white,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.asset("images/cmylmz.jpg"),
                  Image.asset("images/dayi.jpg"),
                  Image.asset("images/dag2.jpg"),
                  Image.asset("images/vizontele.jpg"),
                  Image.asset("images/bihter.jpg"),
                  Image.asset("images/bergen.jpg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
