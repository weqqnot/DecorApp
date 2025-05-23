import 'package:decor_home_app/features/data/models/product.dart';

import '../../data/models/favorite_board.dart';


class FavoriteRepository {
  final List<FavoriteBoard> _boards = [];

  List<FavoriteBoard> get boards => List.unmodifiable(_boards);

  void addBoard(String name) {
    final newBoard = FavoriteBoard(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      products: [],
    );
    _boards.add(newBoard);
  }

  void renameBoard(String boardId, String newName) {
    final board = _boards.firstWhere((b) => b.id == boardId);
    board.name = newName;
  }

  void deleteBoard(String boardId) {
    _boards.removeWhere((b) => b.id == boardId);
  }

  void addItemToBoard(String boardId, Product products) {
    final board = _boards.firstWhere((b) => b.id == boardId);
    if (!board.products.any((i) => i.id == products.id)) {
      board.products.add(products);
    }
  }

  void removeItemFromBoard(String boardId, String productId) {
    final boardIndex = _boards.indexWhere((b) => b.id == boardId);
    if (boardIndex == -1) return;

    final board = _boards[boardIndex];

    final updatedProducts = board.products
        .where((product) => product.id != productId)
        .toList();

    _boards[boardIndex] = board.copyWith(products: updatedProducts);
  }

}
