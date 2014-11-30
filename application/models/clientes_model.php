<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Clientes_model extends CI_Model{
	
/*function get_users(){
   $this->db->select('cliente_id, nit, dui, registro');
   $query = $this->db->get('users');
   return $query->result();
   
}*/

function get_clientes(){
   $this->db->select('nombre,password,tipo_usuario');
   $query = $this->db->get('usuario');
   return $query->result();
   
}

/*function username_check($username)
{
  $this->db->where('username', $username);
  $query = $this->db->get('users');
  
  if($query->num_rows>0){
  	return FALSE;
   }else{
  		 return TRUE;
	    }
}*/


/*function add_user($name, $last_name, $username,$password){
	
	$data = array(
	'name' => $name,
	'last_name' => $last_name,
	'username' => $username,
	'password' => $password
	);
	
	return $this->db->insert('users', $data);
}*/
function add_cliente($nombre,$password){
  
  $data = array(
  'nombre' => $nombre,   
  'password' => $password
  );
  
  return $this->db->insert('usuario', $data);
}
function add_cliente2($nit,$dui,$registro,$giro,$nombre_j,$nombre_c,$contacto,$telefono_1,$telefono_2,$celular,$fax,$correo,$tipo,$categoria,$direccion,$municipio,$departamento)
{
  $data= $arrayName = array(
    'nit' => $nit,
    'dui' => $dui,
    'registro' => $registro,
    'giro' => $giro,
    'nombre_j' => $nombre_j,
    'nombre_c' => $nombre_c,
    'contacto' => $contacto,
    'telefono_1' => $telefono_1,
    'telefono_2' => $telefono_2,
    'celular' => $celular,
    'fax' => $fax,
    'correo' => $correo,
    'tipo' => $tipo,
    'categoria' => $categoria,
    'direccion' => $direccion,
    'municipio' => $municipio,
    'departamento' => $departamento
   );
  $this->db->insert('cliente', $data);
  return $this->db->insert_id();
}

function usuarioAdd($nombreU,$passwordU,$idcli)
{
  $data2 = array(
  'nombre' => $nombreU,   
  'password' => $passwordU,
  'id_cliente' => $idcli
  );
  return $this->db->insert('usuario', $data2);
}

function edit_cliente($id)
{
  $this->db->where('id', $id);
  $query = $this->db->get('usuario');
  
return $query->result();
}

function update_user($id, $name,$last_name, $username,$password){
	
	$data = array(
               'nombre' => $name,
               'password' => $last_name,
               'tipo_usuario' => $username
               
            );

$this->db->where('id', $id);
return $this->db->update('usuario', $data);

 	
}

function user_check($username, $id){
   	
$this->db->where('id !=', $id);
$this->db->where('username', $username);
$query = $this->db->get('users');

   if($query->num_rows()>0){
   	
	return false;
	
   }else{
   	
	return true;
   }
 }

function delete_user($id){
	
	$this->db->where('id', $id);
	$query = $this->db->delete('usuario'); 

return true;

}

}