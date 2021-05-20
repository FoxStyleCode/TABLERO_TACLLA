<?php

namespace App\Http\Controllers;

use App\Codigo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Illuminate\Support\Facades\File;

class aliadosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $aliados = DB::select('call traer_aliados()');
        $esta = DB::select('call traer_estados_codigo()');
        $otros_estados = DB::select('call traer_otros_estados()');
        return view('aliados.index', compact('aliados','esta','otros_estados'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $request->validate([
            'tipo' => 'required',
            'codigo' => 'required',
            'punto_contacto' =>'required',
            'piloto' =>'required',
            'profesional' =>'required',
            'pais' =>'required',
            'estad' =>'required',
            'municipio' =>'required',
            'nombres' =>'required',
            'apellidos' =>'required',
            'tel' =>'required',
            'empresa' =>'required',
        ]);


        $resultado = DB::insert('call insertar_aliados(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)',array(
        $request->tipo,
        $request->codigo,
        $request->punto_contacto,
        $request->piloto,
        $request->profesional,
        $request->pais,
        $request->estad,
        $request->municipio,
        $request->coor_map,
        $request->dir_pos,
        $request->nombres,
        $request->apellidos,
        $request->tel,
        $request->mail,
        $request->empresa
        ));

        QrCode::eye('circle')->size(300)->generate('http://taclla.test/vx/'.$request->codigo.'/verify', '../public/qrcodes/'.$request->codigo.'.svg');

        if(isset($resultado)){
            return redirect('/aliados')->with('success', 'Aliado agregado correctamente');
        }else{
            return redirect('/aliados')->with('danger', 'No se pudo registrar el nuevo aliado');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'tipo' => 'required',
            'codigo' => 'required',
            'punto_contacto' =>'required',
            'piloto' =>'required',
            'profesional' =>'required',
            'pais' =>'required',
            'estad' =>'required',
            'municipio' =>'required',
            'nombres' =>'required',
            'apellidos' =>'required',
            'tel' =>'required',
            'empresa' =>'required',
        ]);


        $resultado = DB::insert('call actualizar_aliado(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)',array(
        $id,
        $request->tipo,
        $request->codigo,
        $request->punto_contacto,
        $request->piloto,
        $request->profesional,
        $request->pais,
        $request->estad,
        $request->municipio,
        $request->coor_map,
        $request->dir_pos,
        $request->nombres,
        $request->apellidos,
        $request->tel,
        $request->mail,
        $request->empresa
        ));

        if(isset($resultado)){
            return redirect('/aliados')->with('success', 'Aliado actualizado correctamente');
        }else{
            return redirect('/aliados')->with('danger', 'No se pudo actualizar el aliado');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
     
        $news = Codigo::find($id);

        File::delete("qrcodes/".$news->codigo.".svg");

        $resultado = DB::delete('call eliminar_aliado(?)', array($id));
        
        if(isset($resultado)){
            return redirect('/aliados')->with('success', 'Aliado eliminado correctamente');
        }else{
            return redirect('/aliados')->with('danger', 'No se pudo eliminar el aliado');
        }

    }
}
