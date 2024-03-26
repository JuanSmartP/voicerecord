import 'dart:async';

import 'package:flutter/material.dart';
import 'package:record/record.dart';

final recor = Record();
bool isRecording = false;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    recor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  ///AQUI ESTA LO IMPORTANTEEEE
  ///FUNCIO QUE INICIA LA GRABACION
  Future<void> voiceRecord() async {
    if (!isRecording && await recor.hasPermission()) {
      print('Iniciando grabacion');
      await recor.start();
      setTimeOut();
    }
  }

  void setTimeOut() {
    final duration = Duration(seconds: 2);
    Timer(duration, () {
      stopRecording();
    });
  }

  Future<void> stopRecording() async {
    print('Deteniendo');
    await recor.stop();
    final path = await recor.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: () {
          voiceRecord();
        },
        icon: const Icon(Icons.mic),
      ),
    );
  }
}
