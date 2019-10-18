import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/foundation.dart';
import 'package:klenzer_app/core/models/cliente.model.dart';
import 'package:klenzer_app/core/models/funcionario.model.dart';
import 'package:klenzer_app/core/models/horario.model.dart';
import 'package:klenzer_app/core/models/servico.model.dart';
import 'package:klenzer_app/core/services/cliente.service.dart';
import 'package:klenzer_app/core/services/funcionario.service.dart';
import 'package:klenzer_app/core/services/horarios.service.dart';
import 'package:klenzer_app/core/services/servico.service.dart';
import 'package:rxdart/rxdart.dart';

class MarcarHorarioBloc extends BlocBase {
  // erros cometidos aqui:
  // ao invés de utilizar stream para spawnar o value para lugares que não precisa de stream
  // da para utilizar apenas um atributo da classe para guardar o valor. (dropdown)

  final _servicosExistentesController = BehaviorSubject<List<ServicoModel>>();
  Observable<List<ServicoModel>> get servicosExistentesStream =>
      _servicosExistentesController.stream;
  List<ServicoModel> get servicosExistentes =>
      _servicosExistentesController.value;

  final _servicosAtuaisController =
      BehaviorSubject<List<ServicoModel>>(seedValue: []);
  Observable<List<ServicoModel>> get servicosAtuaisStream =>
      _servicosAtuaisController.stream;
  List<ServicoModel> get servicosAtuais => _servicosAtuaisController.value;

  final _servicoAtualDropDownController = BehaviorSubject<ServicoModel>();
  Observable<ServicoModel> get servicoAtualDropDownStream =>
      _servicoAtualDropDownController.stream;
  ServicoModel get servicoAtualDropDown =>
      _servicoAtualDropDownController.value;

  final _funcionariosExistentesController =
      BehaviorSubject<List<FuncionarioModel>>();
  Observable<List<FuncionarioModel>> get funcionariosExistentesStream =>
      _funcionariosExistentesController.stream;
  List<FuncionarioModel> get funcionariosExistentes =>
      _funcionariosExistentesController.value;

  final _funcionarioAtualDropDownController =
      BehaviorSubject<FuncionarioModel>();
  Observable<FuncionarioModel> get funcionarioAtualDropDownStream =>
      _funcionarioAtualDropDownController.stream;
  FuncionarioModel get funcionarioAtualDropDown =>
      _funcionarioAtualDropDownController.value;

  final _clientesExistentesController = BehaviorSubject<List<ClienteModel>>();
  Observable<List<ClienteModel>> get clientesExistentesStream =>
      _clientesExistentesController.stream;
  List<ClienteModel> get clientesExistentes =>
      _clientesExistentesController.value;

  final _clienteAtualDropDownController = BehaviorSubject<ClienteModel>();
  Observable<ClienteModel> get clienteAtualDropDownStream =>
      _clienteAtualDropDownController.stream;
  ClienteModel get clienteAtualDropDown =>
      _clienteAtualDropDownController.value;

  DateTime _dataInicio;
  DateTime _dataFim;

  final _sucessoMarcarHorarioController = PublishSubject<bool>();
  Observable<bool> get sucessoMarcarHorarioStream =>
      _sucessoMarcarHorarioController.stream;

  void carregarServicosExistentes() async {
    List<ServicoModel> servicos = [];
    servicos.add(
      ServicoModel(id: 0, nome: 'Escolha um serviço', valor: .0),
    );
    ServicoService servicoService = ServicoService();
    servicos.addAll(await servicoService.getTodosServicos());
    _servicosExistentesController.sink.add(servicos);
  }

  void atualizarServicoAtualDropDown({@required ServicoModel servico}) {
    _servicoAtualDropDownController.sink.add(servico);
  }

  void adicionarServico() {
    if (servicoAtualDropDown != null && servicoAtualDropDown.id != 0) {
      servicosAtuais.add(servicoAtualDropDown);
      _servicosAtuaisController.sink.add(servicosAtuais);
    } else {
      _servicosAtuaisController.sink.addError('Selecione um serviço antes!');
      if (servicosAtuais.isNotEmpty) {
        _servicosAtuaisController.sink.add(servicosAtuais);
      }
    }
  }

  void carregarFuncionariosExistentes() async {
    List<FuncionarioModel> funcionarios = [];
    funcionarios.add(
      FuncionarioModel(
        id: -1,
        nome: 'Escolha um funcionario',
        cargo: 'Sem cargo',
      ),
    );
    FuncionarioService funcionarioService = FuncionarioService();
    funcionarios.addAll(await funcionarioService.getTodosFuncionarios());
    _funcionariosExistentesController.sink.add(funcionarios);
  }

  void atualizarFuncionarioAtualDropDown({
    @required FuncionarioModel funcionario,
  }) {
    _funcionarioAtualDropDownController.sink.add(funcionario);
  }

  void carregarClientesExistentes() async {
    List<ClienteModel> clientes = [];
    clientes.add(
      ClienteModel(
        id: -1,
        nome: 'Escolha um cliente',
        bairro: '',
        cidade: '',
        estado: '',
        aniversario: null,
        instagram: '',
      ),
    );
    ClienteService clienteService = ClienteService();
    clientes.addAll(await clienteService.getTodosClientes());
    _clientesExistentesController.sink.add(clientes);
  }

  void atualizarClienteAtualDropDown({
    @required ClienteModel cliente,
  }) {
    _clienteAtualDropDownController.sink.add(cliente);
  }

  void marcarHorario() {
    try {
      HorarioModel horario = HorarioModel(
        dataInicio: _dataInicio,
        dataFim: _dataFim,
        servicos: servicosAtuais,
        funcionario: funcionarioAtualDropDown,
        cliente: clienteAtualDropDown,
      );
      HorariosService horariosService = HorariosService();
      horariosService.postMarcarHorario(horario: horario);
      _sucessoMarcarHorarioController.sink.add(true);
    } catch (err) {
      _sucessoMarcarHorarioController.sink.addError(err.message.message);
    }
  }

  void salvarData({DateTime data, bool firstDate}) {
    if (firstDate) {
      _dataInicio = data;
    } else {
      _dataFim = data;
    }
  }

  @override
  void dispose() {
    _servicosAtuaisController.close();
    _servicoAtualDropDownController.close();
    _servicosExistentesController.close();
    _funcionariosExistentesController.close();
    _funcionarioAtualDropDownController.close();
    _clientesExistentesController.close();
    _clienteAtualDropDownController.close();
    _sucessoMarcarHorarioController.close();
    super.dispose();
  }
}
