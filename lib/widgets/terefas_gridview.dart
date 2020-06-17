
import 'package:flutter/material.dart';
import 'package:tasks/entitys/tarefa.dart';


class TarefasGridView extends StatefulWidget {
  List<Tarefa> tarefas;

  TarefasGridView(this.tarefas);

  @override
  _TarefasGridViewState createState() => _TarefasGridViewState();
}

class _TarefasGridViewState extends State<TarefasGridView> {
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
            (MediaQuery.of(context).size.height / 1.5),
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
            children: <Widget>[
              Text(
                t.titulo.toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text(
                "Cod: ${t.descricao}",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
              ),
              Text(t.data)
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
//                push(context, ProdutoPage(produto));
              },
            ),
            ListTile(
              title: Text("Compartilhar"),
              leading: Icon(Icons.share),
              onTap: () {
                Navigator.pop(context);
//                _onClickCompartilhar(produto);
              },
            ),
          ],
        );
      },
    );
  }

//  _onClickCompartilhar(Produto produto) {
//    Share.share(produto.nome);
//  }
}
