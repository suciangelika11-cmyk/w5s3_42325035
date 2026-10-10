
import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  // State untuk Switch
  bool isOn = false;

  // State dan pilihan bahasa pemrograman
  String selected = 'Flutter';
  final List<String> dropdownList = [
    'Flutter',
    'Dart',
    'Java',
    'Scala',
    'Python',
  ];

  // State untuk dropdown gender
  String selectedGender = 'Female';

  // State untuk Radio dan Checkbox
  String sex = 'male';
  bool isChecked = false;

  // Controller untuk menyimpan teks nama dan tanggal lahir
  final TextEditingController textController =
      TextEditingController(text: 'Suci Angelika Sinaga');

  final TextEditingController birthDateController =
      TextEditingController(text: '2006-01-01');

  @override
  void dispose() {
    textController.dispose();
    birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PAM Minggu 5 - Form'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. TextField untuk nama
            TextField(
              maxLength: 21,
              controller: textController,
              decoration: const InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.blueGrey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
                helperText: "What's your name?",
              ),
              onChanged: (value) {},
            ),

            const SizedBox(height: 12),

            // 2. Dropdown bahasa pemrograman
            Row(
              children: [
                const Flexible(
                  child: Text('Your Favorite Language:'),
                ),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: selected,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 20,
                  style: TextStyle(color: Colors.blue[600]),
                  items: dropdownList.map((language) {
                    return DropdownMenuItem<String>(
                      value: language,
                      child: Text(language),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() {
                        selected = value;
                      });
                    }
                  },
                ),
              ],
            ),

            const SizedBox(height: 12),

            // 3. Dropdown gender
            DropdownButtonFormField<String>(
              value: selectedGender,
              decoration: const InputDecoration(
                labelText: 'Gender',
                helperText: 'Your gender',
              ),
              items: ['Female', 'Male'].map((gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              onChanged: (String? value) {
                if (value != null) {
                  setState(() {
                    selectedGender = value;
                  });
                }
              },
            ),

            const SizedBox(height: 12),

            // 4. Switch untuk Connect Instagram
            Row(
              children: [
                const Text('Connect Instagram'),
                const SizedBox(width: 8),
                Switch(
                  value: isOn,
                  onChanged: (bool value) {
                    setState(() {
                      isOn = value;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 8),

            // 5. Radio untuk memilih gender
            Row(
              children: [
                const Text('Gender:'),
                const SizedBox(width: 8),
                Row(
                  children: [
                    Radio<String>(
                      value: 'male',
                      groupValue: sex,
                      onChanged: (String? value) {
                        if (value != null) {
                          setState(() {
                            sex = value;
                          });
                        }
                      },
                    ),
                    const Text('Male'),
                  ],
                ),
                const SizedBox(width: 8),
                Row(
                  children: [
                    Radio<String>(
                      value: 'female',
                      groupValue: sex,
                      onChanged: (String? value) {
                        if (value != null) {
                          setState(() {
                            sex = value;
                          });
                        }
                      },
                    ),
                    const Text('Female'),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 8),

            // 6. Checkbox persetujuan
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  activeColor: Colors.blue,
                  onChanged: (bool? value) {
                    if (value != null) {
                      setState(() {
                        isChecked = value;
                      });
                    }
                  },
                ),
                const Expanded(
                  child: Text(
                    'Agree Term & Conditions',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // 7. Date Picker untuk tanggal lahir
            InkWell(
              onTap: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                debugPrint('pickedDate: $pickedDate');

                if (pickedDate != null && mounted) {
                  setState(() {
                    birthDateController.text =
                        pickedDate.toString().split(' ')[0];
                  });
                }
              },
              child: IgnorePointer(
                child: TextField(
                  controller: birthDateController,
                  decoration: const InputDecoration(
                    labelText: 'Birth date',
                    labelStyle: TextStyle(color: Colors.blueGrey),
                    suffixIcon: Icon(Icons.date_range),
                    helperText: "What's your birth date?",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}