import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_app/app/routes/app_pages.dart';

import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BookView'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: ()=>Get.toNamed(Routes.ADD_PEMINJAMAN),
        ),
        body: controller.obx((state) => ListView.separated(
          itemCount: state!.length,
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text("${state[index].judul}(${state[index].tahunTerbit})"),
              subtitle: Text("${state[index].penulis}, ${state[index].penerbit}"),
              trailing: ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.ADD_PEMINJAMAN,
                      parameters: {'id': (state[index].id ?? 0).toString(), 'judul': state[index].judul ?? ""}),
                  child: const Text("Pinjam")),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ))

    );
  }
}