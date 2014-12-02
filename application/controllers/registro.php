<?php

class Registro extends CI_Controller {
public function __construct()
    {
        parent::__construct();
        
    }
    
    function index() {
        //Se define que vista
        $data['main'] = 'signup';
        //Se preparan los parametros de la vista
        $data['title'] = 'Registro de cliente | Altuve';
        //Se carga la vista con plantilla
        $this->load->view('includes/template', $data);
    }
    
      function agregar_empleado() {
        //Se define que vista
        $data['main'] = 'signup_empleado';
        //Se preparan los parametros de la vista
        $data['title'] = 'Registro de empleado | Altuve';
        //Se carga la vista con plantilla
        $this->load->view('includes/template', $data);
    }
    
    function agregar_proveedor() {
        //Se define que vista
        $data['main'] = 'signup_proveedor';
        //Se preparan los parametros de la vista
        $data['title'] = 'Registro de proveedor | Altuve';
        //Se carga la vista con plantilla
        $this->load->view('includes/template', $data);
    }
    
    function agregar_estatus() {
        //Se define que vista
        $data['main'] = 'signup_estatus';
        //Se preparan los parametros de la vista
        $data['title'] = 'Registro de status | Altuve';
        //Se carga la vista con plantilla
        $this->load->view('includes/template', $data);
    }
    
    function agregar_tipo_mov_inventario() {
        //Se define que vista
        $data['main'] = 'signup_tipo_mov_invent';
        //Se preparan los parametros de la vista
        $data['title'] = 'Registro de movimientos | Altuve';
        //Se carga la vista con plantilla
        $this->load->view('includes/template', $data);
    }
    
}