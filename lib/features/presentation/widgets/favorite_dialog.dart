import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/product.dart';
import '../bloc/favorite_cubit.dart';

Future<void> favorite(BuildContext context, Product product) async {
  final favoriteCubit = context.read<FavoriteCubit>();

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      final boards = favoriteCubit.state.boards;

      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Bạn muốn lưu item yêu thích này vào bảng nào?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ...boards.map((board) {
                return ListTile(
                  title: Text(board.name),
                  onTap: () {
                    favoriteCubit.addItemToBoard(board.id, product);
                    Navigator.pop(context); // Đóng bottom sheet
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Đã lưu vào bảng "${board.name}"')),
                    );
                  },
                );
              }).toList(),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Tạo bảng mới'),
                onTap: () async {
                  final TextEditingController controller = TextEditingController();

                  final result = await showDialog<String>(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Tạo bảng mới'),
                      content: TextField(
                        controller: controller,
                        decoration: const InputDecoration(hintText: 'Tên bảng'),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Huỷ'),
                        ),
                        TextButton(
                          onPressed: () {
                            final name = controller.text.trim();
                            if (name.isNotEmpty) {
                              Navigator.pop(context, name); // Trả về tên bảng
                            }
                          },
                          child: const Text('Tạo'),
                        ),
                      ],
                    ),
                  );

                  if (result != null) {
                    favoriteCubit.addBoard(result);
                    final newBoard = favoriteCubit.state.boards.last;
                    favoriteCubit.addItemToBoard(newBoard.id, product);

                    Navigator.pop(context); // Đóng bottom sheet sau khi tạo
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Đã tạo bảng "$result" và lưu sản phẩm')),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
