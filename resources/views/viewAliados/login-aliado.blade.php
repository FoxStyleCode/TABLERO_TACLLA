<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ingreso Aliados</title>
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="{{asset('css/StilosAliados.css')}}">
</head>
<body>

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

    <div class="contenedor">
            <div class="contenedor__img">
                <img src="{{asset('imagenes/Recurso2.png')}}">
            </div>
            <div class="contenedor__form">
                <form action="{{url('vx')}}" method="POST">
                    @csrf
                    <div class="control-group">
                    <h5>Bienvenido a Taclla VX</h5>
                    <input type="text" name="codigo" class="@error('codigo') is-invalid @enderror" value="" placeholder="Ingresar código" id="login-pass"><br/>
                    @error('codigo')
                    <span class="invalid-feedback" role="alert">
                    <strong><img src="{{asset('imagenes/Recurso11.png')}}" class="min_img">&nbsp;{{$message}}</strong>
                    </span>
                    @enderror 
                    </div>
                    <button type="submit" name="" id="" class="boton">Ingresar</button>
                </form>
            </div>
    </div>
    
</body>
</html>