<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Factura_model extends CI_Model {
	/**
	 * Propiedades
	 */
	public $id;
	public $fecha_v;
	public $fecha_p;
	public $forma_pago;
	public $docto;
	public $motivo_r;
	public $status_id;
	public $cliente_id;
	public $docto_id;

	/**
	 * Constructor de la clase
	 */
	function __construct()
    {
        parent::__construct();
        // inicializando propiedades
        $this->id = new stdClass();
        $this->fecha_v = new stdClass();
        $this->fecha_p = new stdClass();
        $this->forma_pago = new stdClass();
        $this->docto = new stdClass();
        $this->motivo_r = new stdClass();
        $this->status_id = new stdClass();
        $this->cliente_id = new stdClass();
        $this->docto_id = new stdClass();
    }

    /**
     * Pedidos registrados en la base de datos
     * @return object 
     */
	public function mostrar()
	{
		$resultado = $this->db->get("pedido");

		return ( is_object( $resultado ) && $resultado->num_rows() > 0 ) 
		? $resultado
		: die('Cero registros encontrados');
	}
	/**
	 * Busca todos los pedidos registrados en el sistema y enlaza la informacion 
	 * correspondiente a dicho pedido en las diferentes tablas de la base
	 * desde la vista pedido_realizado
	 * @return Object
	 */
	public function pedido_realizado()
	{
		$resultado = $this->db->get("pedido_realizado");

		return ( is_object( $resultado ) && $resultado->num_rows() > 0 ) 
		? $resultado
		: die('Cero registros encontrados');
	}

	/**
	 * Registra nueva factura
	 * @return int id nueva factura
	 */
	public function insertar()
	{
		$data = array(
			'fecha_v'    => $this->fecha_v,
			'fecha_p'    => $this->fecha_p,
			'forma_pago' => $this->forma_pago,
			'docto'      => $this->docto,
			'motivo_r'   => $this->motivo_r,
			'status_id'  => $this->status_id,
			'cliente_id' => $this->cliente_id,
			'docto_id'   => $this->docto_id
			);

		$resultado = $this->db->insert( 'pedido', $data );

		return $resultado;
	}
	

}

/* End of file factura_model.php */
/* Location: ./application/models/factura_model.php */