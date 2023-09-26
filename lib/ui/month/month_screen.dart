import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namoz_vaqtlari_uzb/blocs/months/months_bloc.dart';
import 'package:namoz_vaqtlari_uzb/model/enum_class.dart';

class MonthDataScreen extends StatelessWidget {
   MonthDataScreen({super.key});
   TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) => BlocListener<MonthsBloc, MonthsState>(
        listener: (context,state) {
          if (state.states == States.failure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorText)));
          }
        },
        listenWhen: (previous, current) =>
            previous.states != current.states && current.errorText.isNotEmpty,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('month data'),
          ),
          body: Column(children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  label: Text('region'), border: OutlineInputBorder()),
              onChanged: (v){
                context.read<MonthsBloc>().add(GetMonthsDataEvent(monthNumber:int.parse(controller.text)));
              },
            ),
            const SizedBox(height: 30),
            const MonthWidget(),
          ],),
        ),
      );
}

class MonthWidget extends StatelessWidget {
  const MonthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MonthsBloc>().state;
    switch (state.states) {
      case States.initial:
      // TODO: Handle this case.
      case States.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case States.failure:
        return const Icon(Icons.error_rounded, size: 200);
      case States.success:
        return Expanded(
          child: ListView(
            children: [
              ...List.generate(state.monthData.length, (index) {
                final data = state.monthData[index];
                return Container(
                  margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.teal),
                  ),
                  child: Column(
                    children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                       Text(data.region),
                       Text(data.weekday),
                     ],),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('month: ${data.month.toString()}'),
                          Text('day: ${data.day.toString()}'),
                        ],),
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
                    ],
                  ),
                );
              })
            ],
          ),
        );
    }
  }
}
