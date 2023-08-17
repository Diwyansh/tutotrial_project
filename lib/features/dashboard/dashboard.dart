import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<String> data = [
      "https://slidebazaar.com/wp-content/uploads/2021/09/product-template-1.jpg",
      "https://graphicsfamily.com/wp-content/uploads/edd/2021/07/Shop-Products-Social-Media-Banner-Design-Template-scaled.jpg",
      "https://slidebazaar.com/wp-content/uploads/2021/09/product-banner-jpg.webp",
  ];
  
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.list_outlined,color: Colors.black,)),
        title: SizedBox(height:40,child: Image.asset("assets/images/icons/logo.png",fit: BoxFit.contain,)),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage("https://static.vecteezy.com/system/resources/previews/000/439/863/original/vector-users-icon.jpg"),
          )
        ],
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.keyboard_voice_outlined),
                  hintText: "Search Any Product..",
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(.5))),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(.3)))
                ),
              ),
              SizedBox(height: 25,),
              Row(
                children: [
                  Expanded(child: Text("All Categories",style: TextStyle(fontSize: 17),)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      foregroundColor: Colors.black
                    ),
                      onPressed: (){},
                      child: Text.rich(TextSpan(text: "Sort ",children: [
                    WidgetSpan(child: Icon(Icons.swap_vert_sharp,size: 20,)
                    )
                  ],style: TextStyle(height: 2)))),
                  VerticalDivider(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      foregroundColor: Colors.black
                    ),
                      onPressed: (){},
                      child: Text.rich(TextSpan(text: "Filter ",children: [
                    WidgetSpan(child: Icon(Icons.filter_alt_outlined,size: 20,)
                    )
                  ],style: TextStyle(height: 2)))),
                ],
              ),
              SizedBox(height: 25,),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index) => Padding(
                    padding: const EdgeInsets.only(right:20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          minRadius: 30,
                          backgroundImage: NetworkImage("https://paymentcloudinc.com/blog/wp-content/uploads/2021/08/product-ideas-to-sell.jpg"),
                        ),
                        Text("Beauty",style: TextStyle(fontSize: 12),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: PageView.builder(
                  onPageChanged: (val) {
                    activeIndex = val;
                    setState(() {
                      
                    });
                  },
                  itemCount: data.length,
                    itemBuilder: (contex,index) =>  Card(
                      clipBehavior: Clip.hardEdge,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Image.network(data[index],fit: BoxFit.fill,),
                    )
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: data.asMap().map((key, value) => MapEntry(key, Container(
                    height: 10,
                    width: 10,
                    margin: EdgeInsets.only(right: 7),
                    decoration: BoxDecoration(shape: BoxShape.circle,color: activeIndex == key  ? Colors.pinkAccent : Colors.grey.shade200)
                )
                )).values.toList(),
              ),
              SizedBox(height: 30,),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context,index) => Container(
                  clipBehavior: Clip.hardEdge,
                  height: 300,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey.shade200)
                  ),
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network("https://slidebazaar.com/wp-content/uploads/2021/09/product-banner-jpg.webp",height: 135,fit: BoxFit.fill,),
                      Text("Women Printed Kurta",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,height: 2),),
                      Text("Neque porro quisquam est qui dolorem ipsum quia",style: TextStyle(height: 1.5),),
                      Text("\$1500",style: TextStyle(fontSize: 16,height: 2,fontWeight: FontWeight.bold),),
                      SizedBox(height: 3,),
                      Row(
                        children: [
                          Text("\$2499",style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.grey.shade500),),
                          VerticalDivider(),
                          Text("40% off",style: TextStyle(color: Colors.red),),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(Icons.star_border,size: 16),
                                Icon(Icons.star_border,size: 16),
                                Icon(Icons.star_border,size: 16),
                                Icon(Icons.star_border,size: 16),
                                Icon(Icons.star_border,size: 16,),
                              ],
                            ),
                          ),
                          Expanded(child: Text("45676",style: TextStyle(color: Colors.grey.shade400),))
                        ],
                      ),
                    ],
                  ),
                ),
                ),
              ),
              SizedBox(height: 30,),
              SizedBox(
                height: 40,
                width: 110,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 35,
                        width: 90,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                                colors: [
                                  Color(0xFF0B3689),
                                  Color(0xFF3F92FF),
                            ])
                        ),
                      ),
                    ),
                    // Positioned(
                    //   left: 0,
                    //   top: 0,
                    //   child: Container(
                    //   height: 40,
                    //   width: 40,
                    //   decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       gradient: RadialGradient(
                    //           colors: [
                    //             Color(0xFF3F92FF),
                    //             Color(0xFF0B3689),
                    //           ]
                    //       )
                    //   ),
                    // )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
