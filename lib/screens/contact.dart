import 'package:flutter/material.dart';
import 'package:learning_app/src/customs/colors.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  Future<void> _sendEmail() async {
    if (_formKey.currentState?.validate() ?? false) {
      final String name = _nameController.text;
      final String phone = _phoneController.text;
      final String message = _messageController.text;

      final Email email = Email(
        body: 'Nombre: $name\nWhatsapp: $phone\nMensaje: $message',
        subject: 'Nuevo mensaje desde la app',
        recipients: ['claudioparedesarbelo@gmail.com'],
        isHTML: false,
      );

      try {
        await FlutterEmailSender.send(email);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Mensaje enviado exitosamente')
          )
        );
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al enviar mensaje: $error')
          ),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Code & Lens - Sobre Nosotros',
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
            )
          ]
        ),
        backgroundColor: ColorsUser.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su nombre';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Whatsapp'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su número de Whatsapp';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(labelText: 'Mensaje'),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un mensaje';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _sendEmail,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsUser.textSecondary,
                  ),
                  child: const Text(
                    'Enviar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
