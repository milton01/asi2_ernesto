<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login_Model extends CI_Model{
	
function valid_user($username, $password)
{
  $this->db->where('nombre', $username);
  $this->db->where('password', $password);
  
  $query = $this->db->get('usuario');
   
   if($query->num_rows() >0){

 	return TRUE;
	
    }else{
    	
        return FALSE;
    }
}

function validad_rol($username, $password)
{
	$this->db->where('nombre', $username);
	$this->db->where('password', $password);
  
  	$query = $this->db->get('usuario')->result();

  	foreach ($query as $query){
	  	
		   $rol = $query->tipo_usuario;			 
	       	   	       
     }
  	return $rol;
}

function id_cli($username, $password)
{
	$this->db->where('nombre', $username);
	$this->db->where('password', $password);
  
  	$query = $this->db->get('usuario')->result();

  	foreach ($query as $query){
	  	
		   $id_cli = $query->id_cliente;			 
	       	   	       
     }
  	return $id_cli;
}

function valid_user_ajax($username){ 
			
	$this->db->where('usuario', $username);
        $query = $this->db->get('usuario');
	if($query->num_rows() >0){
            echo $query->num_rows();
	}
  }

}