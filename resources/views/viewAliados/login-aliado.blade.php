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

    <div class="login">
		<div class="login-screen">
			<div class="app-title">
				<h1>Bienvenido!</h1>
			</div>

			<div class="login-form">
                <form action="{{url('vx')}}" method="POST">
                @csrf
				<div class="control-group">
				<input type="text" name="codigo" class="@error('codigo') is-invalid @enderror" value="" placeholder="Ingresa tu código" id="login-pass"><br/>
                @error('codigo')
                 <span class="invalid-feedback" role="alert">
                   <strong>{{$message}}</strong>
                 </span>
                @enderror 
				</div>
                <button type="submit" name="" id="" class="btn btn-primary">Ingresar</button>
                </form>
			</div>
		</div>
	</div>
    
</body>
</html>