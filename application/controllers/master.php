<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Master extends CI_Controller {
    
    public function __construct() {
        parent::__construct();
    }
    
    public function index() {        
        //Se define que vista
        $data['main']='signin';
        //Se preparan los parametros de la vista
        $data['title']='Altuve | Iniciar sesión';
        //Se carga la vista con plantilla
        $this->load->view('includes/template',$data);
    }

    public function registro() {        
        //Se define que vista
        $data['main']='signup';
        //Se preparan los parametros de la vista
        $data['title']='Registro de usuario | Altuve';
        //Se carga la vista con plantilla
        $this->load->view('includes/template',$data);
    }
    
    public function plantilla (){
        //Se define que vista
        $data['main']='plantilla';
        //Se preparan los parametros de la vista
        $data['title']='Altuve | Iniciar sesión';
        //Se carga la vista con plantilla
        $this->load->view('includes/template',$data);
    }

}