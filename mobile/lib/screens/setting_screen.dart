import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';

import 'onboarding_screen.dart';



class SettingScreen extends StatelessWidget {

  const SettingScreen({super.key});



  Future<void> _logout(BuildContext context) async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.remove('token');

    if (context.mounted) {

      Navigator.pushReplacement(

        context,

        MaterialPageRoute(builder: (_) => const OnboardingScreen()),

      );

    }

  }



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFFF5F5F5),

      appBar: AppBar(

        backgroundColor: AppColors.primaryColor,

        title: const Text('Setting', style: TextStyle(color: Colors.white)),

        iconTheme: const IconThemeData(color: Colors.white),

        elevation: 0,

      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: SizedBox(

          width: double.infinity,

          height: 52,

          child: ElevatedButton.icon(

            onPressed: () => _logout(context),

            icon: const Icon(Icons.logout, color: Colors.white),

            label: const Text(

              'Logout',

              style: TextStyle(color: Colors.white, fontSize: 16),

            ),

            style: ElevatedButton.styleFrom(

              backgroundColor: AppColors.primaryColor,

              shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(12),

              ),

            ),

          ),

        ),

      ),

    );

  }

}