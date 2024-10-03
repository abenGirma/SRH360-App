import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 224, 218, 199),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              _buildHeader(),
              _buildBody(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 20),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Image.asset(
              'assets/img/back.png',
              scale: 3,
              color: Colors.black54,
            ),
          ),
          const Text(
            'Settings',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Account'),
            const SizedBox(height: 30),
            _buildButton('Change Password', _changePassword),
            const SizedBox(height: 30),
            _buildButton('Log Out', _logOut),
            const SizedBox(height: 30),
            _buildButton('Delete Account', _deleteAccount),
            const SizedBox(height: 30),
            _buildButton('Language', _changeLanguage),
            const SizedBox(height: 30),
            _buildSectionTitle('Privacy & Security'),
            const SizedBox(height: 30),
            _buildButton('Terms & Conditions', _showTermsAndConditions),
            const SizedBox(height: 30),
            _buildButton('Privacy Policy', _showPrivacyPolicy),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    );
  }

  Widget _buildButton(String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 224, 218, 199),
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size(double.infinity, 60),
        padding: const EdgeInsets.symmetric(horizontal: 20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Align text to the start
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  // Callback functions for each button
  void _changePassword() {
    print('Change Password pressed');
  }

  void _logOut() {
    print('Log Out pressed');
  }

  void _deleteAccount() {
    print('Delete Account pressed');
  }

  void _changeLanguage() {
    print('Change Language pressed');
  }

  void _showTermsAndConditions() {
    print('Terms & Conditions pressed');
  }

  void _showPrivacyPolicy() {
    print('Privacy Policy pressed');
  }
}
