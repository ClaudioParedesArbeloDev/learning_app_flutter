import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:learning_app/models/blogs_model.dart';
import 'package:learning_app/utils/constants.dart';
import 'package:learning_app/utils/colors.dart';
import 'package:http/http.dart' as http;

class Blogs extends StatelessWidget {
  const Blogs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Code & Lens - Blogs',
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
        child: BlogList(),
      )
    );
  }
}

class BlogList extends StatefulWidget {
  const BlogList({super.key});

  @override
  _BlogsListState createState() => _BlogsListState();
}

class _BlogsListState extends State<BlogList> {
  List<BlogModel> blogs = [];
  String error = '';
  String _formatDate(String date) {
    final DateTime dateTime = DateTime.parse(date);
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(dateTime);
  }

  Future<void> fetchBlogs() async {
    const url = '$uri/blogs';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final List<dynamic> blogsData = jsonResponse['data'];
        setState(() {
          blogs = blogsData.map((blog) => BlogModel.fromJson(blog)).toList();
          error = '';
        });
      } else {
        setState(() {
          error = 'Error al cargar blogs: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        error = 'Error al cargar blogs: $e';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchBlogs();
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

    if (blogs.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: blogs.length,
      itemBuilder: (context, index) {
        final blog = blogs[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                blog.image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 60,
                    height: 60,
                    color: ColorsUser.error,
                    child: const Icon(Icons.broken_image, color: ColorsUser.textPrimary),
                  );
                },
              ),

            ),
            title: Text(
              blog.title,
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 14,
                color: ColorsUser.cardBackground
                ),
              ),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Autor: ${blog.author}',
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 12,
                      color: ColorsUser.cardBackground
                      ),
                    ),
                    Text(
                      _formatDate(blog.createdAt),
                      style: TextStyle(
                        fontFamily: 'Lexend',
                        fontSize: 12,
                        color: ColorsUser.cardBackground
                        ),
                    ),
                  ],
                ),
            ),
            onTap: () {
              print('Blog seleccionado: ${blog.id}');
            },
          ),
        );
      },
    );
  }
}