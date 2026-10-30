
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const StudentInfoApp());
}

// ==========================================
// MAIN APPLICATION
// ==========================================

class StudentInfoApp extends StatelessWidget {
  const StudentInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CSS3344 Lab 02',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const StudentProfileScreen(),
    );
  }
}

// ==========================================
// STUDENT PROFILE SCREEN
// ==========================================

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CSS3344 Mobile App Dev - Lab 02'),
        centerTitle: true,
        backgroundColor:
        Theme.of(context).colorScheme.primaryContainer,
      ),

      // Adaptive Layout
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildPortraitView()
              : _buildLandscapeView();
        },
      ),
    );
  }

  // ==========================================
  // PORTRAIT LAYOUT
  // ==========================================

  Widget _buildPortraitView() {
    return ListView(
      children: const [
        StudentDetailsSection(),

        TitleSection(
          name: 'UTS',
          location: 'Sibu, Sarawak',
          starCount: 41,
        ),

        ImageSection(
          imagePath: 'assets/images/scenery.jpeg',
        ),

        ActionButtonsSection(),

        TextSection(),

        InteractivePickersSection(),
      ],
    );
  }

  // ==========================================
  // LANDSCAPE LAYOUT
  // ==========================================

  Widget _buildLandscapeView() {
    return Row(
      children: [
        Expanded(
          child: ListView(
            children: const [
              StudentDetailsSection(),
              TextSection(),
            ],
          ),
        ),

        Expanded(
          child: ListView(
            children: const [
              TitleSection(
                name: 'UTS',
                location: 'Sibu, Sarawak',
                starCount: 41,
              ),

              ImageSection(
                imagePath: 'assets/images/scenery.jpeg',
              ),

              ActionButtonsSection(),

              InteractivePickersSection(),
            ],
          ),
        ),
      ],
    );
  }
}

// ==========================================
// STUDENT DETAILS SECTION
// ==========================================

class StudentDetailsSection extends StatelessWidget {
  const StudentDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile.jpeg'),
            ),

            const SizedBox(height: 20),

            const Text(
              'Henry Goh Sii Hao',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Student ID: BCS24020048',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const Divider(height: 32),

            const Text(
              'Personal Life Goal / Quote:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              '"Happiness is not by chance, but by choice."',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                color: Colors.indigo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// TITLE SECTION
// ==========================================

class TitleSection extends StatelessWidget {
  final String name;
  final String location;
  final int starCount;

  const TitleSection({
    super.key,
    required this.name,
    required this.location,
    required this.starCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          Icon(
            Icons.star,
            color: Colors.red[500],
          ),

          const SizedBox(width: 4),

          Text('$starCount'),
        ],
      ),
    );
  }
}

// ==========================================
// IMAGE SECTION
// ==========================================

class ImageSection extends StatelessWidget {
  final String imagePath;

  const ImageSection({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// ==========================================
// ACTION BUTTONS SECTION
// ==========================================

class ActionButtonsSection extends StatelessWidget {
  const ActionButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton(Icons.call, 'CALL'),
        _buildButton(Icons.near_me, 'ROUTE'),
        _buildButton(Icons.share, 'SHARE'),
      ],
    );
  }

  Widget _buildButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.indigo,
          size: 28,
        ),

        const SizedBox(height: 8),

        Text(
          label,
          style: const TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// ==========================================
// TEXT SECTION
// ==========================================

class TextSection extends StatelessWidget {
  const TextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: Text(
        'UTS'
            '',
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}

// ==========================================
// INTERACTIVE PICKERS SECTION
// ==========================================

class InteractivePickersSection extends StatefulWidget {
  const InteractivePickersSection({super.key});

  @override
  State<InteractivePickersSection> createState() =>
      _InteractivePickersSectionState();
}

class _InteractivePickersSectionState
    extends State<InteractivePickersSection> {

  DateTime _selectedDate = DateTime.now();

  String _selectedRole = 'Student';

  final List<String> roles = [
    'Student',
    'Developer',
    'Designer',
  ];

  // ==========================================
  // MATERIAL DATE PICKER
  // ==========================================

  Future<void> _selectMaterialDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // ==========================================
  // CUPERTINO DATE PICKER
  // ==========================================

  void _showCupertinoDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 240,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: _selectedDate,
          minimumDate: DateTime(1950),
          maximumDate: DateTime.now(),
          onDateTimeChanged: (DateTime newDate) {
            setState(() {
              _selectedDate = newDate;
            });
          },
        ),
      ),
    );
  }

  // ==========================================
  // CUPERTINO ROLE PICKER
  // ==========================================

  void _showCupertinoRolePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 200,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: CupertinoPicker(
          itemExtent: 32,
          scrollController: FixedExtentScrollController(
            initialItem: roles.indexOf(_selectedRole),
          ),
          onSelectedItemChanged: (int index) {
            setState(() {
              _selectedRole = roles[index];
            });
          },
          children: roles.map((role) {
            return Center(
              child: Text(role),
            );
          }).toList(),
        ),
      ),
    );
  }

  // ==========================================
  // BUILD PICKERS UI
  // ==========================================

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Interactive Pickers (Lab 2.2)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              'Selected Date: '
                  '${_selectedDate.year}-'
                  '${_selectedDate.month.toString().padLeft(2, '0')}-'
                  '${_selectedDate.day.toString().padLeft(2, '0')}',
            ),

            const SizedBox(height: 8),

            Text(
              'Selected Role: $_selectedRole',
            ),

            const Divider(height: 24),

            // Material Date Picker

            const Text(
              'Material Date Picker',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            OutlinedButton.icon(
              onPressed: () {
                _selectMaterialDate(context);
              },
              icon: const Icon(Icons.calendar_today),
              label: const Text('Select Material Date'),
            ),

            const SizedBox(height: 12),

            // Cupertino Date Picker

            OutlinedButton.icon(
              onPressed: () {
                _showCupertinoDatePicker(context);
              },
              icon: const Icon(Icons.date_range),
              label: const Text('Cupertino Date Picker'),
            ),

            const Divider(height: 24),

            // Material Dropdown

            const Text(
              'Material Dropdown Picker',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            DropdownButton<String>(
              value: _selectedRole,
              isExpanded: true,
              items: roles.map((String role) {
                return DropdownMenuItem<String>(
                  value: role,
                  child: Text(role),
                );
              }).toList(),

              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedRole = newValue;
                  });
                }
              },
            ),

            const Divider(height: 24),

            // Cupertino Wheel Picker

            OutlinedButton.icon(
              onPressed: () {
                _showCupertinoRolePicker(context);
              },
              icon: const Icon(Icons.list),
              label: const Text('Cupertino Wheel Picker'),
            ),
          ],
        ),
      ),
    );
  }
}
