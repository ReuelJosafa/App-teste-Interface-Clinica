import 'package:flutter/material.dart';

class MeusHorariosCard extends StatelessWidget {
  final int index;
  const MeusHorariosCard(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: index == 0 ? 16 : 0),
      child: Card(
        child: SizedBox(
          width: 344,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                        "https://storage.builderall.com//franquias/2/887308/editor-html/4345839.jpg"),
                  ),
                  title: Text("21/03/2021 - 15h30",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                  subtitle: Text(
                    "Thiago Henrique Gaspar Dutra filho",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontSize: 12, color: Color(0xFF666666)),
                  ),
                  trailing: Text(
                    "30min",
                    style: TextStyle(fontSize: 14, color: Color(0xFF6E798C)),
                  ),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Text(
                        index != 0
                            ? "Tratamento de canal e extração do dente 45, após extração do 21."
                            : "Breve descrição",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                ),
                // const Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          style: TextButton.styleFrom(
                              textStyle: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700)),
                          onPressed: () {},
                          child: const Text('CANCELAR',
                              style: TextStyle(color: Colors.red))),
                      TextButton(
                          style: TextButton.styleFrom(
                              primary: Colors.black,
                              backgroundColor: Colors.green,
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white)),
                          onPressed: () {},
                          child: const Text('CONFIRMAR',
                              style: TextStyle(color: Colors.white))),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
