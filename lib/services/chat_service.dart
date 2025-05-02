import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage({
    required String chatId, 
    required String senderId,
    required String receiverId,
    required String text,
  }) async {
    final messageData = {
      'senderId': senderId,
      'text': text, 
      'timestamp': FieldValue.serverTimestamp(),
      'type': 'text',
    };

    // Add the message to the 'messages' subcollection of the specific chat
    await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add(messageData);

    // Update the 'chats' collection with the last message and timestamp
    await _firestore.collection('chats').doc(chatId).set({
      'isGroup': false,
      'members': [senderId, receiverId],
      'lastMessage': text,
      'lastMessageTime': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }
}
