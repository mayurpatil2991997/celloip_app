import 'dart:convert';

import 'package:celloip_task/base_url/common_base_url.dart';
import 'package:celloip_task/core/routes.dart';
import 'package:celloip_task/model/data/data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListScreen extends StatefulWidget {
  const ListScreen({Key key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  TextEditingController searchController = TextEditingController();
  DataModel listData;

  Future<DataModel> displaydata() async {
    try {
      final response = await http.get(
        Uri.parse(
            '${BaseUrl.Url}/users?delay=3'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        print("TagsResponse $responseJson");
        listData = DataModel.fromJson(responseJson);
        return listData;
      }
    } catch (e) {
      print("TagsResponseCatchError $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(191, 218, 208, 1),
      body: SingleChildScrollView (
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 80.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.greenAccent[400],
                    backgroundImage: AssetImage("assets/images/girl.png"),
                    radius: 22, //Text
                  ),
                  Image.asset(
                    'assets/images/notification.png',
                    width: 30.0,
                  ),
                ],
              ),
              searchWidget(),
              const SizedBox(
                height: 10.0,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "12 JOBS RELEVANT TO YOU",
                  style: TextStyle(
                      color: Color.fromRGBO(67, 69, 69, 1),
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 14.0,
              ),
              FutureBuilder<DataModel>(
                future: displaydata(),
                builder: (context, snapShot) {
                  print("Future");
                  if (snapShot.hasData) {
                    return customCard(snapShot.data);
                  } else if (snapShot.hasError) {
                    return Center(
                        child: Text(
                          "Something went wrong",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ));
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: searchController,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          fillColor: Color.fromRGBO(19, 91, 70, 1),
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: Color.fromRGBO(19, 91, 70, 1),
              // width: 2.0,
            ),
          ),
          filled: true,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          suffixIcon: Icon(
            Icons.filter_list,
            color: Colors.white,
          ),
          hintStyle: TextStyle(color: Colors.white),
          hintText: "Search",
          // fillColor: Color.fromRGBO(19, 91, 70, 1),
        ),
      ),
    );
  }

  Widget customCard(DataModel item) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: ListView.builder(
        padding: EdgeInsets.all(2.0),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: item.data.length,
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, CTRoutes.details);
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                margin: EdgeInsets.all(4.0),
                alignment: Alignment.topLeft,
                // height: height * 0.15,
                width: width * 1,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: ClipOval(
                            child: Image.network(
                              item.data[index].avatar
                            ),
                          ),
                          radius: 18.0,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  item.data[index].firstName,
                                  style: TextStyle(
                                      color: Color.fromRGBO(13, 13, 13, 1),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0),
                                ),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  item.data[index].lastName,
                                  style: TextStyle(
                                      color: Color.fromRGBO(13, 13, 13, 1),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              item.data[index].email,
                              style: TextStyle(
                                  color: Color.fromRGBO(67, 69, 69, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Chip(
                      elevation: 0,
                      // padding: EdgeInsets.all(8),
                      backgroundColor: Color.fromRGBO(191, 218, 208, 1),
                      shadowColor: Colors.black,
                      label: Text(
                        'Celloip',
                        style: TextStyle(fontSize: 10),
                      ), //Text
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
