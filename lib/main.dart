import 'package:flutter/material.dart';

import 'helper/user_api_helper.dart';
import 'model/user.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle titlestyle = TextStyle(
    fontSize: 20, fontWeight: FontWeight.bold,
    color: Colors.black.withOpacity(0.4),
    //backgroundColor: Colors.grey,
  );

  TextStyle Mytyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    //backgroundColor: Colors.grey,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User Detail",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
            ),
            onPressed: () {
              setState(() {});
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: UserAPI.userAPI.fetchUserAPI(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            User? data = snapshot.data as User?;
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.8, 1),
                  colors: <Color>[
                    Color(0xffe91e63),
                    Color(0xfffb8c00),
                    // Color(0xff870160),
                    Color(0xffac255e),
                    Color(0xffca485c),
                    Color(0xffe16b5c),
                    Color(0xfff39060),
                    Color(0xffffb56b),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: Column(
                children: [
                  CircleAvatar(
                    // backgroundColor: Colors.black,
                    foregroundColor: Colors.teal,
                    radius: 80,
                    backgroundImage: NetworkImage(data!.image),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${data.title} ${data.firstName} ${data.lastName}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    indent: 50,
                    endIndent: 50,
                    thickness: 2,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 400,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [
                            Colors.orange,
                            Colors.orangeAccent,
                            Colors.red,
                            Colors.redAccent
                            //add more colors for gradient
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0, 0.2, 0.5, 0.8]
                          //set the stops number equal to numbers of color
                          ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 8, //spread radius
                          blurRadius: 7, // blur radius
                          offset: const Offset(0, 2),
                        )
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Username:",
                              style: titlestyle,
                            ),
                            Text(
                              "${data.userName}",
                              style: Mytyle,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Email:",
                              style: titlestyle,
                            ),
                            Text(
                              "${data.email}",
                              style: Mytyle,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Phone NO:",
                              style: titlestyle,
                            ),
                            Text(
                              "${data.phone}",
                              style: Mytyle,
                              //style: titlestyle,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Age:",
                              style: titlestyle,
                            ),
                            Text(
                              "${data.age}",
                              style: Mytyle,
                              //style: titlestyle,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Geder:",
                              style: titlestyle,
                            ),
                            Text(
                              "${data.gender}",
                              style: Mytyle,
                              //style: titlestyle,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Address:",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.4),
                      )),
                  Text(
                    "${data.address}",
                    style: Mytyle,
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
