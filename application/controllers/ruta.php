<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class ruta extends CI_Controller {
    
    /* Funciones de inicializacion */
    
    public function __construct() {
        parent::__construct();
        //Carga modelos aca
        $this->load->model('ruta_model');
        $this->load->model('pedido_model');
    }
    
    
    /* Funciones de consulta de datos */
    
    public function index() {        
        //Se ejecuta la consulta
        $query = $this->ruta_model->listar_rutas();

        //Se preparan los parametros de la vista
        $data['main']='ruta/listar';
        $data['title']='Altuve | Rutas';
        $data['query'] = $query;
        
        //Se carga la vista con plantilla
        $this->load->view('includes/template',$data);
    }
        
    public function ruta_pedidos($rt_id, $excede=null) {        
        //Se ejecuta la consulta
        $query_pd_sinasignar = $this->ruta_model->listar_ruta_pedidos($rt_id, 3); //Estado no despachado
        $query_pd_asignados = $this->ruta_model->listar_ruta_pedidos($rt_id, 8); //Estado confirmado
        
        //Consultas de encabezado
        $query_ruta = $this->ruta_model->mostrar_ruta($rt_id);
        //Se extran los valores de la consulta
        $row_ruta = $query_ruta->row();
        
        //Consultas de encabezado
        $query_transporte = $this->ruta_model->mostrar_transporte($rt_id);
        //Se extran los valores de la consulta
        $row_transporte = $query_transporte->row();
        
        //Consultas de encabezado
        $query_ruta_transporte_volumen = $this->ruta_model->mostrar_ruta_transporte_volumen($rt_id);
        //Se extran los valores de la consulta
        $row_ruta_transporte_volumen = $query_ruta_transporte_volumen->row();
        
        
        //Se preparan los parametros de la vista
        $data['main']='ruta/ruta_pedidos';
        $data['title']='Altuve | Ruta | Pedidos';
        $data['rt_id'] = $rt_id;
        $data['excede'] = $excede;        
        $data['row_ruta'] = $row_ruta;
        $data['row_transporte'] = $row_transporte;
        $data['row_ruta_transporte_volumen'] = $row_ruta_transporte_volumen;
        $data['query_pd_sinasignar'] = $query_pd_sinasignar;
        $data['query_pd_asignados'] = $query_pd_asignados;
        
        //Se carga la vista con plantilla
        $this->load->view('includes/template',$data);
    }
    
    /* Funciones de manipulacion de datos */
    
    public function agregar_pedido($rt_id, $pd_id) {
        if ( $pd_id != null ) {
            
            //Consultas de encabezado
            $query_transporte = $this->ruta_model->mostrar_transporte($rt_id);
            //Se extran los valores de la consulta
            $row_transporte = $query_transporte->row();
            
            //Consultas de encabezado
            $query_ruta_transporte_volumen = $this->ruta_model->mostrar_ruta_transporte_volumen($rt_id);
            //Se extran los valores de la consulta
            $row_ruta_transporte_volumen = $query_ruta_transporte_volumen->row();
            
            //Consultas de encabezado
            $query_pedido_volumen = $this->ruta_model->mostrar_pedido_volumen($pd_id);
            //Se extran los valores de la consulta
            $row_pedido_volumen = $query_pedido_volumen->row();
            
            if ( !( ($row_pedido_volumen->pd_volumen + $row_ruta_transporte_volumen->rt_volumen) > $row_transporte->capacidad_volumen ) ){
            
                $this->db->trans_start();
                    //Actualiza el estado del ruta a despachado
                    $pedido_actualizado = $this->ruta_model->estado_pedido($pd_id, 8); //Estado confirmado
                $this->db->trans_complete();
            
            }else{
                //Retorna a principal con cambios guardados
                redirect('ruta/ruta_pedidos/'.$rt_id.'/1');
            }
                
        }        
        //Retorna a principal con cambios guardados
        redirect('ruta/ruta_pedidos/'.$rt_id);
    }
    
    public function remover_pedido($rt_id, $pd_id) {
        if ( $pd_id != null ) {
            
            $this->db->trans_start();
                //Actualiza el estado del ruta a despachado
                $pedido_actualizado = $this->ruta_model->estado_pedido($pd_id, 3); //Estado no despachado
            $this->db->trans_complete();
                
        }        
        //Retorna a principal con cambios guardados
        redirect('ruta/ruta_pedidos/'.$rt_id);
    }


    public function cargar_transporte($rt_id) {
        if ( $rt_id != null ) {            

            //Consultas de encabezado
            $query_transporte = $this->ruta_model->mostrar_transporte($rt_id);
            //Se extran los valores de la consulta
            $row_transporte = $query_transporte->row();
            
            $this->db->trans_start();

                //Inserta la carga
                $carga_insertada = $this->ruta_model->insertar_carga($rt_id, $row_transporte->placa, 1); //ID de empleado (tercer parametro) deberia ser cargadod esde variable de sesion

                //Extrae los pedidos
                $query_pd_asignados = $this->ruta_model->listar_ruta_pedidos($rt_id, 8); //Estado confirmado
                if ($query_pd_asignados){
                    foreach ($query_pd_asignados->result() as $row_pd_asignados)
                    {
                        //Extrae el detalle del pedido
                        $query_detalle_pedido = $this->pedido_model->listar_detalle_pedido($row_pd_asignados->pd_id);
                        if ($query_detalle_pedido){
                            foreach ($query_detalle_pedido->result() as $row_detalle_pedido)
                            {
                                //Inserta el detalle de la carga
                                $detalle_carga_insertado = $this->ruta_model->insertar_detalle_carga($row_detalle_pedido->dp_cantidad, $row_detalle_pedido->pr_codigo, $carga_insertada);
                                
                            }
                        }
                        
                        //Actualiza el estado del ruta a despachado
                        $pedido_actualizado = $this->ruta_model->estado_pedido($row_pd_asignados->pd_id, 4); //Estado despachado
                    }
                }

                //Actualiza el estado del transporte
                $transporte_actualizado = $this->ruta_model->estado_transporte($row_transporte->placa, 10); //Estado En ruta
                
            $this->db->trans_complete();
                
        }        
        //Retorna a principal con cambios guardados
        //redirect('ruta/ruta_pedidos/'.$rt_id);
        redirect('ruta');
    }
    
}