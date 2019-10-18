import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:klenzer_app/core/blocs/marcar_horario.bloc.dart';
import 'package:klenzer_app/core/models/servico.model.dart';
import 'package:klenzer_app/core/util/snackbar.lib.dart';

class ServicosWidget extends StatefulWidget {
  @override
  _ServicosWidgetState createState() => _ServicosWidgetState();
}

class _ServicosWidgetState extends State<ServicosWidget> {
  final MarcarHorarioBloc _marcarHorarioBloc =
      BlocProvider.tag('MarcarHorarioBloc').getBloc<MarcarHorarioBloc>();

  @override
  void initState() {
    super.initState();
    _marcarHorarioBloc.carregarServicosExistentes();
  }

  @override
  Widget build(BuildContext context) {
    bool servicoJaAdicionado({@required int servicoId}) {
      var index = _marcarHorarioBloc.servicosAtuais
          .indexWhere((servico) => servicoId == servico.id);
      if (index == -1) {
        return false;
      } else {
        SnackBarLib.showErrorSnackBar(
          context: context,
          text: 'Serviço já adicionado, escolha outro!',
        );
        return true;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _Servicos(servicoJaAdicionado: servicoJaAdicionado),
        _ServicosAdicionadosWidget(),
        _AdicionarServicos(servicoJaAdicionado: servicoJaAdicionado),
      ],
    );
  }
}

class _Servicos extends StatefulWidget {
  final Function servicoJaAdicionado;
  _Servicos({@required this.servicoJaAdicionado});

  @override
  _ServicosState createState() => _ServicosState();
}

class _ServicosState extends State<_Servicos> {
  final MarcarHorarioBloc _marcarHorarioBloc =
      BlocProvider.tag('MarcarHorarioBloc').getBloc<MarcarHorarioBloc>();

  // TODO: usar o value do dropdown como o proprio serviço
  int _valueDropDown;
  StreamSubscription<ServicoModel> listenerServicoAtual;

  @override
  void initState() {
    super.initState();
    _valueDropDown = 0;

    listenerServicoAtual =
        _marcarHorarioBloc.servicoAtualDropDownStream.listen((servico) {
      setState(() {
        _valueDropDown = servico.id;
      });
    });
  }

  @override
  void dispose() {
    listenerServicoAtual.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 7, left: 7, bottom: 5),
          child: Text('Serviço'),
        ),
        Padding(
          padding: EdgeInsets.only(left: 13, right: 13),
          child: StreamBuilder<List<ServicoModel>>(
            stream: _marcarHorarioBloc.servicosExistentesStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _buildDropDown(servicos: snapshot.data);
              } else if (snapshot.hasError) {
                // TODO: falha ao carregar servicos
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDropDown({@required List<ServicoModel> servicos}) {
    var dropDownItems = servicos
        .map(
          (servico) => _buildDropDownItem(label: servico.nome, id: servico.id),
        )
        .toList();

    return DropdownButton(
      value: _valueDropDown,
      isExpanded: true,
      underline: Container(
        height: 1,
        color: Colors.grey[400],
      ),
      items: dropDownItems,
      onChanged: (servicoId) {
        setState(() {
          if (!this.widget.servicoJaAdicionado(servicoId: servicoId)) {
            _valueDropDown = servicoId;
            _marcarHorarioBloc.atualizarServicoAtualDropDown(
              servico: _marcarHorarioBloc.servicosExistentes.firstWhere(
                (servico) => servico.id == servicoId,
              ),
            );
          }
        });
      },
    );
  }

  DropdownMenuItem _buildDropDownItem({
    @required String label,
    @required int id,
  }) {
    return DropdownMenuItem(
      value: id,
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          label,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class _ServicosAdicionadosWidget extends StatelessWidget {
  final MarcarHorarioBloc _marcarHorarioBloc =
      BlocProvider.tag('MarcarHorarioBloc').getBloc<MarcarHorarioBloc>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 7, left: 7, bottom: 5),
          child: Text('Serviços adicionados'),
        ),
        Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * .23,
          ),
          child: SingleChildScrollView(
            child: StreamBuilder<List<ServicoModel>>(
              stream: _marcarHorarioBloc.servicosAtuaisStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: snapshot.data
                        .map(
                          (servico) =>
                              _ServicoAdicionadoWidget(servico: servico),
                        )
                        .toList(),
                  );
                } else if (snapshot.hasError) {
                  SnackBarLib.showErrorSnackBar(
                    context: context,
                    text: snapshot.error,
                  );
                }
                return SizedBox();
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _ServicoAdicionadoWidget extends StatelessWidget {
  final ServicoModel servico;
  final MarcarHorarioBloc _marcarHorarioBloc =
      BlocProvider.tag('MarcarHorarioBloc').getBloc<MarcarHorarioBloc>();

  _ServicoAdicionadoWidget({@required this.servico});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(UniqueKey().toString()),
      onDismissed: (_) => _marcarHorarioBloc.servicosAtuais.remove(servico),
      child: Card(
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                servico.nome,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 7, bottom: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'R\$',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    servico.valor.toStringAsFixed(2).replaceAll('.', ','),
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdicionarServicos extends StatelessWidget {
  final MarcarHorarioBloc _marcarHorarioBloc =
      BlocProvider.tag('MarcarHorarioBloc').getBloc<MarcarHorarioBloc>();
  final Function servicoJaAdicionado;

  _AdicionarServicos({
    @required this.servicoJaAdicionado,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
          onPressed: () {
            if (_marcarHorarioBloc.servicoAtualDropDown != null) {
              if (!servicoJaAdicionado(
                  servicoId: _marcarHorarioBloc.servicoAtualDropDown.id)) {
                _marcarHorarioBloc.adicionarServico();
                _marcarHorarioBloc.atualizarServicoAtualDropDown(
                  servico: _marcarHorarioBloc.servicosExistentes.firstWhere(
                    (servico) => servico.id == 0,
                  ),
                );
              }
            } else {
              _marcarHorarioBloc.adicionarServico();
            }
          },
          icon: Icon(
            Icons.add_circle_outline,
            size: 35,
          ),
        ),
      ],
    );
  }
}
