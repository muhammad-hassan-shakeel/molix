import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 16),
        CircleAvatar(
          radius: 50,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: const Icon(
            Icons.person,
            size: 80,
          ),
        ),
        const SizedBox(height: 16),
        Align(
          child: Text('VIP user',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary)),
        ),
        const SizedBox(height: 16),
        const Divider(thickness: 2),
        const SizedBox(height: 16),
        ListTile(
          leading: const Icon(Icons.wallet),
          title: const Text('Account number'),
          subtitle: const Text('0x8347689327489327'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.contact_emergency_outlined),
          title: const Text('National ID'),
          subtitle: const Text('380279282457909890'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.phone),
          title: const Text('Phone number'),
          subtitle: const Text('+998 99 999 99 99'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.calendar_today),
          title: const Text('Date of birth'),
          subtitle: const Text('7th July 1947'),
          onTap: () {},
        ),
      ],
    );
  }
}
