import 'package:app/models/card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardNotifier extends StateNotifier<List<CardModel>> {
  CardNotifier() : super([]);

  void addCard(CardModel card) {
    state = [...state, card];
  }

  void removeCard(CardModel card) {
    state = state.where((c) => c.id != card.id).toList();
  }
}

final cardNotifierProvider =
    StateNotifierProvider<CardNotifier, List<CardModel>>(
        (ref) => CardNotifier());
