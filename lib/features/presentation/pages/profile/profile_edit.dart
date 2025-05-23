import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../data/repositories/user_service.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({Key? key}) : super(key: key);

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  File? _imageFile;
  String gender = 'Male';

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    try {
      final user = await UserService.getProfile();
      print("👤 User loaded: ${user.toJson()}");
      setState(() {
        _nameController.text = user.fullName;
        _emailController.text = user.email;
        _phoneController.text = user.phone ?? '';
        _dobController.text = user.birthday ?? '';
        // Nếu có giới tính trong UserDto, thì bạn set ở đây
        // gender = user.gender ?? 'Male'; // nếu bạn có thêm trường gender
      });
    } catch (e, stacktrace) {
      debugPrint('Error loading profile: $e');
      debugPrint('$stacktrace');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load profile: $e')),
      );

    }
  }


  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _imageFile = File(picked.path);
      });
    }
  }

  Future<void> _updateProfile() async {
    final name = _nameController.text;
    final email = _emailController.text;

    // TODO: Gửi dữ liệu này về backend qua API
    print("Saving profile:");
    print("Name: $name");
    print("Email: $email");
    print("Gender: $gender");

    // Bạn có thể dùng `http.MultipartRequest` để gửi ảnh nếu cần
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile updated successfully")),
    );
  }

  Widget _buildGenderButton(String label) {
    final isSelected = gender == label;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => gender = label),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            border: Border.all(color: ColorsApp.salmon),
            borderRadius: BorderRadius.circular(20),
            color: isSelected ? ColorsApp.salmon : ColorsApp.white,
          ),
          alignment: Alignment.center,
          child: Text(label),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: _imageFile != null
                      ? FileImage(_imageFile!)
                      :  AssetImage('assets/images/avatar.jpg') ,
                ),
                Positioned(
                  child: InkWell(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: ColorsApp.salmon,
                      child: Icon(Icons.camera_alt, size: 15, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text('Nguyễn Trang', style: TextStyle(fontWeight: FontWeight.bold)),
            Text("ID: 25030024", style: TextStyle(color: Colors.grey)),

            SizedBox(height: 20),
            _buildTextField("Full Name", _nameController),
            _buildTextField("Email", _emailController),
            _buildTextField("Mobile Number", _phoneController),
            _buildTextField("Date Of Birth", _dobController),

            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Gender", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                _buildGenderButton("Male"),
                _buildGenderButton("Female"),
              ],
            ),
            SizedBox(height: 30),

            ElevatedButton(
              onPressed: _updateProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsApp.salmon,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: Text("Update Profile", style: FontsApp.subTitle(color: ColorsApp.terra),),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
