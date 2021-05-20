<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Informe de clientes</title>

    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    {{-- <link rel="stylesheet" href="{{'css/stilos-form-visitas.css'}}"> --}}
    
    <style>

        *{
            font-family: sans-serif;
            font-weight: 100;
        }

        body{
            background: no-repeat fixed 50% 50% url('');
            background-size: cover;
        }

        .contenedor{
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            height: 150vh;
            width: 150vh;
            text-align: justify;
        }

        .header, .main, .footer{
            padding: 20px;
        }

        .header{
            text-align: center;
        }

        .header img{
            width: 500px;
        }


        .img-footer img{
            width: 400px;
            vertical-align: middle;
        }

        form textarea{
            max-height: 200px;
        }



        @media screen and (max-width:600px){

        h1{
            font-size: 30px;
        }
        .contenedor{
        margin: 0 auto;
        display: flex;
        flex-direction: column;
        height: 40vh;
        width: 40vh;
        text-align: justify;
        }

        .header, .main, .footer{
        padding: 10px;
        }

        .header{
            text-align: center;
            padding: 20px;
            /* background: lightblue; */
        }

        .header img{
            width: 230px;
        }


        .img-footer img{
            width: 130px;
            vertical-align: middle;
        }

        form textarea{
            max-height: 200px;
        }

        }
        
    </style>

</head>
<body>

    <div class="contenedor">

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

        <div class="header">
            <img src="{{asset('imagenes/logo-taclla.jpg')}}" alt="" srcset="">
        </div>

        <div class="main">
        <h1>Bienvenido!</h1>
        <p>Taclla S.A.S. es una empresa colombiana dedicada a promover las tecnologías 4.0 y en especial, los Servicios Profesionales con Drones. 
        Usted ha llegado aquí gracias a TacllaVX Red de Servicios Profesionales con Drones.
        </p>

        <form action="{{url('send-email')}}" method="POST">
        @csrf
        @foreach ($consultica as $consul)
        <h3>Su punto de contacto - TACLLAvx es: {{$consul->empresa_o_comercio}}</h3>
        <input type="text" hidden name="nom_punto" value="{{$consul->empresa_o_comercio}}">
        <br>
        <h5>Nombre : {{$consul->nombres}}</h5>
        <input type="text" hidden name="nom_punto_adm" value="{{$consul->nombres}}">
        <hr>
        <h5>Teléfono : {{$consul->telefono}}</h5>
        <input type="text" hidden name="tel_punto" value="{{$consul->telefono}}">
        <hr>
        <input type="text" hidden name="correo" value="{{$consul->email}}">
        <h5>Dirección : {{$consul->dir_postal}}</h5>
        <input type="text" hidden name="dir_punto" value="{{$consul->dir_postal}}">
        <hr>
        <h5>Municipio : {{$consul->municipio}}</h5>
        <input type="text" hidden name="muni_punto" value="{{$consul->municipio}}">
        <hr>
        <h5>Número de código : {{$consul->codigo}}</h5>
        <input type="text" hidden name="num_cod_punto" value="{{$consul->codigo}}">
        <hr>
        <br>
        @endforeach
        <p>Gracias a su punto de contacto usted recibirá un descuento especial en el precio de su servicio.
        A continuación, puede ingresar sus datos y un experto de Taclla lo contactará para asesorar técnicamente su necesidad
        <p>
            <div class="form-group">
                <label for="exampleInputEmail1">Nombre</label>
                <input type="text" name="nombre_contact" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Apellidos</label>
                <input type="text" name="apellido_contact" class="form-control" id="exampleInputPassword1" placeholder="">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Teléfono</label>
                <input type="text" name="tel_contact" class="form-control" id="exampleInputPassword1" placeholder="">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Correo</label>
                <input type="email" name="correo_contact" class="form-control" id="exampleInputPassword1" placeholder="">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Expliquenos su necesidad o solicitud</label>
                <textarea class="form-control" name="necesidad_contact" id="" rows="3"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Enviar</button>
            </form>

        </div>

        <div class="footer">
            <div class="img-footer">
                <img src="{{asset('imagenes/logo-taclla.jpg')}}" alt="" srcset="">
                Red de Servicios Profesionales Con Drones
            </div>
            <br>
            <p>La Red TacllaVX le ayuda como Cliente a conectar al piloto más cercano, a través de los puntos de contacto comerciales. 
                El equipo de expertos de TACLLA garantiza el desarrollo del proyecto y su producto final tendrá un alto valor agregado. 
                Beneficios de la Red TacllaVX
            </p>
            <p>
                * Usted como cliente disminuye los costos de la captura de datos en terreno y aumenta la rapidez y calidad sus productos.
                <br> 
                * Taclla respalda el desarrollo del proyecto a través de sus equipos técnicos.
            </p>
        </div>

    </div>
    
</body>
</html>