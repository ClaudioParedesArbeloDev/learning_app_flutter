import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learning_app/models/users_model.dart';
import 'package:learning_app/utils/constants.dart';
import 'package:learning_app/utils/colors.dart';
import 'package:http/http.dart' as http;

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Code & Lens - Usuarios',
              style: TextStyle(
                color: ColorsUser.textPrimary,
                fontFamily: 'SpaceGrotesk',
                fontSize: 15,
              ),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: ColorsUser.textSecondary,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
          ],
        ),
        backgroundColor: ColorsUser.background,
      ),
      backgroundColor: ColorsUser.surface,
      body: const Center(
        child: UserList(),
      ),
    );
  }
}

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UserList> {
  List<UserModel> users = [];
  String error = '';

  Future<void> fetchUsers() async {
    const url = '$uri/users';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final List<dynamic> usersData = jsonResponse['data'];
        setState(() {
          users = usersData.map((user) => UserModel.fromJson(user)).toList();
          error = '';
        });
      } else {
        setState(() {
          error = 'Error al cargar usuarios: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        error = 'Error al cargar usuarios: $e';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    if (error.isNotEmpty) {
      return Center(
        child: Text(
          error,
          style: const TextStyle(color: ColorsUser.error),
          textAlign: TextAlign.center,
        ),
      );
    }

    if (users.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: ColorsUser.primary,
              child: Text(
                user.name[0],
                style: const TextStyle(color: ColorsUser.textPrimary),
              ),
            ),
            title: Text(
              user.name,
              style: const TextStyle(fontWeight: FontWeight.bold, color: ColorsUser.toggleBackground),
            ),
            trailing: const Icon(Icons.more_vert),
            onTap: () {
              print('Usuario seleccionado: ${user.name}');
            },
          ),
        );
      },
    );
  }
}
