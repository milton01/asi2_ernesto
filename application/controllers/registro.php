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
        $data['title'] = 'Registro de usuario | Altuve';
        //Se carga la vista con plantilla
        $this->load->view('includes/template', $data);
    }
    
      function agregar_empleado() {
        //Se define que vista
        $data['main'] = 'signup_empleado';
        //Se preparan los parametros de la vista
        $data['title'] = 'Registro de usuario | Altuve';
        //Se carga la vista con plantilla
        $this->load->view('includes/template', $data);
    }
    
    function agregar_proveedor() {
        //Se define que vista
        $data['main'] = 'signup_proveedor';
        //Se preparan los parametros de la vista
        $data['title'] = 'Registro de usuario | Altuve';
        //Se carga la vista con plantilla
        $this->load->view('includes/template', $data);
    }
    
}