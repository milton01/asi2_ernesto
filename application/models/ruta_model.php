<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ruta_model extends CI_Model{
    
    /* Funciones de inicializacion */
    
    function tiempo_ahora(){
        return date('Y-m-d H:i:s');
    }
    
    function fecha_ahora(){
        return date('Y-m-d');
    }

    /* Funciones de consulta de datos */

    function listar_rutas(){
        //Query directa            
        $query = $this->db->query("SELECT
                                    rt.id AS rt_id,
                                    rt.nombre AS rt_nombre,
                                    IFNULL((SELECT tn.placa FROM transporte tn WHERE tn.ruta_id = rt.id), 'N/A') AS tn_placa,
                                    IFNULL((SELECT tn.status_id FROM transporte tn WHERE tn.ruta_id = rt.id), 'N/A') AS tn_estado
                                  FROM
                                    ruta rt");
        //Devolvemos al controlador los datos
        if ($query->num_rows() > 0) return $query; 
    }
    
    function listar_ruta_pedidos($rt_id, $st_id){
        //Define el arreglo con parametros escapados para la query
        $data = array();
        $data[] = $rt_id; //Define la ruta
        $data[] = $st_id; //Define el estado
        
        //Query directa            
        $query = $this->db->query("SELECT 
                                    pd.id AS pd_id,
                                    cl.cliente_id AS cl_id,
                                    cl.nombre_c AS cl_nombre,
                                    (select SUM(dp.cantidad * pr.capacidad) from detalle_pedido dp natural join producto pr where dp.pedido_id = pd.id) as pd_volumen,
                                    (select SUM(dp.cantidad * pr.preciov) from detalle_pedido dp natural join producto pr where dp.pedido_id = pd.id) as pd_monto,
                                    (select st.descripcion from estatus st WHERE st.id = pd.status_id) AS pd_status
                                  FROM
                                    pedido pd INNER JOIN cliente cl ON pd.cliente_id=cl.cliente_id
                                  WHERE
                                    cl.ruta_id = ? AND
                                    pd.status_id = ?", $data);
        //Devolvemos al controlador los datos
        if ($query->num_rows() > 0) return $query; 
    }   

    function mostrar_ruta($rt_id){
        //Query con framework (parametros automaticamente escapados)
        $this->db->select();        
        $this->db->from('ruta');  
        $this->db->where('id', $rt_id);         
        $query = $this->db->get();
        //Devolvemos al controlador los datos
        if ($query->num_rows() > 0) return $query;        
    }
    
    function mostrar_transporte($rt_id){
        //Query con framework (parametros automaticamente escapados)
        $this->db->select();        
        $this->db->from('transporte');  
        $this->db->where('ruta_id', $rt_id);         
        $query = $this->db->get();
        //Devolvemos al controlador los datos
        if ($query->num_rows() > 0) return $query;        
    }
    
    function mostrar_ruta_transporte_volumen($rt_id){
        //Define el arreglo con parametros escapados para la query
        $data = array();
        $data[] = $rt_id; //Define la ruta
        $data[] = 8; //Define el estado confirmado
        
        //Query directa            
        $query = $this->db->query("SELECT                                     
                                    IFNULL( SUM( (select SUM(dp.cantidad * pr.capacidad) from detalle_pedido dp natural join producto pr where dp.pedido_id = pd.id) ), 0 )as rt_volumen
                                  FROM
                                    pedido pd INNER JOIN cliente cl ON pd.cliente_id=cl.cliente_id
                                  WHERE
                                    cl.ruta_id = ? AND
                                    pd.status_id = ?", $data);
        //Devolvemos al controlador los datos
        if ($query->num_rows() > 0) return $query;       
    }
    
    function mostrar_pedido_volumen($pd_id){
        //Define el arreglo con parametros escapados para la query
        $data = array();
        $data[] = $pd_id; //Define el pedido        
        
        //Query directa            
        $query = $this->db->query("SELECT                                     
                                    IFNULL( SUM( (select SUM(dp.cantidad * pr.capacidad) from detalle_pedido dp natural join producto pr where dp.pedido_id = pd.id) ), 0 )as pd_volumen
                                  FROM
                                    pedido pd INNER JOIN cliente cl ON pd.cliente_id=cl.cliente_id
                                  WHERE                                    
                                    pd.id = ?", $data);
        //Devolvemos al controlador los datos
        if ($query->num_rows() > 0) return $query;       
    }
    
    /* Funciones de manipulacion de datos */    

    function estado_pedido($pd_id, $st_id){

        $data = array( 
                        'status_id' => $st_id
                        );
        $this->db->where('id', $pd_id);           
        return $this->db->update('pedido',$data);        
    }

    function estado_transporte($tr_id, $st_id){

        $data = array( 
                        'status_id' => $st_id
                        );
        $this->db->where('placa', $tr_id);           
        return $this->db->update('transporte',$data);
    }

    
    function insertar_carga($rt_id, $tr_id, $em_id){

        $data = array(                          
                        'fecha' => $this->fecha_ahora(),                        
                        'hora' => $this->tiempo_ahora(),                        
                        'descripcion' => "Carga de producto",
                        'transporte_placa' => $tr_id,
                        'empleado_id' => $em_id,
                        'ruta_id' => $rt_id
                        
                    );
        $this->db->insert('carga',$data);
        return $this->db->insert_id();
    }

    function insertar_detalle_carga($dp_cantidad, $pr_codigo, $cr_id){

        $data = array(                          
                        'cantidad' => $dp_cantidad,                        
                        'codigoprod' => $pr_codigo,                        
                        'carga_id' => $cr_id
                    );
        $this->db->insert('detalle_carga_producto',$data);
        return $this->db->insert_id();
    }

    
















    
    function actualizar_detalle_ruta($dp_id, $dp_cantidad){
        $data = array( 
                        'cantidad' => $dp_cantidad
                        );
        $this->db->where('id', $dp_id);           
        return $this->db->urtate('detalle_ruta',$data);
    }
    
    function actualizar_inventario($rt_id, $pr_id, $mv_id, $al_id, $in_cantidad){
        $data = array( 
                        'cantidad' => $in_cantidad,
                        'fecha_mov' => $this->fecha_ahora()
                        );
        $this->db->where('no_transaccion', $rt_id);
        $this->db->where('codigoprod', $pr_id);        
        $this->db->where('tipo_mov', $mv_id);
        $this->db->where('movimientoid', $mv_id);
        $this->db->where('almacenid', $al_id);
        return $this->db->urtate('inventario',$data);
    }
    
    function eliminar($id){

        $this->db->where('id', $id);           
        return $this->db->delete('tabla');                  
    }

}
    
?>
