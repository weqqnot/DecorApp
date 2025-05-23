import 'package:decor_home_app/features/presentation/widgets/product/product_detail_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../data/models/favorite_board.dart';
import '../../bloc/favorite_cubit.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  String? _selectedBoardId; // để lưu bảng đang chọn (cho ví dụ)

  @override
  void initState() {
    super.initState();
    context.read<FavoriteCubit>().loadBoards();
  }

  Future<void> _showAddBoardDialog() async {
    final TextEditingController controller = TextEditingController();
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Tạo bảng mới'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: 'Tên bảng'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Huỷ'),
          ),
          TextButton(
            onPressed: () {
              final name = controller.text.trim();
              if (name.isNotEmpty) {
                context.read<FavoriteCubit>().addBoard(name);
              }
              Navigator.pop(context);
            },
            child: Text('Tạo'),
          ),
        ],
      ),
    );
  }

  Future<void> _showRenameBoardDialog(FavoriteBoard board) async {
    final TextEditingController controller =
        TextEditingController(text: board.name);
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Đổi tên bảng'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: 'Tên mới'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Huỷ'),
          ),
          TextButton(
            onPressed: () {
              final newName = controller.text.trim();
              if (newName.isNotEmpty) {
                context.read<FavoriteCubit>().renameBoard(board.id, newName);
              }
              Navigator.pop(context);
            },
            child: Text('Lưu'),
          ),
        ],
      ),
    );
  }

  Future<void> _showDeleteConfirmationDialog(FavoriteBoard board) async {
    final bool? confirmed = await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Xoá bảng'),
        content: Text('Bạn có chắc muốn xoá bảng "${board.name}" không?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Huỷ'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('Xoá'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      context.read<FavoriteCubit>().deleteBoard(board.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist', style: FontsApp.title(color: ColorsApp.terra)),
        centerTitle: true,
        actions: [
          IconButton(
            padding: EdgeInsets.all(20),
            constraints: BoxConstraints(),
            icon: Image.asset('assets/vectors/Bot-Add.png'),
            onPressed: _showAddBoardDialog,
          ),
        ],
      ),
      backgroundColor: ColorsApp.white,
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state.boards.isEmpty) {
            return const Center(
              child: Text('Chưa có bảng. Hãy tạo bảng của riêng bạn'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: state.boards.length,
            itemBuilder: (context, index) {
              final board = state.boards[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tiêu đề bảng + Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        board.name,
                      ),
                      Row(
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            icon: Image.asset('assets/vectors/Bot-Edit.png'),
                            onPressed: () => _showRenameBoardDialog(board),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            icon: Image.asset('assets/vectors/Bot-Trash.png'),
                            onPressed: () =>
                                _showDeleteConfirmationDialog(board),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  if (board.products.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text('Chưa có sản phẩm nào trong bảng này'),
                    )
                  else
                    Column(
                      children: board.products.map((product) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetailPage(product: product)));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: ColorsApp.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        product.image,
                                        width: 90,
                                        height: 90,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 4,
                                      right: 4,
                                      child: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<FavoriteCubit>()
                                              .removeItemFromBoard(
                                                  board.id, product.id);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.favorite,
                                            color: ColorsApp.terra,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.title,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        product.desc ?? 'No description',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        icon: Image.asset(
                                            'assets/vectors/Bot-Trash.png'),
                                        onPressed: () {
                                          context
                                              .read<FavoriteCubit>()
                                              .removeItemFromBoard(
                                                  board.id, product.id);
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  SizedBox(height: 12),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
