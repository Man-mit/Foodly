import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isDarkMode
                        ? [Colors.orange, Colors.deepOrange]
                        : [Colors.orange.shade300, Colors.orange],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/profile.jpg'),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Manmit",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "manmit@gmail.com",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildSection(
                context,
                "Account Settings",
                [
                  _buildListTile(
                    context,
                    "Edit Profile",
                    Icons.person_outline,
                    () {
                      // Navigate to edit profile
                    },
                  ),
                  _buildListTile(
                    context,
                    "Change Password",
                    Icons.lock_outline,
                    () {
                      // Navigate to change password
                    },
                  ),
                  _buildListTile(
                    context,
                    "Addresses",
                    Icons.location_on_outlined,
                    () {
                      // Navigate to addresses
                    },
                  ),
                  _buildListTile(
                    context,
                    "Payment Methods",
                    Icons.payment_outlined,
                    () {
                      // Navigate to payment methods
                    },
                  ),
                ],
              ),
              _buildSection(
                context,
                "Preferences",
                [
                  _buildListTile(
                    context,
                    "Dark Mode",
                    Icons.dark_mode_outlined,
                    () {
                      themeProvider.toggleTheme();
                    },
                    trailing: Switch(
                      value: isDarkMode,
                      onChanged: (value) {
                        themeProvider.toggleTheme();
                      },
                      activeColor: Colors.orange,
                    ),
                  ),
                  _buildListTile(
                    context,
                    "Notifications",
                    Icons.notifications_outlined,
                    () {
                      // Navigate to notifications
                    },
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {
                        // Handle notification toggle
                      },
                      activeColor: Colors.orange,
                    ),
                  ),
                  _buildListTile(
                    context,
                    "Language",
                    Icons.language_outlined,
                    () {
                      // Navigate to language settings
                    },
                    trailing: const Text(
                      "English",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),
              _buildSection(
                context,
                "Support",
                [
                  _buildListTile(
                    context,
                    "Help Center",
                    Icons.help_outline,
                    () {
                      // Navigate to help center
                    },
                  ),
                  _buildListTile(
                    context,
                    "Contact Us",
                    Icons.contact_support_outlined,
                    () {
                      // Navigate to contact us
                    },
                  ),
                  _buildListTile(
                    context,
                    "About",
                    Icons.info_outline,
                    () {
                      // Navigate to about
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    _showLogoutDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
      BuildContext context, String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildListTile(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap, {
    Widget? trailing,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              // Handle logout
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Logged out successfully'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text(
              "Logout",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
