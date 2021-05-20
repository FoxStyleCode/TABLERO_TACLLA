@extends('layouts.app')

@section('css')

<style>
    .prue{
        margin: 1px;
    }
</style>

<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.6/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="{{asset('plugins/sweetalert2/dist/sweetalert2.min.css')}}">

@endsection

@section('contenido')

<div class="container-sm">
        @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
        @endif

        @if(session('danger'))
        <div class="alert alert-danger" role="alert">
            {{session('danger')}}
        </div>
        @endif
        @if(session('success'))
        <div class="alert alert-success" role="alert">
            {{session('success')}}
        </div>
        @endif

    <div class="btn-toolbar float-right" role="toolbar" aria-label="Toolbar with button groups">
        <div class="btn-group mr-2" role="group" aria-label="First group">
            <button style="background-color: #ff4b1e; color:white;" type="button" class="btn" data-toggle="modal" data-target="#ventanaAliados">
                Agregar aliado
              </button>
        </div>
    </div>

    {{-- agregar un nuevo aliado --}}
    <!-- Modal -->
    <div class="modal fade " id="ventanaAliados" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Nuevo aliado</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            </div>
            <div class="modal-body">
            <form action="{{url('aliados')}}" method="post">
                    @csrf
                    <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <label class="input-group-text" for="inputGroupSelect01">Estado del codigo</label>
                    </div>
                    <select class="custom-select" id="inputGroupSelect01" name="tipo">
                      <option selected>Seleccione el estado</option>
                      <option value="Asignado">Asignado</option>
                      <option value="Impreso">Impreso</option>
                      <option value="Generado">Generado</option>
                    </select>
                  </div>
                <div class="form-group">
                    <label for="">Codigo</label>
                    <input type="text"
                    class="form-control" name="codigo" id="" aria-describedby="helpId" placeholder="">
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <label class="input-group-text" for="inputGroupSelect01">Punto de contacto</label>
                    </div>
                    <select class="custom-select" id="inputGroupSelect01" name="punto_contacto">
                      <option selected>Opciones</option>
                      <option value="Si">Si</option>
                      <option value="No">No</option>
                    </select>
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <label class="input-group-text" for="inputGroupSelect01">Piloto</label>
                    </div>
                    <select class="custom-select" id="inputGroupSelect01" name="piloto">
                      <option selected>Opciones</option>
                      <option value="Si">Si</option>
                      <option value="No">No</option>
                    </select>
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <label class="input-group-text" for="inputGroupSelect01">Profesional</label>
                    </div>
                    <select class="custom-select" id="inputGroupSelect01" name="profesional">
                      <option selected>Opciones</option>
                      <option value="Si">Si</option>
                      <option value="No">No</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="">País</label>
                    <input type="text"
                    class="form-control" name="pais" id="" aria-describedby="helpId" placeholder="">
                </div>
                <div class="form-group">
                    <label for="">Estado</label>
                    <input type="text"
                    class="form-control" name="estad" id="" aria-describedby="helpId" placeholder="">
                </div>
                <div class="form-group">
                    <label for="">Municipio</label>
                    <input type="text"
                    class="form-control" name="municipio" id="" aria-describedby="helpId" placeholder="">
                </div>
                <div class="form-group">
                    <label for="">Coordenadas mapa</label>
                    <input type="text"
                    class="form-control" name="coor_map" id="" aria-describedby="helpId" placeholder="">
                </div>
                <div class="form-group">
                    <label for="">Dirección postal</label>
                    <input type="text"
                    class="form-control" name="dir_pos" id="" aria-describedby="helpId" placeholder="">
                </div>
                <div class="form-group">
                    <label for="">Nombres</label>
                    <input type="text"
                    class="form-control" name="nombres" id="" aria-describedby="helpId" placeholder="">
                </div>
                <div class="form-group">
                    <label for="">Apellidos</label>
                    <input type="text"
                    class="form-control" name="apellidos" id="" aria-describedby="helpId" placeholder="">
                </div>
                <div class="form-group">
                    <label for="">Telefono</label>
                    <input type="text"
                    class="form-control" name="tel" id="" aria-describedby="helpId" placeholder="">
                </div>
                <div class="form-group">
                    <label for="">Email</label>
                    <input type="email"
                    class="form-control" name="mail" id="" aria-describedby="helpId" placeholder="">
                </div>
                <div class="form-group">
                    <label for="">Empresa o comercio</label>
                    <input type="text"
                    class="form-control" name="empresa" id="" aria-describedby="helpId" placeholder="">
                </div>
            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            <input class="btn btn-success" type="submit" name="" id="" value="Agregar">
            </div>
        </form>
        </div>
        </div>
    </div>

      <br>
      <br>

      <table class="table" style="background-color: #1458ff; text-align: center" id="mitablap">
        <thead>
            <tr style="color: white">
                <th scope="col">Estado</th>
                <th scope="col">Código</th>
                <th scope="col">Punto_contacto</th>
                <th scope="col">Piloto</th>
                <th scope="col">Profesional</th>
                <th scope="col">Nombres</th>
                <th scope="col">Apellidos</th>
                <th scope="col">Telefono</th>
                <th scope="col">Opciones</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($aliados as $ali)
           <tr>
            <td>{{$ali->estado_codigo}}</td>
            <td>{{$ali->codigo}}</td>
            <td>{{$ali->punto_contacto}}</td>
            <td>{{$ali->piloto}}</td>
            <td>{{$ali->profesional}}</td>
            <td>{{$ali->nombres}}</td>
            <td>{{$ali->apellidos}}</td>
            <td>{{$ali->telefono}}</td>
            <td class="d-flex">
                @can('editar-aliado')
                <a class="btn btn-warning prue" data-toggle="modal" data-target="#editarAliado{{$ali->id}}" type="button" href=""><i class="far fa-edit"></i></a>
                {{-- editar aliado --}}
                <!-- Modal -->
                <div class="modal fade " id="editarAliado{{$ali->id}}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Editar aliado</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        </div>
                        <div class="modal-body">
                        <form action="{{route('aliados.update',$ali->id)}}" method="post">
                                @csrf
                                @method('PUT')
                                <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                <label class="input-group-text" for="inputGroupSelect01">Estado del codigo</label>
                                </div>
                                <select class="custom-select" id="inputGroupSelect01" name="tipo">
                                <option selected>Seleccione el estado</option>
                                    @foreach ($esta as $estados)
                                        @if($ali->estado_codigo==$estados->estado)
                                        <option selected value="{{$estados->estado}}">{{$estados->estado}}</option>
                                        @else
                                        <option value="{{$estados->estado}}">{{$estados->estado}}</option>
                                        @endif
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group text-left">
                                <label for="" class="">Codigo</label>
                                <input type="text"
                                class="form-control" name="codigo" value="{{$ali->codigo}}" id="" aria-describedby="helpId" placeholder="">
                            </div>
                            <div class="input-group mb-3 text-left">
                                <div class="input-group-prepend">
                                <label class="input-group-text" for="inputGroupSelect01">Punto de contacto</label>
                                </div>
                                <select class="custom-select" id="inputGroupSelect01" name="punto_contacto">
                                <option selected>Opciones</option>
                                @foreach($otros_estados as $other)
                                @if($ali->punto_contacto == $other->nombre)
                                <option selected value="{{$other->nombre}}">{{$other->nombre}}</option>
                                @else
                                <option value="{{$other->nombre}}">{{$other->nombre}}</option>
                                @endif
                                @endforeach
                                </select>
                            </div>
                            <div class="input-group mb-3 text-left">
                                <div class="input-group-prepend">
                                <label class="input-group-text" for="inputGroupSelect01">Piloto</label>
                                </div>
                                <select class="custom-select" id="inputGroupSelect01" name="piloto">
                                <option selected>Opciones</option>
                                @foreach($otros_estados as $other)
                                @if($ali->punto_contacto == $other->nombre)
                                <option selected value="{{$other->nombre}}">{{$other->nombre}}</option>
                                @else
                                <option value="{{$other->nombre}}">{{$other->nombre}}</option>
                                @endif
                                @endforeach
                                </select>
                            </div>
                            <div class="input-group mb-3 text-left">
                                <div class="input-group-prepend">
                                <label class="input-group-text" for="inputGroupSelect01">Profesional</label>
                                </div>
                                <select class="custom-select" id="inputGroupSelect01" name="profesional">
                                <option selected>Opciones</option>
                                @foreach($otros_estados as $other)
                                @if($ali->punto_contacto == $other->nombre)
                                <option selected value="{{$other->nombre}}">{{$other->nombre}}</option>
                                @else
                                <option value="{{$other->nombre}}">{{$other->nombre}}</option>
                                @endif
                                @endforeach
                                </select>
                            </div>
                            <div class="form-group text-left">
                                <label for="">País</label>
                                <input type="text"
                                class="form-control" name="pais" id="" value="{{$ali->pais}}" aria-describedby="helpId" placeholder="">
                            </div>
                            <div class="form-group text-left">
                                <label for="">Estado</label>
                                <input type="text"
                                class="form-control" name="estad" id="" value="{{$ali->estado}}"  aria-describedby="helpId" placeholder="">
                            </div>
                            <div class="form-group text-left">
                                <label for="">Municipio</label>
                                <input type="text"
                                class="form-control" name="municipio" id="" value="{{$ali->municipio}}"  aria-describedby="helpId" placeholder="">
                            </div>
                            <div class="form-group text-left">
                                <label for="">Coordenadas mapa</label>
                                <input type="text"
                                class="form-control" name="coor_map" id="" value="{{$ali->coordenadas_mapa}}"  aria-describedby="helpId" placeholder="">
                            </div>
                            <div class="form-group text-left">
                                <label for="">Dirección postal</label>
                                <input type="text"
                                class="form-control" name="dir_pos" id="" value="{{$ali->dir_postal}}"  aria-describedby="helpId" placeholder="">
                            </div>
                            <div class="form-group text-left">
                                <label for="">Nombres</label>
                                <input type="text"
                                class="form-control" name="nombres" value="{{$ali->nombres}}"  id="" aria-describedby="helpId" placeholder="">
                            </div>
                            <div class="form-group text-left">
                                <label for="">Apellidos</label>
                                <input type="text"
                                class="form-control" name="apellidos" value="{{$ali->apellidos}}"  id="" aria-describedby="helpId" placeholder="">
                            </div>
                            <div class="form-group text-left">
                                <label for="">Telefono</label>
                                <input type="text"
                                class="form-control" name="tel" value="{{$ali->telefono}}"  id="" aria-describedby="helpId" placeholder="">
                            </div>
                            <div class="form-group text-left">
                                <label for="">Email</label>
                                <input type="email"
                                class="form-control" name="mail" id="" value="{{$ali->email}}"  aria-describedby="helpId" placeholder="">
                            </div>
                            <div class="form-group text-left">
                                <label for="">Empresa o comercio</label>
                                <input type="text"
                                class="form-control" name="empresa" id="" value="{{$ali->empresa_o_comercio}}"  aria-describedby="helpId" placeholder="">
                            </div>
                        </div>
                        <div class="modal-footer text-left">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <input class="btn btn-success" type="submit" name="" id="" value="Guardar">
                        </div>
                    </form>
                    </div>
                    </div>
                </div>
                @endcan
                @can('ver-aliado')
                <a class="btn btn-primary prue"  data-toggle="modal" data-target="#verAliado{{$ali->id}}" href=""><i class="far fa-eye"></i></a>
                {{-- ver aliado --}}
                <!-- Modal -->
                <div class="modal fade " id="verAliado{{$ali->id}}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ver aliado</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        </div>
                        <div class="modal-body">
                                <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                <label class="input-group-text" for="inputGroupSelect01">Estado del codigo</label>
                                </div>
                                <select disabled class="custom-select" id="inputGroupSelect01" name="tipo">
                                <option selected>Seleccione el estado</option>
                                    @foreach ($esta as $estados)
                                        @if($ali->estado_codigo==$estados->estado)
                                        <option selected value="{{$estados->estado}}">{{$estados->estado}}</option>
                                        @else
                                        <option value="{{$estados->estado}}">{{$estados->estado}}</option>
                                        @endif
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group text-left">
                                <label for="" class="">Codigo</label>
                                <input type="text"
                                class="form-control" disabled name="codigo" value="{{$ali->codigo}}" id="" aria-describedby="helpId" placeholder="">
                            </div>
                            <div class="input-group mb-3 text-left">
                                <div class="input-group-prepend">
                                <label class="input-group-text" for="inputGroupSelect01">Punto de contacto</label>
                                </div>
                                <select disabled class="custom-select" id="inputGroupSelect01" name="punto_contacto">
                                <option selected>Opciones</option>
                                @foreach($otros_estados as $other)
                                @if($ali->punto_contacto == $other->nombre)
                                <option selected value="{{$other->nombre}}">{{$other->nombre}}</option>
                                @else
                                <option value="{{$other->nombre}}">{{$other->nombre}}</option>
                                @endif
                                @endforeach
                                </select>
                            </div>
                            <div class="input-group mb-3 text-left">
                                <div class="input-group-prepend">
                                <label class="input-group-text" for="inputGroupSelect01">Piloto</label>
                                </div>
                                <select disabled class="custom-select" id="inputGroupSelect01" name="piloto">
                                <option selected>Opciones</option>
                                @foreach($otros_estados as $other)
                                @if($ali->punto_contacto == $other->nombre)
                                <option selected value="{{$other->nombre}}">{{$other->nombre}}</option>
                                @else
                                <option value="{{$other->nombre}}">{{$other->nombre}}</option>
                                @endif
                                @endforeach
                                </select>
                            </div>
                            <div class="input-group mb-3 text-left">
                                <div class="input-group-prepend">
                                <label class="input-group-text" for="inputGroupSelect01">Profesional</label>
                                </div>
                                <select disabled class="custom-select" id="inputGroupSelect01" name="profesional">
                                <option selected>Opciones</option>
                                @foreach($otros_estados as $other)
                                @if($ali->punto_contacto == $other->nombre)
                                <option selected value="{{$other->nombre}}">{{$other->nombre}}</option>
                                @else
                                <option value="{{$other->nombre}}">{{$other->nombre}}</option>
                                @endif
                                @endforeach
                                </select>
                            </div>
                            <div class="form-group text-left">
                                <label for="">País</label>
                                <input type="text"
                                class="form-control" disabled name="pais" id="" value="{{$ali->pais}}" aria-describedby="helpId" placeholder="">
                            </div>
                            <div class="form-group text-left">
                                <label for="">Estado</label>
                                <input type="text"
                                class="form-control" disabled name="estad" id="" value="{{$ali->estado}}"  aria-describedby="helpId" placeholder="">
                            </div>
                            <div class="form-group text-left">
                                <label for="">Municipio</label>
                                <input type="text"
                                class="form-control" disabled name="municipio" id="" value="{{$ali->municipio}}"  aria-describedby="helpId" placeholder="">
                            </div>
                            <div class="form-group text-left">
                                <label for="">Coordenadas mapa</label>
                                <input type="text"
                                class="form-control" disabled name="coor_map" id="" value="{{$ali->coordenadas_mapa}}"  aria-describedby="helpId" placeholder="">
                            </div>
                            <div class="form-group text-left">
                                <label for="">Dirección postal</label>
                                <input type="text"
                                class="form-control" disabled name="dir_pos" id="" value="{{$ali->dir_postal}}"  aria-describedby="helpId" placeholder="">
                            </div>
                            <div class="form-group text-left">
                                <label for="">Nombres</label>
                                <input type="text"
                                class="form-control" disabled name="nombres" value="{{$ali->nombres}}"  id="" aria-describedby="helpId" placeholder="">
                            </div>
                            <div class="form-group text-left">
                                <label for="">Apellidos</label>
                                <input type="text"
                                class="form-control" disabled name="apellidos" value="{{$ali->apellidos}}"  id="" aria-describedby="helpId" placeholder="">
                            </div>
                            <div class="form-group text-left">
                                <label for="">Telefono</label>
                                <input type="text"
                                class="form-control" name="tel" disabled value="{{$ali->telefono}}"  id="" aria-describedby="helpId" placeholder="">
                            </div>
                            <div class="form-group text-left">
                                <label for="">Email</label>
                                <input type="email"
                                class="form-control" disabled name="mail" id="" value="{{$ali->email}}"  aria-describedby="helpId" placeholder="">
                            </div>
                            <div class="form-group text-left">
                                <label for="">Empresa o comercio</label>
                                <input type="text"
                                class="form-control" disabled name="empresa" id="" value="{{$ali->empresa_o_comercio}}"  aria-describedby="helpId" placeholder="">
                            </div>
                            <div class="card" style="width: 18rem;">
                                <img class="card-img-top w-20" src="/qrcodes/{{$ali->codigo}}.svg" alt="Card image cap">
                                <div class="card-body">
                                  <h5 class="card-title">Código del aliado</h5>
                                  <a href="/qrcodes/{{$ali->codigo}}.svg" download="/qrcodes/{{$ali->codigo}}.svg" class="btn btn-primary">Descargar código QR</a>
                                </div>
                              </div>
                        </div>
                        <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                    </div>
                </div>
                @endcan
                @can('eliminar-aliado')
                <form action="{{route('aliados.destroy',$ali->id)}}" class="formulario-aliados" method="post">
                    @method('DELETE')
                    @csrf
                    <button type="submit" class="btn btn-danger prue"><i class="far fa-window-close"></i></button>
                </form>
                @endcan
            </td>
           </tr>
           @endforeach
        </tbody>
    </table>
</div>

@endsection

@section('scripts')

{{-- <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script> --}}

<script src="{{asset('plugins/sweetalert2/dist/sweetalert2.all.min.js')}}"></script>

<script src="{{asset('js/jquery-3.5.1.js')}}"></script>
<script src="{{asset('js/jquery.dataTables.min.js')}}"></script>
<script type="text/javascript" src="{{asset('js/dataTables.responsive.min.js')}}"></script>
<script type="text/javascript" src="{{asset('js/dataTables.buttons.min.js')}}"></script>

<script>
    $('.formulario-aliados').submit(function(e){
        e.preventDefault();

            Swal.fire({
            title: '¿Eliminar aliado?',
            text: "¿Estás seguro que deseas eliminar este aliado?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: 'Cancelar',
            confirmButtonText: 'Si, Eliminar!'
            }).then((result) => {
            if (result.isConfirmed) {
                this.submit();
            }
        });
    });
</script>

<script type="text/javascript">
    var tabla = $('#mitablap').DataTable({
        responsive: true,
        autoWidth: true,

        "language": {  
            "lengthMenu": "Mostrar _MENU_ registros por página",
            "zeroRecords": "No hay proyectos cerrados con este nombre",
            "info": "Mostrando página _PAGE_ de _PAGES_",
            "infoEmpty": "No records available",
            "infoFiltered": "(filtrando de _MAX_ registros totales)",
            "search": "Buscar",
            "paginate": {
            "previous": "Anterior",
            "next": "Siguiente",
            }
            }
        });
</script>

@endsection