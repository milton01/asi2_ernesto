<?php

class Roles extends CI_Controller{
 
    public function menu_admin() {
        //Se define que vista
        $data['main'] = 'menu';
        //Se preparan los parametros de la vista
        $data['title'] = 'Altuve | Administrador';
        //Se carga la vista con plantilla
        $this->load->view('includes/template', $data);
    }
    public function menu_telventa() {
        //Se define que vista
        $data['main'] = 'menu_televendedor';
        //Se preparan los parametros de la vista
        $data['title'] = 'Altuve | Telventa';
        //Se carga la vista con plantilla
        $this->load->view('includes/template', $data);
    }
    public function menu_bodeguero() {
        //Se define que vista
        $data['main'] = 'menu_bodeguero';
        //Se preparan los parametros de la vista
        $data['title'] = 'Altuve | Bodega';
        //Se carga la vista con plantilla
        $this->load->view('includes/template', $data);
    }
    public function menu_cliente() {
        //Se define que vista
        $data['main'] = 'menu_cliente';
        //Se preparan los parametros de la vista
        $data['title'] = 'Altuve | Cliente';
        //Se carga la vista con plantilla
        $this->load->view('includes/template', $data);
    }
}
