import 'package:flutter/material.dart';

class EditCategoryDialog extends StatelessWidget {
  final String categoryName;
  final Color categoryColor;
  final String categoryPercentage;

  const EditCategoryDialog({
    super.key,
    required this.categoryName,
    required this.categoryColor,
    required this.categoryPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(Icons.edit, size: 40, color: categoryColor),
                const SizedBox(width: 10),
                Text(
                  'Edit $categoryName Category?',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: categoryName,
              decoration: InputDecoration(
                labelText: 'Name of Category',
                filled: true,
                fillColor: categoryColor.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: categoryPercentage,
              decoration: InputDecoration(
                labelText: 'Category fund allocation as a percentage',
                filled: true,
                fillColor: categoryColor.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Tambahkan elemen lain seperti pengaturan warna kategori
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Discard', style: TextStyle(color: Colors.red)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implementasikan logika penyimpanan di sini
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
