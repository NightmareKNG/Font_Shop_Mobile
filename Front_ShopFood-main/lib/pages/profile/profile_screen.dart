import 'package:flutter/material.dart';
import 'package:store_app/api/api_profile.dart';
import 'package:store_app/widget/text_custom.dart';

import '../../models/user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // late User user;

  // Widget buildImage() {
  //   return ClipOval(
  //     child: Material(
  //       child: Image.asset(
  //         "Front_ShopFood-main\img\pngwing.com.png",
  //         fit: BoxFit.cover,
  //         width: 20,
  //         height: 20,
  //       ),
  //     ),
  //   );
  // }

  // List<User> user = [];
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getCustomers();
  // }

  // Future<void> getCustomers() async {
  //   final list = await ApiProfile.getProfile("1");
  //   setState(() {
  //     user = list;
  //     print(list[0].id);
  //     print("dfsdfs");
  //   });
  // }
  late User user;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    isLoading = true;

    ApiProfile.getProfile().then((profileFromServer) => {
          setState(() {
            user = profileFromServer;
            isLoading = false;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(39, 39, 39, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const SizedBox(height: 15),
                  // buildImage(),
                  // const CircleAvatar(
                  //   radius: 50,
                  //   backgroundImage: NetworkImage(
                  //       "data:image/jpeg;base64,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"),
                  // ),
                  Text(
                    "Profile",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 37,
                      color: Color.fromARGB(255, 182, 255, 218),
                      fontFamily: 'ChakraPetch',
                    ),
                  ),
                  const SizedBox(height: 7),

                  Text(
                    "User : ${user.firstName} ${user.lastName} ",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color.fromARGB(255, 89, 207, 148)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Text(
                  //   "username : ${user.cuser}",
                  //   style: TextStyle(
                  //     color: Colors.grey,
                  //   ),
                  // ),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Card(
                      color: Color.fromARGB(255, 79, 79, 79),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // const Icon(
                            //   Icons.account_circle,
                            //   size: 24,
                            // ),
                            const SizedBox(
                                // width: 20,
                                ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.account_circle,
                                  size: 50,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "FirstName",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 89, 207, 148)),
                                ),
                                Text(
                                  ">> ${user.firstName} <<",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                                const Text(
                                  "LastName",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 89, 207, 148)),
                                ),
                                Text(
                                  ">> ${user.lastName} <<",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Card(
                      color: Color.fromARGB(255, 79, 79, 79),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.lock_person,
                              size: 24,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Username",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 89, 207, 148),
                                  ),
                                ),
                                Text(
                                  "username : ${user.cuser}",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Card(
                      color: Color.fromARGB(255, 79, 79, 79),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.alarm_add,
                              size: 24,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "User createAt",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 89, 207, 148),
                                  ),
                                ),
                                Text(
                                  "createAt : ${user.createAt}",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Text("Latitude : ${user.createAt}"),
                  // Text("Longitude : ${user.createAt}"),
                  const SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
