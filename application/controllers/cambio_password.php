<?php

class Cambio_password extends CI_Controller {
public function __construct()
    {
        parent::__construct();
        
    }
    
    function index() {
        //Se define que vista
        $data['main'] = 'cambio_clave';
        //Se preparan los parametros de la vista
        $data['title'] = 'Cambio de Clave | Altuve';
        //Se carga la vista con plantilla
        $this->load->view('includes/template', $data);
    }
}