<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');



class Main extends CI_Controller {
 
    function __construct()
    {
        parent::__construct();
 
        $this->load->database();
 
    }
 
    public function index()
    {
        $this->load->library('table');
       
        $query = $this->db->query("SELECT * FROM producto");

         $this->table->set_heading('Codigo', 'Precio de venta', 'Precio de compra', 'Marca', 'Categoria', 'Fecha', 'Descripción','Acciones');

        foreach ($query->result() as $row)
        {
             $sentencia="SELECT * FROM marca where id=".$row->marcaid;
             $marca=$this->obtenerdatos("nombre",$sentencia);
             $sentencia="SELECT * FROM categoriap where id=".$row->categoriaid;
             $categoria=$this->obtenerdatos("descripcion",$sentencia);          
             $codigoPk=$row->codigo;
           
            $this->table->add_row(
                $row->codigo,
                $row->preciov,
                $row->precioc,
                $marca,
                $categoria,
                $row->fecha,
                $row->descripcion,
                "<button  type='button' id=$codigoPk onclick='generarCompra($codigoPk)'>Seleccionar</button>"
            );

        }
        //set_heading()
        echo $this->table->generate(); 

        $options = array();
        $query = $this->db->query("SELECT * FROM proveedor");
        foreach ($query->result() as $row)
        {
          $id=$row->id;
          $nombre=$row->nombre;
          array_push($options, array(
            $id=>$nombre 
            ));
        }
              /* $options = array(
                  'small'  => 'Small Shirt',
                  'med'    => 'Medium Shirt',
                  'large'   => 'Large Shirt',
                  'xlarge' => 'Extra Large Shirt',
                );*/
            form_open();
            $shirts_on_sale = array('small', 'large');

            echo form_label('Proveedor', 'proveedor');
            $js = 'id="proveedor"';
            echo form_dropdown('proveedor', $options, 'large',$js)."<br>";

            $data = array(
              'name'        => 'cantidad',
              'id'          => 'cantidad',
              'value'       => '',
              'maxlength'   => '100',
              'size'        => '20',
              'style'       => 'width:100',
            );
            echo form_label('Cantidad', 'cantidad');
            echo form_input($data)."<br>";

        echo form_submit('mysubmit', 'Generar');

        $dato["javascript"]='
            <script type="text/javascript">   
            this.seleccion=new Array();
            function generarCompra(codigo){
                  $.ajax({
                    url: "main?op=getp&codigo="+codigo,
                    cache: false
                  })
                   .done(function( html ) {
                    $( "#results" ).append( html );
                   });
                

                  if(document.getElementById(codigo).innerHTML=="Seleccionado"){
                    document.getElementById(codigo).innerHTML="Seleccionar";
                  }else{
                    document.getElementById(codigo).innerHTML="Seleccionado";
                    this.seleccion.push(codigo);                  
                  }
            }

  
            </script>
        ';
         $dato["prueba"]='<a onclick="mif()">hola</a>';
         $dato["title"]='Compras';
        $this->load->view('includes/template',$dato);
    }
    public function obtenerdatos($dato,$sentencia){
            $query = $this->db->query($sentencia);
              if ($query->num_rows() > 0)
                {
                   $row = $query->row();
                   $dato=$row->$dato;                   
                   return $dato;
                }

    }

}
 
