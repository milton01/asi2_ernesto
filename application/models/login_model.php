<?php

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

function valid_user_ajax($username){ 
			
	$this->db->where('usuario', $username);
    $query = $this->db->get('usuario');
		  
		 if($query->num_rows() >0){
                
			 echo $query->num_rows();
			 
		     }
  }

}
