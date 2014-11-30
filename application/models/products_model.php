<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Products_Model extends CI_Model {

function get_products($pagination, $segment) {
	
  $this->db->order_by('codigo', 'asc'); 	
  $this->db->limit($pagination, $segment);
  $query = $this->db->get('producto')->result();
     
  	/*	foreach ($query as $result) {
			
			if ($result->valores) {
				$result->valores = explode(',',$result->valores);
			}
			
		} */
		
	return $query;	      
}
  
function get_product($id) {
		
		$query = $this->db->get_where('producto', array('codigo' => $id))->result();
			
		$result = $query[0];
		
		if ($result->valores) {
			$result->valores = explode(',',$result->valores);
		}
				
		return $result;
	}

function pedido($id_cliente)
{
	$datestring = "%Y-%m-%d";
	$time = time();
	$fecha=mdate($datestring, $time);

echo mdate($datestring, $time);
	$data1 = array(
			'fecha_p' => $fecha,
			'cliente_id' => $id_cliente
			// para quitar los acentos	    
		);
	$this->db->insert('pedido', $data1);
		$id_ped = $this->db->insert_id();
		foreach($cart as $item){ 
	$data = array(
			'codigopro' => $item['id'],
			'cantidad' => $item['qty'],
			'peido_id' => $id_ped
			 // para quitar los acentos	    
		);
		$this->db->insert('detalle_pedido', $data);		 
    } // fin de
}



    	  
}
