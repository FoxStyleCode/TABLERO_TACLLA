@extends('layouts.app')


@section('contenido')

    <div class="container">

        @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
        @endif

        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h2>Nuevo Proyecto</h2>
                    </div>
                    <div class="card-body">
                        <form action="{{url('proyectos')}}" method="post">
                            @csrf
                            <div class="form-group">
                                <label for="name">Tipo de proyecto</label>
                                <select class="form-control" name="tipo" id="">
                                    @foreach ($data as $datos)
                                    <option value="{{$datos->id}}">
                                        {{$datos->nombre}}
                                    </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="num">Numero del proyecto</label>
                                <input type="text" name="numeroproyecto" id="" required class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="fech">Fecha</label>
                                <input type="date" name="fech" id="" required class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="cli">Cliente</label>
                                <input type="text" name="cli" id="" required class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="nom">Nombre del proyecto</label>
                                <input type="text" name="nombreproyecto" id="" required class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="ver">Predio - Vereda</label>
                                <input type="text" name="predio" id="" required class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="muni">Municipio</label>
                                <input type="text" name="muni" id="" required class="form-control" autocomplete="off">
                            </div>
                            <div class="justify-content-end">
                                <input class="btn btn-success" type="submit" name="" id="" value="Abrir">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection