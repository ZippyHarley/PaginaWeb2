var usu_id = $('#usu_idx').val();

function init(){ 
    $("#socialMedia_form").on("submit",function(e){
        guardaryeditar(e);
    });
}

function guardaryeditar(e) {
    e.preventDefault();
    var formData = new FormData($("#socialMedia_form")[0]);
  
    $.ajax({
      url: "/Pagina/controller/social_media.php?opc=guardaryeditar",
      type: "POST",
      data: formData,
      contentType: false,
      processData: false,
      success: function(data) {
        console.log(data);
        $('#socialMedia_data').DataTable().ajax.reload();
        $('#modalcrearRedes').modal('hide');
  
        Swal.fire({
          title: '¡Correcto!',
          text: 'Se Registro Correctamente',
          icon: 'success',
          confirmButtonText: 'Aceptar'
        })
      }
    });
  }

  $(document).ready(function(){
    $('#socialMedia_data').DataTable({
        "aProcessing": true,
        "aServerSide": true,
        dom: 'Btrtrip',
        buttons: [
            'excelHtml5',
            'csvHtml5',
        ],
        "ajax": {
            url: "/pagina/controller/social_media.php?opc=Listar",
            type: "post"
        },
        "bDestroy": true,
        "responsive": true,
        "bInfo": true,
        "iDisplayLength": 15,
        "order": [[6, "desc"]],
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar MENU_ registros",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ningún dato disponible en esta tabla", // Corregido aquí
            "sInfo": "Mostrando registros del START al END de un total de TOTAL registros",
            "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
            "sInfoFiltered": "(filtrado de un total de MAX registros)",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ".",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        }
    });
});

function editar(socmed_id) {
    $.post("/pagina/controller/social_media.php?opc=mostrar", { socmed_id: socmed_id }, function(data) {
      data = JSON.parse(data);
      console.log(data);
      $('#socmed_id').val(data.socmed_id);
      $('#socmed_icono').val(data.socmed_icono);
      $('#socmed_url').val(data.socmed_url);
    });
    $('#titulo_modal').html('Editar Red');
    $('#modalcrearRedes').modal('show');
  }

  function eliminar(socmed_id) {
    Swal.fire({
      title: 'Eliminar!',
      text: 'Desea eliminar el Registro?',
      icon: 'error',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Aceptar',
      cancelButtonText: 'Cancelar'
    }).then((result) => {
      if (result.isConfirmed) {
        $.post("/Portafolio/controller/social_media.php?opc=eliminar", { socmed_id: socmed_id }, function(data) {
          $('#socialMedia_data').DataTable().ajax.reload();
          Swal.fire({
            title: 'Correcto!',
            text: 'Se Elimino Correctamente',
            icon: 'success',
            confirmButtonText: 'Aceptar'
          })
        });
      }
    })
  }
