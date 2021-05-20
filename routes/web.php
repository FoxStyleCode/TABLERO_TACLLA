<?php

use App\Detalle;
use App\Http\Controllers\viewController;
use Illuminate\Support\Facades\Route;
use Illuminate\Notifications\Notification;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;
use App\Mail\ContactosTacllaMail;
use Illuminate\Support\Facades\Mail;
// use SimpleSoftwareIO\QrCode\Facades\QrCode;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('auth.login');
});

Auth::routes();


Route::get('/home', 'HomeController@index')->name('home');
Route::get('/register','HomeController@errore')->name("errores");
Route::resource('/vx', 'viewController');
Route::get('/vx', 'viewController@index')->middleware('visitantes');
// Route::get('/qrgenerador', 'viewController@qr_generate');


Route::get('/vx/{id}/verify', 'viewController@codig');



Route::get('/vx', 'viewController@login')->name("loginView");
Route::resource('send-email','MailController');



Route::group(['middleware' => ['permission:crear-usuario|leer-usuarios|actualizar-usuario|eliminar-usuario']], function () {
    Route::resource('usuarios', 'UsersController');
});

Route::group(['middleware' => ['permission:crear-role|leer-roles|actualizar-role|eliminar-role|']], function () {
    Route::resource('roles', 'RolesController');
});

Route::group(['middleware' => ['permission:crear-proyecto|editar-proyecto|eliminar-proyecto|ver-proyecto|']], function () {
    Route::resource('proyectos', 'proyectosController');
    Route::resource('tipos', 'tipoController');
    Route::resource('nuevTarea', 'agregarTareasController');
});

Route::group(['middleware' => ['permission:crear-tareas|actualizar-tareas|eliminar-tareas|ver-tareas|']], function () {
    Route::resource('tareas', 'tareasController');
    Route::resource('estados', 'estadosController');
});

Route::group(['middleware' => ['permission:ver-log']], function () {
    Route::resource('logs', 'logController');
});

Route::group(['middleware' => ['permission:agregar-aliado|ver-aliado|editar-aliado|eliminar-aliado|']], function(){
     Route::resource('aliados','aliadosController');
});

Route::group(['middleware' => ['auth']], function () {
    Route::resource('plantillas', 'plantillasControlador');
    Route::resource('links', 'linkController');
    Route::resource('cerrados', 'cerradosController');
    Route::get('marcarLeidas', function(){
        auth()->user()->unreadNotifications->markAsRead();
        return redirect()->back()->with('success', 'Notificaciones leidas');
    })->name('marcarLeidas');
});



// Route::get('/public/{file}', function ($file) {
//     return Storage::response("public/$file");
//     })->where([
//     'file' => '(.*?)\.(jpg|png|jpeg|gif|doc|docm|docx|docx)$'
// ]);

// Route::get('prueba-eliminar',function(){
//     $resultado = Storage::delete('/public/MGHlb3DiBhPlnvmQgwTlcVRAFnA0WmQ0R9OdYZmJ.xlsx');
//     if(isset($resultado)){
//         return "archivo eliminado correctamente";
//     }
// });


