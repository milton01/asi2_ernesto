<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Factura extends CI_Controller {

  	public function __construct()
    {
        parent::__construct();
        $this->load->model("factura_model");
    }

    /**
     * Inicio
     * @return view
     */
	public function index()
	{
		$data['pedidos'] = $this->factura_model->pedido_realizado();
		 //Se preparan los parametros de la vista
        $data['main']='factura/listar';
        $data['title']='Altuve | Facturas';
        $data['query'] = $data;
        
        //Se carga la vista con plantilla
        $this->load->view('includes/template',$data);

	}
	/**
	 * crear nueva factura
	 * @return view
	 */
	public function crear()
	{
		$this->factura_model->fecha_v = date('Y-m-d');
		$this->factura_model->fecha_p = date('Y-m-d');
		$this->factura_model->forma_pago = 'CONTADO';
		$this->factura_model->docto = '12345';
		$this->factura_model->motivo_r = null;
		$this->factura_model->status_id = 2;
		$this->factura_model->cliente_id = 1;
		$this->factura_model->docto_id = 1;
		//$this->factura_model->insertar();
	}


}

/* End of file factura.php */
/* Location: ./application/controllers/factura.php */