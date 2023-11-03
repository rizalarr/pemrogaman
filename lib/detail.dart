import 'package:flutter/material.dart';
import 'package:pemrogaman_2/data.dart';

class detailPage extends StatefulWidget {
  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  @override
  Widget build(BuildContext context) {
    final favSosMed =
        SocialMediaList.where((list) => list.isFavorite).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Recommendation'),
        backgroundColor: Color.fromARGB(255, 6, 45, 78),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: favSosMed.isNotEmpty
          ? Container(
              child: ListView.builder(
                itemCount: favSosMed.length,
                itemBuilder: (context, index) {
                  final data list = favSosMed[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: InkWell(
                      onTap: () {},
                      child: Card(
                        color: Color.fromARGB(255, 6, 45, 78),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    list.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      list.title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      list.linkUrl,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 130,
                  ),
                  Image.asset(
                    '../assets/noContent.png',
                    height: 250,
                    width: 250,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Tidak ada daftar favorit!",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
    );
  }
}
