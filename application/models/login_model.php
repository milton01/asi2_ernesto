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

function validar_rol($username, $password)
{
    $this->db->select();        
    $this->db->from('usuario');  
    $this->db->where('nombre', $username);
    $this->db->where('password', $password);
    $query = $this->db->get();
    /*$this->db->where('nombre', $username);
    $this->db->where('password', $password);  
    $query = $this->db->get('usuario')->result();
    foreach ($query as $query){
        $rol = $query->tipo;
    }*/
    $row = $query->row();
    return $row->tipo;
}

function id_usuario($username, $password)
{
    $this->db->select();        
    $this->db->from('usuario');  
    $this->db->where('nombre', $username);
    $this->db->where('password', $password);
    $query = $this->db->get();
    /*$this->db->where('nombre', $username);
    $this->db->where('password', $password);  
    $query = $this->db->get('usuario')->result();
    foreach ($query as $query){	  	
        $id = $query->id;			 
    }*/
    $row = $query->row();
    return $row->id;
}

function valid_user_ajax($username){ 
			
	$this->db->where('usuario', $username);
        $query = $this->db->get('usuario');
	if($query->num_rows() >0){
            echo $query->num_rows();
	}
  }

}