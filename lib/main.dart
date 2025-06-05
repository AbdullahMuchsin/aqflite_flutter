import 'package:flutter/material.dart';
import 'package:learn_sqflite/models/note.dart';
import 'package:learn_sqflite/models/user.dart';
import 'package:learn_sqflite/providers/app_provider.dart';
import 'package:learn_sqflite/repository/app_repository.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRepository repository = AppRepository();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppProvider(repository),
      child: MaterialApp(
        title: 'SQFLite Multi-table Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: UserListScreen(),
      ),
    );
  }
}

class UserListScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _showAddUserDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text('Add User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _nameController.clear();
                _emailController.clear();
                Navigator.of(ctx).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text.trim();
                final email = _emailController.text.trim();
                if (name.isNotEmpty && email.isNotEmpty) {
                  final user = User(name: name, email: email);
                  Provider.of<AppProvider>(
                    context,
                    listen: false,
                  ).addUser(user);
                }
                _nameController.clear();
                _emailController.clear();
                Navigator.of(ctx).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddUserDialog(context),
        child: Icon(Icons.add),
      ),
      body: Consumer<AppProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (provider.users.isEmpty) {
            return Center(child: Text('No users found.'));
          }
          return ListView.builder(
            itemCount: provider.users.length,
            itemBuilder: (ctx, i) {
              final user = provider.users[i];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => UserNoteScreen(user: user),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class UserNoteScreen extends StatefulWidget {
  final User user;

  UserNoteScreen({required this.user});

  @override
  _UserNoteScreenState createState() => _UserNoteScreenState();
}

class _UserNoteScreenState extends State<UserNoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<AppProvider>(
      context,
      listen: false,
    ).loadNotesForUser(widget.user.id!);
  }

  void _showAddNoteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text('Add Note for ${widget.user.name}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: _contentController,
                decoration: InputDecoration(labelText: 'Content'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _titleController.clear();
                _contentController.clear();
                Navigator.of(ctx).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final title = _titleController.text.trim();
                final content = _contentController.text.trim();
                if (title.isNotEmpty) {
                  final note = Note(
                    userId: widget.user.id!,
                    title: title,
                    content: content.isEmpty ? null : content,
                  );
                  Provider.of<AppProvider>(
                    context,
                    listen: false,
                  ).addNote(note);
                }
                _titleController.clear();
                _contentController.clear();
                Navigator.of(ctx).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes for ${widget.user.name}')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddNoteDialog(context),
        child: Icon(Icons.add),
      ),
      body: Consumer<AppProvider>(
        builder: (context, provider, _) {
          final notes = provider.userNotes[widget.user.id] ?? [];
          if (notes.isEmpty) {
            return Center(child: Text('No notes for this user.'));
          }
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (ctx, i) {
              final note = notes[i];
              return ListTile(
                title: Text(note.title),
                subtitle: Text(note.content ?? '-'),
              );
            },
          );
        },
      ),
    );
  }
}
