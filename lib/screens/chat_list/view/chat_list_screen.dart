import 'package:chat_app/screens/chat_list/widgets/header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/screens/chat_detail/chat_detail_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    double padding = size.width * 0.03;
    double fontSize = size.width * 0.05;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            Padding(
              padding: EdgeInsets.all(padding),
              child: Text("Pinned Chats"),
            ),

            SizedBox(
              height: size.height * 0.05,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    height: size.height * 0.5,
                    width: size.width * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.all(padding),
              child: Text("Recent Chats"),
            ),

            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();

                var users =
                    snapshot.data!.docs
                        .where((doc) => doc.id != currentUserId)
                        .toList();

                return SizedBox(
                  height: size.height * 0.7,
                  child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      var user = users[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => ChatDetailScreen(receiverId: user.id),
                            ),
                          );
                        },
                        child: Container(
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.deepPurpleAccent,
                              ),
                              SizedBox(width: size.width * 0.03),
                              Text(user['username']),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
