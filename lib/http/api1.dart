import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_008/http/api_model.dart';
import 'package:http/http.dart' as http;

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  List<PostModels> postList = [];

  Future<List<PostModels>> getPostApi() async {
    try {
      final response =
          await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        // Convert the data into a list of PostModels
        return data.map((json) => PostModels.fromJson(json)).toList();
      } else {
        // Handle error response
        throw Exception(
            'Failed to load posts. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions or errors
      print('Error fetching posts: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get API"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder<List<PostModels>>(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  // Update postList with the fetched data
                  postList = snapshot.data!;

                  return ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.grey[200],
                        shadowColor: Colors.deepOrange,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "ID:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(postList[index].id.toString()),
                              Text("UserID: ${postList[index].userId}"),
                              const Text(
                                "Title:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                postList[index].title.toString(),
                                textAlign: TextAlign.justify,
                              ),
                              const Text(
                                "Body:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                postList[index].body.toString(),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('No data found'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
