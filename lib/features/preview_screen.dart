import 'package:flutter/material.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({Key? key}) : super(key: key);

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {

  PageController _controller = PageController();

  List<Map<String, dynamic>> data = [
    {
      "image" : "assets/images/sales.png",
      "title" : "Choose Products",
      "desc" : "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."
    },
    {
      "image" : "assets/images/shopping.png",
      "title" : "Make Payment",
      "desc" : "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."
    },
    {
      "image" : "assets/images/shopping2.png",
      "title" : "Get Your Order",
      "desc" : "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."
    },
  ];

  int pageNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 20,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text.rich(
            TextSpan(text: "$pageNumber", children: [
              TextSpan(text: "/3", style: TextStyle(color: Colors.grey))
            ]),
            style: TextStyle(color: Colors.black, height: 2.25, fontSize: 16),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {Navigator.pushNamed(context, "signIn");},
              child: Text(
                "Skip",
                style: TextStyle(fontSize: 16),
              ))
        ],
      ),
      body: PageView.builder(
          controller: _controller,
          itemCount: data.length,
          onPageChanged: (val) {
            pageNumber = val+1;
            setState(() {

            });
          },
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: centerContainer(
                  url: data[index]["image"],
                  title: data[index]["title"],
                  desc: data[index]["desc"]
                ),
              )),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {
                _controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease);
              },
              child: Text("Prev")),
          Text("Middle"),
          TextButton(
              onPressed: () {
                if(pageNumber == data.length) {
                  Navigator.pushNamed(context, "signIn");
                } else {
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                }
              },
              child: Text("Next")),
        ],
      ),
    );
  }

  Column centerContainer({required String url, required String title, required String desc}) {
    return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(url),
                  Text(
                    title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    desc,
                    style: TextStyle(color: Colors.grey, height: 1.25),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
  }
}
