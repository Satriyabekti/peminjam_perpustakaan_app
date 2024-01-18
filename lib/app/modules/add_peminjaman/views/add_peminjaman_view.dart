import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_app/app/routes/app_pages.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddPeminjamanView'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(key: controller.formkey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.tglpinjamController,
                decoration: InputDecoration(
                    hintText: "Masukkan Tanggal Pinjam"),
                validator: (value){
                  if(value!.isEmpty){
                    return "Tanggal Pinjam tidak boleh kosong";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.tglkembaliController,
                decoration: InputDecoration(
                    hintText: "Masukkan Tanggal Kembali"),
                validator: (value){
                  if(value!.isEmpty){
                    return "Tanggal Kembali tidak boleh kosong";
                  }
                  return null;
                },
              ),
              Obx(() {
                return controller.loading.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(onPressed: () => controller.post(), child: const Text("Pinjam"));
              }).paddingOnly(top: 16)
            ],
          ).paddingOnly(left: 16, right: 16),
        )
      ),
    );
  }
}
