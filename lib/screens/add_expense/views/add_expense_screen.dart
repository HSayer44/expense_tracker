import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final expenseController = TextEditingController();
  final categoryController = TextEditingController();
  final dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String iconSelected = '';
  List<String> myCategoryIcons = [
    'entertainment.png',
    'food.png',
    'home.png',
    'pet.png',
    'shopping.png',
    'tech.png',
    'travel.png'
  ];

  @override
  void initState() {
    setState(() {
      dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorTheme.background,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Add Expenses', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                const SizedBox(height: 16),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextFormField(
                    controller: expenseController,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(FontAwesomeIcons.euroSign, size: 16, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                TextFormField(
                  onTap: () {},
                  controller: categoryController,
                  textAlignVertical: TextAlignVertical.center,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'Category',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(FontAwesomeIcons.list, size: 16, color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: const Icon(FontAwesomeIcons.plus, size: 16, color: Colors.grey),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) {
                            bool isExpanded = false;
                            return StatefulBuilder(builder: (context, setState) {
                              return AlertDialog(
                                title: const Text('Create a new Category',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                                content: SingleChildScrollView(
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(height: 16),
                                        TextFormField(
                                          textAlignVertical: TextAlignVertical.center,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            label: const Text('Name', style: TextStyle(color: Colors.grey)),
                                            prefixIcon:
                                                const Icon(FontAwesomeIcons.ticket, size: 16, color: Colors.grey),
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(12),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        TextFormField(
                                          onTap: () {
                                            setState(() {
                                              isExpanded = !isExpanded;
                                            });
                                          },
                                          textAlignVertical: TextAlignVertical.center,
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            label: const Text('Icon', style: TextStyle(color: Colors.grey)),
                                            prefixIcon:
                                                const Icon(FontAwesomeIcons.icons, size: 16, color: Colors.grey),
                                            suffixIcon: Icon(
                                                isExpanded ? FontAwesomeIcons.chevronUp : FontAwesomeIcons.chevronDown,
                                                size: 16,
                                                color: Colors.grey),
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                              borderRadius: isExpanded
                                                  ? const BorderRadius.vertical(top: Radius.circular(12))
                                                  : BorderRadius.circular(12),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                        isExpanded
                                            ? Container(
                                                width: MediaQuery.of(context).size.width,
                                                height: 200,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: GridView.builder(
                                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                      mainAxisSpacing: 5,
                                                      crossAxisSpacing: 5,
                                                    ),
                                                    itemCount: myCategoryIcons.length,
                                                    itemBuilder: (context, index) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            iconSelected = myCategoryIcons[index];
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 25,
                                                          height: 25,
                                                          decoration: BoxDecoration(
                                                            color: iconSelected == myCategoryIcons[index] ? Colors.green.shade100 : Colors.grey.shade100,
                                                              border:  Border.all(
                                                                width: 2,
                                                                  color: iconSelected == myCategoryIcons[index] ? Colors.green : Colors.grey
                                                              ),
                                                              borderRadius: BorderRadius.circular(50),
                                                              image: DecorationImage(
                                                                image: AssetImage('assets/${myCategoryIcons[index]}'),
                                                              )),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                        const SizedBox(height: 16),
                                        TextFormField(
                                          textAlignVertical: TextAlignVertical.center,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            label: const Text('Color', style: TextStyle(color: Colors.grey)),
                                            prefixIcon:
                                                const Icon(FontAwesomeIcons.paintbrush, size: 16, color: Colors.grey),
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(12),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                          },
                        );
                      },
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: dateController,
                  onTap: () async {
                    final newDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2050),
                    );
                    if (newDate != null) {
                      setState(() {
                        dateController.text = DateFormat('dd/MM/yyyy').format(newDate);
                        selectedDate = newDate;
                      });
                    }
                  },
                  readOnly: true,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    label: const Text('Date', style: TextStyle(color: Colors.grey)),
                    prefixIcon: const Icon(FontAwesomeIcons.calendar, size: 16, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: kToolbarHeight,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: colorTheme.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    child: const Text('Submit',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
