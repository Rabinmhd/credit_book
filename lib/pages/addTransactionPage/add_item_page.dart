import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddItemPage extends StatelessWidget {
  AddItemPage({super.key});

  TextEditingController amountController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController textController = TextEditingController();

  List<String> dropdownItems = [];
  ValueNotifier<String?> selectedDropdownValue = ValueNotifier(null);
  ValueNotifier<bool> isRadioButtonSelected = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credit Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Enter Name'),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter Amount'),
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder(
              valueListenable: isRadioButtonSelected,
              builder: (context, value, _) {
                return Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: isRadioButtonSelected.value,
                      onChanged: (bool? value) {
                        isRadioButtonSelected.value = value!;
                      },
                    ),
                    const Text('To get'),
                    Radio(
                      value: false,
                      groupValue: isRadioButtonSelected.value,
                      onChanged: (bool? value) {
                        isRadioButtonSelected.value = value!;
                      },
                    ),
                    const Text('To give'),
                  ],
                );
              },
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200], // Light gray color
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text("Select Type"),
                  const SizedBox(
                    height: 10,
                  ),
                  ValueListenableBuilder<String?>(
                    valueListenable: selectedDropdownValue,
                    builder: (context, value, child) {
                      return DropdownButton<String>(
                        value: value,
                        items: dropdownItems
                            .map((String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        onChanged: (String? newValue) {
                          selectedDropdownValue.value = newValue;
                        },
                        hint: const Text('Select Item'),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => _showAddItemPopup(context),
                    child: const Text('Add Item'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black12),
                      child: const Center(
                          child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Save",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showAddItemPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Item'),
          content: TextField(
            controller: textController,
            decoration: const InputDecoration(labelText: 'Enter Text'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                dropdownItems.add(textController.text);
                textController.clear();

                selectedDropdownValue.value = dropdownItems.last;

                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
