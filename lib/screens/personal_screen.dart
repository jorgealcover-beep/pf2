import 'package:flutter/material.dart';
import 'package:pf2/screens/home_screen.dart';
class PersonalScreen extends StatefulWidget{
  const PersonalScreen({super.key, required this.persona});
  final Persona persona;
  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _birthDateController;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.persona.name);
    _lastNameController = TextEditingController(text: widget.persona.lastName);
    _emailController = TextEditingController(text: widget.persona.emailAdress);
    _passwordController = TextEditingController(text: widget.persona.password);
    _birthDateController = TextEditingController(
      text: _formatDate(widget.persona.birthDate),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  Future<void> _pickBirthDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: widget.persona.birthDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        widget.persona.birthDate = picked;
        _birthDateController.text = _formatDate(picked);
      });
    }
  }

  void _saveChanges() {
    widget.persona.name = _nameController.text.trim();
    widget.persona.lastName = _lastNameController.text.trim();
    widget.persona.emailAdress = _emailController.text.trim();
    widget.persona.password = _passwordController.text;
    widget.persona.birthDate = widget.persona.birthDate;

    Navigator.of(context).pop(widget.persona);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar perfil'),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(labelText: 'Apellido'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Correo electrónico'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Contraseña'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _birthDateController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Fecha de nacimiento',
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: _pickBirthDate,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveChanges,
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}