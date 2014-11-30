<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Products extends CI_Controller {

	function __construct() { 
		parent::__Construct();
		$this ->load->model('Products_Model');
		$this->load->library(array('pagination', 'cart', 'form_validation','email', 'table'));
		$this->load->helper('text');
		$this->load->helper('date');

       }
	
function index(){
   	 
	    $pagination = 3;
//$config['base_url'] = base_url().'index.php/products/index'; //utilizar esta url si no la reconoce sin el index.php	
        $config['base_url'] = base_url().'products/index';   
        $config['total_rows'] = $this->db->get('producto')->num_rows();
        $config['per_page'] = $pagination;
        $config['num_links'] = 20; 
        $config['next_link'] = 'Siguiente »';
        $config['prev_link'] = '« Anterior';
	
        $this->pagination->initialize($config);
      	
	$data['title'] = 'Altuve'; 
	$data['results'] = $this->Products_Model->get_products($pagination, $this->uri->segment(3));
		
	$this->load->view('front/header',$data);
	$this->load->view('front/content');	
	$this->load->view('front/footer');

       }
	
// ******  Métodos para el carrito ******* 
 
function add(){ 
	/* 
	 * Lo primero que hace este método es verificar si algún producto ya fué
	 * seleccionado, si es así tomará el rowid y el qty del carrito,
	 * para actualizarlo, de lo contrario se insertará.
	 * 	 
	 * */
    $segment = $this->input->post('segment');
    $url = base_url().'products/index/'.$segment; 
	
    $id = $this->input->post('id'); 
    $product = $this->Products_Model->get_product($id);
    //$option = $this->input->post($product->opcion); 

/*if($product->opcion){ // si el producto tiene opciones las colocamos en un arreglo
	
	 foreach ($product->valores as $key => $values) { 
	 			  
			  $value[] = $values;
	
		   }
	
	$id_option = $id.$value[$option]; // se crea una variable como identificador único
	$selected = $value[$option]; // la opción seleccionada está en la posición $option */
//}
	 
    $row='';
	
if($cart = $this->cart->contents()){ // verificamos si el carrito existe 
					
	foreach($cart as $item){ //foreach contenedor
		
			if($item['id'] === $id){
									
				 $row = $item['rowid']."-".($item['qty']+1);
				break;	// si se cumple la condición el foreach dejará de ejecutarse	
		  }
				
		/*if($this->cart->has_options($item['rowid'])) {				
													
		foreach($this->cart->product_options($item['rowid']) as $key => $options){ // foreach interno
				
						 $cart_option = $item['id'].$options;
							 					 
						 if($cart_option === $id_option){
							 
								$row = $item['rowid']."-".($item['qty']+1); 
								break; 
							 }
						} // fin del foreach interno
						
					} // fin del if que evalua si los productos insertados en el carrtito tienen opciones
		
		}// fin del foreach contenedor */
		
	} // fin del if que evalua si el carrito existe
}
/* la variable $row contiene el rowid y el qty de cada producto concatenados; si esta
 * variable no está vacia significa que se debe actualizar el producto */

if($row!==''){
	
	$this->update($row, $url);
	
}else{
	$insert = array(
			'id' => $id,
			'qty' => 1,
			'price' => $product->preciov,
		    'name'=>convert_accented_characters($product->descripcion) // para quitar los acentos	    
		);
	
        /*if($selected!==Null){
			
			$insert['options'] = array(
				$product->opcion => $selected 
			);
			
		} */
							
		$this->cart->insert($insert); 
		redirect($url);	// si en Windows da algún problema remplazarlo por: redirect($url, 'refresh');	
}

		
}	/// fin del método add

function update($row, $url) {
			 
	$row=explode('-',$row); 
        	$this->cart->update(array(
			'rowid' => $row[0],
			'qty' => $row[1]
		));
		
		redirect($url);
		
	}

function update_cart($row) {
			 
	$row= explode('-',$row); 
        	$this->cart->update(array(
			'rowid' => $row[0],
			'qty' => $row[1]
		));
		
		redirect('products/cart');
		
	}
	
function remove($rowid) {
		
		$this->cart->update(array(
			'rowid' => $rowid,
			'qty' => 0
		));
		
	redirect('products/cart');
		
	}

function delete() {
		$message='El carrito se ha eliminado satisfactoriamente';
		$this->cart->destroy();
		$this->cart($message);
		
	}	

function cart($message=NULL){
 	
 	$data['message']=$message;
	$data['title']='Carrito de Compras';
	
	$this->load->view('front/header', $data);
	$this->load->view('front/cart');
	$this->load->view('front/footer');
	
  } 
// Método para enviar el pedido al correo del cliente y el administrador del sitio
function checkout(){
	$id_cli = '12';
	$this->Products_Model->pedido($id_cli);
} 
}