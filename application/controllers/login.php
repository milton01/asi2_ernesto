<?php 

class Login extends CI_Controller{
	
function __construct() 
{ 
    parent::__construct();
    $this ->load->model('Login_Model');	
    $this ->load->model('Products_Model');
    $this->load->library(array('pagination', 'cart', 'form_validation','email', 'table'));
    $this->load->helper('text');
}
   
function index()
{       
    if ($this->input->post('username') and $this->input->post('password')){
        // reglas de validación
        $username = $this->input->post('username');        
        $password = md5($this->input->post('password'));        
        //$this->form_validation->set_rules('username', 'Usuario', 'required|xss_clean|callback__valid_login');
        //$this->form_validation->set_rules('password', 'Contraseña','|md5|required|xss_clean');

        //$this->form_validation->set_message('required', 'el campo %s es requerido');
        //$this->form_validation->set_message('_valid_login', 'El usuario o contraseña son incorrectos');
        //$this->form_validation ->set_error_delimiters('<ul><li>', '</li></ul>');    
        //if ($this->form_validation->run() == FALSE){
        //$data['title'] = 'Altuve -  Iniciar sesión';            
        //$this->load->view('admin/login',$data);            
        //}
        //else{        
            $rol=$this->Login_Model->validar_rol($username,$password);
            $id_usuario = $this->Login_Model->id_usuario($username, $password);
            $this->session->set_userdata('id_usuario', $id_usuario);
            
            if ($rol=="cliente") {
                redirect('products');
                /*$pagination = 3;
                //$config['base_url'] = base_url().'index.php/products/index'; //utilizar esta url si no la reconoce sin el index.php	
                $config['base_url'] = base_url().'products/index';   
                $config['total_rows'] = $this->db->get('producto')->num_rows();
                $config['per_page'] = $pagination;
                $config['num_links'] = 20; 
                $config['next_link'] = 'Siguiente »';
                $config['prev_link'] = '« Anterior';
                $this->pagination->initialize($config);
                $username = $this->input->post('username');
                $data_user = $array = array('user'=> $username, 'logued_in' => TRUE);
                // asignamos dos datos a la sesión --> (username y logued_in)									 
                $this->session->set_userdata($data_user); 
                $data['user'] = $username;  // = $this->session->userdata('user');
                $data['id'] =$id_cliente;
                $data['title'] = 'Altuve'; 
                $data['results'] = $this->Products_Model->get_products($pagination, $this->uri->segment(3));
                $this->load->view('front/header',$data);
                $this->load->view('front/content');	
                $this->load->view('front/footer');*/
            }else if ($rol=="vendedor") {

                redirect('pedido');

            }else{
                //echo $rol;
                $data['title'] = 'Altuve -  Iniciar sesión';            
                $this->load->view('admin/login',$data);  
            }
    //}
    }else{
        $data['title'] = 'Altuve -  Iniciar sesión';            
        $this->load->view('admin/login',$data);  
    }    
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