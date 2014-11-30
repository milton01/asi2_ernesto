factura = {
	pedidosPendientes: {},
	estilo: {
		profesional: function() {
			return factura
				.pedidosPendientes
				.DataTable({
					"language": {
						"url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
					}
				});
		}
	},
	init: function() {
		this.pedidosPendientes = $("#pedidos-pendientes");

		factura.estilo.profesional();
	}
};

jQuery(document).ready(function($) {
	factura.init();
});