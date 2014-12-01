<?php

class Master extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Login_Model');
    }

    public function index() {
        {  // reglas de validación
        $this->form_validation->set_rules('nombre', 'Usuario', 'required|xss_clean|callback__valid_login');
        $this->form_validation->set_rules('password', 'Contraseña','required|xss_clean');
	   
	$this->form_validation->set_message('required', 'el campo %s es requerido');
        $this->form_validation->set_message('_valid_login', 'El usuario o contraseña son incorrectos');
	   
	$this -> form_validation -> set_error_delimiters('<ul><li>', '</li></ul>');
     
		if ($this->form_validation->run() == FALSE){
                    //Se define que vista
                    $data['main'] = 'signin';
                    //Se preparan los parametros de la vista
                    $data['title'] = 'Altuve | Iniciar sesión';
                    //Se carga la vista con plantilla
                    $this->load->view('includes/template', $data);
        }
        else
                {
                $username = $this->input->post('username');
                             $data_user = $array = array('user'=> $username, 'logued_in' => TRUE);

                // asignamos dos datos a la sesión --> (username y logued_in)									 
                $this->session->set_userdata($data_user);
                //Se define que vista
                    $data['main'] = 'menu';
                    //Se preparan los parametros de la vista
                    $data['title'] = 'Altuve | Bienvenido';
                    //Se carga la vista con plantilla
                    $this->load->view('includes/template', $data);
                }                
        }
    }

    public function registro() {
        //Se define que vista
        $data['main'] = 'signup';
        //Se preparan los parametros de la vista
        $data['title'] = 'Registro de usuario | Altuve';
        //Se carga la vista con plantilla
        $this->load->view('includes/template', $data);
    }

    public function plantilla() {
        //Se define que vista
        $data['main'] = 'plantilla';
        //Se preparan los parametros de la vista
        $data['title'] = 'Altuve | Iniciar sesión';
        //Se carga la vista con plantilla
        $this->load->view('includes/template', $data);
    }

}
