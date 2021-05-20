<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Informe de clientes</title>

    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="{{'css/stilos-form-visitas.css'}}">

</head>
<body>

    <div class="contenedor">

        <div class="header">
            <img src="{{asset('imagenes/logo-taclla.jpg')}}" alt="" srcset="">
        </div>

        <div class="main">
        <h1>Información de clientes y puntos de contacto</h1>
        <p>Taclla S.A.S. es una empresa colombiana dedicada a promover las tecnologías 4.0 y en especial, los Servicios Profesionales con Drones. 
        Usted ha llegado aquí gracias a TacllaVX Red de Servicios Profesionales con Drones.
        </p>

        <h3>Punto de contacto - TACLLAvx es: {{$msg["nom_punto"]}}</h3>
        <input type="text" hidden name="nom_punto" value="{{$msg["nom_punto"]}}">
        <br>
        <h5>Nombre : {{$msg["nom_punto_adm"]}}</h5>
        <hr>
        <h5>Teléfono : {{$msg["tel_punto"]}}</h5>
        <hr>
        <h5>Dirección : {{$msg["dir_punto"]}}</h5>
        <hr>
        <h5>Municipio : {{$msg["muni_punto"]}}</h5>
        <hr>
        <h5>Número de código : {{$msg["num_cod_punto"]}}</h5>
        <hr>
        <br>
        <p>Gracias a su punto de contacto usted recibirá un descuento especial en el precio de su servicio.
        A continuación, puede ingresar sus datos y un experto de Taclla lo contactará para asesorar técnicamente su necesidad
        <p>

        <h3>Cliente: {{$msg["nombre_contact"]}}</h3>
        <br>
        <h5>Nombres : {{$msg["nombre_contact"]}}</h5>
        <hr>
        <h5>Apellidos : {{$msg["apellido_contact"]}}</h5>
        <hr>
        <h5>Teléfono : {{$msg["tel_contact"]}}</h5>
        <hr>
        <h5>Correo : {{$msg["correo_contact"]}}</h5>
        <hr>
        <h5>Necesidad : {{$msg["necesidad_contact"]}}</h5>
        <hr>
        <br>

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