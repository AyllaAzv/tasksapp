import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:tasks/model/tarefa.dart';
import 'package:tasks/pages/tarefa_form_page.dart';
import 'package:tasks/utils/nav.dart';

class TarefaGridView extends StatefulWidget {
  List<Tarefa> tarefas;

  TarefaGridView(this.tarefas);

  @override
  _TarefaGridViewState createState() => _TarefaGridViewState();
}

class _TarefaGridViewState extends State<TarefaGridView> {
  @override
  Widget build(BuildContext context) {
    return _gridView();
  }

  _gridView() {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      itemCount: widget.tarefas.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.8),
      ),
      itemBuilder: (context, index) {
        return _itemView(widget.tarefas, index);
      },
    );
  }

  _itemView(List<Tarefa> tarefas, int index) {
    Tarefa t = tarefas[index];

    return GestureDetector(
      onTap: () {
//        push(context, ProdutoPage(p));
      },
      onLongPress: () => _onLongClickProduto(context, t),
      child: Card(
        color: Colors.grey[100],
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    t.titulo.toUpperCase(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF23acbc)),
                  ),
                  Text(
                    t.descricao,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xFF23acbc), fontSize: 17),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(t.data, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF23acbc)),),
                  IconButton(
                    icon: Icon(Icons.edit),
                    color: Color(0xFF23acbc),
                    onPressed: () {
                      push(context, TarefaFormPage(tarefa: t));
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onLongClickProduto(BuildContext context, Tarefa tarefa) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 5),
              child: Text(
                tarefa.titulo,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: Text("Detalhes"),
              leading: Icon(
                Icons.shopping_basket,
              ),
              onTap: () {
                Navigator.pop(context);
//                push(context, TarefaFormPage(tarefa: tarefa));
              },
            ),
            ListTile(
              title: Text("Compartilhar"),
              leading: Icon(Icons.share),
              onTap: () {
                Navigator.pop(context);
                _onClickCompartilhar(tarefa);
              },
            ),
          ],
        );
      },
    );
  }

  _onClickCompartilhar(Tarefa tarefa) {
    Share.share(tarefa.descricao);
  }
}
