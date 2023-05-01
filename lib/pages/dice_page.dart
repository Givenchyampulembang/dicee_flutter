import 'dart:math';
import 'package:flutter/material.dart';

// <-- Menggunakan Statefulwidget karena widget/pages ini akan berubah2

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // <-- Merupakan variabel data dadu kiri //
  int leftDiceNumber = 1;

  // <-- Merupakan Variabel data dadu kanan//

  int rightDiceNumber = 1;

  // Mengambungkan dua variabel diatas

  // Variabel yang akan di gunakan dalam onPressed buttom
  void changeDiceFace() {
    // setState untuk mengupdate variable baru yang lebih stabil yang ditambahkan dalam onPressed (jika dipencet)
    setState(
      () {
        // <-- data angka akan terupdate dari variable leftDiceNumber-->
        leftDiceNumber = Random().nextInt(6) +
            1; // Menambahkan + 1 karna jika tidak ditambahkan angka akan memulai dari 0 dan gambar untuk dadu 0 tidak ada sehinggah bisa menyebabkan erorr
        rightDiceNumber = Random().nextInt(6) +
            1; // ditambahkan untuk mengubah urutan dadu pada gambar sebelah kanan
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        // <--Fungsi Children Untuk menambahkan widget-widget lebih banyak -->
        children: <Widget>[
          // Membuat Tombol Sebelah Kiri
          Expanded(
            // <-- menggunakan Expanded agar assets gambarnya tidak melebihi atau luas dari layar
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                changeDiceFace();
              },
              child: Image.asset(
                  'images/dice$leftDiceNumber.png'), // harus selalu di tambahkan agar gambar dadu bisa terupdate!
            ),
          ),
          Expanded(
            // Membuat Tombol Sebelah Kanan
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                setState(
                  () {
                    changeDiceFace();
                  },
                );
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
