<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Clientes extends CI_controller{
	
	function __construct() 
    { 
		parent::__construct();
		$this ->load->model('Clientes_model');		
// estas reglas son comunes a los formularios de crear y editar por eso las inicializamos en el constructor	
		$this->form_validation->set_rules('dui','required|min_length[8]');
		$this->form_validation->set_rules('nit','required|min_length[15]');       	    
		//$this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[4]|md5');
		//$this->form_validation->set_rules('passconf', 'Confirmar password', 'required|matches[password]|md5');
		//$this->form_validation->set_message('required', 'el campo %s es requerido');
		//$this->form_validation->set_message('matches', 'El password no coincide');			
		$this -> form_validation -> set_error_delimiters('<ul><li>', '</li></ul>');
   }
	
  function index(){
   	
	$data['title'] = 'Formulario de registro';
	$data['records'] = $this->Clientes_model->get_clientes();
	
	//$this->load->view('admin/header_admin',$data);
	$this->load->view('front/clientes',$data);
	//$this->load->view('front/footer');
	
   }
   
  function add(){ // Agregar Clientes
   	
	$data['title'] = 'Registrar Clientes'; 
		
  	$this->form_validation->set_rules('nit', 'dui', 'required');		
	
		
		if ($this->form_validation->run() == FALSE){			
			//$this->load->view('admin/header_admin',$data);
			$this->load->view('front/clientes',$data);
			//$this->load->view('front/footer');		
		}else{
			$nit = $this->input->post('nit');
			$dui = $this->input->post('dui');
			$registro = $this->input->post('registro');
			$giro = $this->input->post('giro');
			$nombre_j = $this->input->post('nombre1');
			$nombre_c = $this->input->post('nombre2');
			$contacto = $this->input->post('contacto');
			$telefono_1 = $this->input->post('telefono1');
			$telefono_2 = $this->input->post('telefono2');
			$celular = $this->input->post('celular');
			$fax = $this->input->post('fax');
			$direccion = $this->input->post('direccion');
			$municipio = $this->input->post('municipio');
			$departamento = $this->input->post('departamento');
			$correo = $this->input->post('correo');

			$insert = $this->Clientes_model->add_cliente($nit,$dui,$registro,$giro,$nombre_j,$nombre_c,$contacto,$telefono_1,$telefono_2,$celular,$fax,$correo,$direccion,$municipio,$departamento);
					
			$data['title'] = 'El usuario se agregó correctamente'; 
			//$this->load->view('admin/header_admin',$data);
			$this->load->view('front/clientes',$data);
			//$this->load->view('front/footer');	
	
		}

} // fin del método	

  // Método privado
function _username_check($username){ // verificamos si el usario existe
		return $this->Users_model->username_check($username);
	}
	
function edit() // Método para tomar los datos del usuario y pasarlos al formulario de editar
	{   $id=$this->input->post('id'); 
	    
		if($id!=''){
			
			$data['title'] = 'Editar Usuarios';  
		    $data['results'] = $this->Users_model->edit_user($id);
		
			$this->load->view('admin/header_admin',$data);
			$this->load->view('admin/edit_user');
			$this->load->view('front/footer');		   
		
		}else{ redirect('users');}	
		
	} // fin

function update(){ // Si los datos son válidos se actualiza el usuario de lo contrario se muestran los mensajes de error
 	
	    $data['title'] = 'Editar Usuario';
		$data['id'] = $this->input->post('id'); 
		
		    $this->form_validation->set_rules('username', 'Usuario', 'required|callback__user_check|min_length[4]|max_length[15]');		
		$this->form_validation->set_message('_user_check', 'El nuevo Usuario que trata de tomar está en uso');
		
		if ($this->form_validation->run() == FALSE){			
			$this->load->view('admin/header_admin',$data);
			$this->load->view('admin/edit_user');
			$this->load->view('front/footer');		
		}else{
			$id = $this->input->post('id');
			$name = $this->input->post('name');
			$last_name = $this->input->post('last_name');
			$username = $this->input->post('username');
			$password = $this->input->post('password');
					
			$insert = $this->Users_model->update_user($id, $name, $last_name, $username, $password);
			
		if($insert){
			
			$data['title'] = 'El usuario se actualizó correctamente'; 
			$this->load->view('admin/header_admin',$data);
			$this->load->view('admin/success');
			$this->load->view('front/footer');
			
			}else{
				
			$this->load->view('admin/header_admin',$data);
			$this->load->view('admin/edit_user');
			$this->load->view('front/footer');	
				
			}
	
		}
	
 }// fin update

	function _user_check($username)
	{
		if($id = $this->input->post('id')){
			
		return  $this->Users_model->user_check($username, $id);
		
		}
		

	}
	
function delete(){
	
	 $id = $this->input->post('id');
	 $delete= $this->Users_model->delete_user($id);
	 
	 if($delete){
	 	
			$data['title'] = 'El usuario se eliminó correctamente'; 
			$this->load->view('admin/header_admin',$data);
			$this->load->view('admin/success');
			$this->load->view('front/footer');
	 }
	
}	
	
}