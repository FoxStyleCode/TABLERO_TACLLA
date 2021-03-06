@extends('layouts.app')

<style>
    .prue{
        border-radius: 10px;
    }
    .ctado:hover{
        opacity: 0.9;
    }

    @media screen and (max-width: 996px) {
       table {
           width:100%;
       }
       thead {
           display: none;
       }
       tr:nth-of-type(2n) {
           background-color: inherit;
       }
       tr td:first-child {
           background: #f0f0f0;
           font-weight:bold;
           font-size:1.3em;
       }
       tbody td {
           display: block;
           text-align:center;
       }
       tbody td:before {
           content: attr(data-th);
           display: block;
           text-align:center;
       }
}
</style>

@section('contenido')
    <div class="container">

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
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">Tareas</div>
                    <div class="card-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <td class="active">Proyecto</td>
                                    <td class="active">Tarea</td>
                                    <td class="active">Area</td>
                                    <td class="active">Estado</td>
                                    <td class="active">Persona</td>
                                    <td class="active">Asignar</td>
                                    <td class="active">Archivos</td>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($resultado as $result)
                                <tr>
                                    <td>{{$result->proyecto}}</td>
                                    <td>{{$result->nombre_tarea}}</td>
                                    <td>{{$result->nombre_area}}</td>
                                    @if($result->nombre_estado == "programado")
                                    <td class="ctado" data-toggle="modal" data-target="#ventanaModel{{$result->id}}" style="background-color: #EC7063; border-radius:5px; color: white; text-align: center">{{$result->nombre_estado}}</td>
                                    @elseif($result->nombre_estado == "proceso")
                                    <td class="ctado" data-toggle="modal" data-target="#ventanaModel{{$result->id}}" style="background-color: #F5B041; border-radius:5px; color: white; text-align: center">{{$result->nombre_estado}}</td>
                                    @else 
                                    <td class="ctado" data-toggle="modal" data-target="#ventanaModel{{$result->id}}" style="background-color:#58D68D; border-radius:5px; color: white; text-align: center">{{$result->nombre_estado}}</td>
                                    @endif
                                    <td>{{$result->name}}</td>
                                        {{-- asignar una tarea --}}
                                        @can('actualizar-tareas')
                                        <td><a class="btn btn-primary prue" data-toggle="modal" data-target="#ventana{{$result->id,$result->nombre_tarea}}" href=""><i class="far fa-edit"></i></a>
                                            <!-- Modal -->
                                            <div class="modal fade" id="ventana{{$result->id,$result->nombre_tarea}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Asignar tarea</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        
                                                        <form action="{{route('tareas.update', $result->proyecto_id)}}" method="post">
                                                        @csrf
                                                        @method('PUT')
                                                        <input type="text" hidden name="tareaid" value="{{$result->id}}">
                                                        
                                                        <div class="form-group">
                                                            <label for="name">Usuarios</label>
                                                            <select class="form-control" name="tipo" id="">
                                                                @foreach ($usuario as $us)
                                                                @if($result->usuario_id == $us->id)
                                                                <option selected value="{{$us->id}}">
                                                                    {{$us->name}}
                                                                </option>
                                                                @else
                                                                <option value="{{$us->id}}">
                                                                    {{$us->name}}
                                                                </option>
                                                                @endif
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                            <button type="submit" class="btn btn-success">Asignar</button>
                                                            </div>
                                                    </form>
                                                    </div>
                                                </div>
                                                </div>
                                            </div>
                                        </td>
                                        @endcan
                                        {{-- comprobar si existe o no un enlace --}}
                                        @if(isset($result->enlace))
                                        <td>
                                        <a href="{{ Storage::url($result->enlace)}}" class="btn btn-warning prue" target="_blank">
                                        <i class="far fa-file-word"></i>
                                        </a>
                                        {{-- <a name="" id="" target="_blank" href="{{$result->enlace}}" class="btn btn-warning prue" role="button"><i class="far fa-file-word"></i></a> --}}
                                        </td>
                                        @else
                                        <td><a name=""  data-toggle="modal" data-target="#ventanaLink{{$result->id}}" href="" class="btn btn-secondary prue" role="button"><i class="far fa-file-word"></i></a>
                                            {{-- agregar un archivo al almacenamiento --}}
                                            <!-- Modal -->
                                            <div class="modal fade" id="ventanaLink{{$result->id}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Carga de archivos</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        
                                                        <form action="{{route('links.update', $result->proyecto_id)}}" method="post" enctype="multipart/form-data">
                                                        @csrf
                                                        @method('PUT')

                                                        <input type="text" name="tarea_id" hidden value="{{$result->id}}">
                                                        <div class="form-group">
                                                            <label for=""></label>
                                                            <div class="mb-3">
                                                                <label for="formFile" class="form-label">Selecciona el archivo que deseas agregar</label>
                                                                <hr>
                                                                <input class="form-control" type="file" name="nameArchivo" id="formFile">
                                                              </div>
                                                            {{-- <input type="text"
                                                              class="form-control" name="enlac" id="" aria-describedby="helpId" placeholder=""> --}}
                                                          </div>
                                                       
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                            <button type="submit" class="btn btn-success">A??adir</button>
                                                            </div>
                                                    </form>
                                                    </div>   
                                                </div>
                                                </div>
                                            </div>
                                        </td>
                                        {{-- <td><a name="" id="" href="#" class="btn btn-warning prue" role="button"><i class="far fa-file-word"></i></a></td> --}}
                                        @endif


                                        {{-- actualizar el estado de una tarea --}}
                                        @can('actualizar-estado')
                                        <td>
                                            <!-- Modal -->
                                            <div class="modal fade" id="ventanaModel{{$result->id}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Cambiar estados</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        
                                                        <form action="{{route('estados.update', $result->proyecto_id)}}" method="post">
                                                        @csrf
                                                        @method('PUT')
                                                        <input type="text" hidden name="tarea_id" value="{{$result->id}}">
                                                        <input type="" hidden name="nameEs" value="">

                                                        <div class="form-group">
                                                            <label for="name">Estados</label>
                                                            <select class="form-control" name="est" id="">
                                                                @foreach ($estados as $es)
                                                                @if($result->estado_id == $es->id)
                                                                <option selected value="{{$es->id}}">
                                                                    <span id="nameS">{{$es->nombre_estado}}</span>
                                                                </option>
                                                                @else
                                                                <option value="{{$es->id}}">
                                                                    <span id="nameS">{{$es->nombre_estado}}</span>
                                                                </option>
                                                                @endif
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                            <button type="submit" class="btn btn-success">Cambiar</button>
                                                            </div>

                                                    </form>
                                                    </div>
                                                    
                                                </div>
                                                </div>
                                            </div>
                                        </td>
                                        @endcan      
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection


