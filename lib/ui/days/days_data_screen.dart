import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namoz_vaqtlari_uzb/blocs/dasy/days_bloc.dart';

import '../../model/enum_class.dart';

class DaysDataScreen extends StatelessWidget {
  DaysDataScreen({super.key});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) => BlocListener<DaysBloc, DaysState>(
        listener: (context, state) {
          if (state.states == States.failure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorText)));
          }
        },
        listenWhen: (previous, current) =>
            previous.states != current.states && current.errorText.isNotEmpty,
        child: Scaffold(
          appBar: AppBar(title: const Text('days data')),
          body: Column(
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                    label: Text('region'), border: OutlineInputBorder()),
                onTap: (){
                  context.read<DaysBloc>().add(GetDaysEvent(region:controller.text));
                },
              ),
              const SizedBox(height: 30),
              const DaysWidget(),
            ],
          ),
        ),
      );
}

class DaysWidget extends StatelessWidget {
  const DaysWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DaysBloc>().state;
    switch (state.states) {
      case States.initial:
      case States.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case States.failure:
        return const Icon(Icons.error_rounded, size: 200);
      case States.success:
        final data = state.dayData;
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.yellow),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Text(data.region),
              Column(children: [
                Text(data.weekday),
                Text(data.date.toString().substring(0,10)),
              ],)
            ],),
         const   SizedBox(height:20),
            Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text('bomdod: ${data.times!.tongSaharlik.toString()}'),
              Text('quyosh: ${data.times!.quyosh.toString()}'),],),
            const   SizedBox(height:20),
            Text('peshin: ${data.times!.peshin.toString()}'),
            const   SizedBox(height:20),
            Text('asr: ${data.times!.asr.toString()}'),
            const   SizedBox(height:20),
            Text('shom: ${data.times!.shomIftor.toString()}'),
            const   SizedBox(height:20),
            Text('hufton: ${data.times!.hufton.toString()}'),
          ],)
        );
    }
  }
}
