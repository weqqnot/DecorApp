import 'package:equatable/equatable.dart';
import 'package:decor_home_app/features/data/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/favorite_board.dart';
import '../../domain/repositories/favorite_repository.dart';

class FavoriteState extends Equatable {
  final List<FavoriteBoard> boards;

  const FavoriteState({required this.boards});

  @override
  List<Object> get props => [boards];
}

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository _repository;

  FavoriteCubit(this._repository) : super(FavoriteState(boards: _repository.boards));

  void loadBoards() {
    emit(FavoriteState(boards: _repository.boards));
  }

  void addBoard(String name) {
    _repository.addBoard(name);
    loadBoards();
  }

  void renameBoard(String id, String name) {
    _repository.renameBoard(id, name);
    loadBoards();
  }

  void deleteBoard(String id) {
    _repository.deleteBoard(id);
    loadBoards();
  }

  void addItemToBoard(String boardId, Product product) {
    _repository.addItemToBoard(boardId, product);
    loadBoards();
  }

  void removeItemFromBoard(String boardId, String productId) {
    _repository.removeItemFromBoard(boardId, productId);
    emit(FavoriteState(boards: _repository.boards));
  }
}
