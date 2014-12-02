<?php

class Master extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Login_Model');
        $this->load->library(array('pagination', 'cart', 'form_validation','email', 'table'));
        $this->load->helper('text');
    }

    function index(){       
    if ($this->input->post('username') and $this->input->post('password')){
        // reglas de validación
            $username = $this->input->post('username');        
            $password = md5($this->input->post('password'));
            
            $rol=$this->Login_Model->validar_rol($username,$password);
            $id_usuario = $this->Login_Model->id_usuario($username, $password);
            
            $this->session->set_userdata('id_usuario', $id_usuario);
            
            if ($rol=="administrador") {
                redirect('roles/menu_admin');
                
            }else if ($rol=="cliente") {

                redirect('roles/menu_cliente');

            }else if ($rol=="bodeguero") {

                redirect('roles/menu_bodeguero');
                
            }else if ($rol=="televendedor") {
                
                //redirect('roles/menu_bodeguero'); 
                
            }
    }else{                
                //Se define que vista
                $data['main'] = 'signin';
                //Se preparan los parametros de la vista
                $data['title'] = 'Altuve | Administrador';
                //Se carga la vista con plantilla
                $this->load->view('includes/template', $data); 
            
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
    
     public function olvido_password() {
        //Se define que vista
        $data['main'] = 'forgot_password';
        //Se preparan los parametros de la vista
        $data['title'] = 'Altuve | Olvide password';
        //Se carga la vista con plantilla
        $this->load->view('includes/template', $data);
    }
    
    function _valid_login($username,$password)
	{ 
	    $username = $this->input->post('username');
	    $password = md5($this->input->post('password'));
            return $this->Login_Model->valid_user($username,$password);
	}

function valid_login_ajax(){
    //verificamos si la petición es via ajax
    if($this->input->is_ajax_request()){
        if($this->input->post('username')!==''){
            $username = $this->input->post('username');
            $this->Login_Model->valid_user_ajax($username);

        }
    }else{
		redirect('login');
    }

} // fin del método valid_login_ajax
	
function logout(){
          	
         $this->session->sess_destroy(); 
		 redirect('login');		
}

}
