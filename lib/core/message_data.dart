import 'package:flutter/material.dart';

class MessageData extends ChangeNotifier {
  List<MessageInfo> messages = []; // Lista de mensagens programadas

  void addMessage(String message, String titulo, DateTime selectedDate, String selectedDropdownValue) {
    messages.add(MessageInfo(message: message, titulo: titulo, selectedDate: selectedDate));
    notifyListeners();
  }
}

class MessageInfo {
  final String message;
  final String titulo;
  final DateTime selectedDate = DateTime.now(); // Campo de data e hora

  MessageInfo({
    required this.message,
    required this.titulo,
    required DateTime selectedDate,

  });
}
