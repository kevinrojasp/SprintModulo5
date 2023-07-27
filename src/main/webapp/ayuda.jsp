
<section>
    <div class="container">
        <button id="helpButton" class="btn ayuda" style="position: fixed; bottom: 0; right: 0;  color: #0a53be; background-color: transparent; border-color: transparent; cursor: pointer">
            <i class="fas fa-question-circle"></i> Ayuda
        </button>
        <script>
            document.getElementById('helpButton').addEventListener('click', () => {
                Swal.fire({
                    title: 'Mesa de Ayuda',
                    html: `
        <select id="helpdesk-type" class="swal2-select">
          <option value="general">Consulta General</option>
          <option value="account">Problemas de Cuenta</option>
          <option value="payment">Pagos y Facturación</option>
          <option value="technical">Asistencia Técnica</option>
        </select>
        <textarea id="message" class="swal2-textarea" placeholder="Escribe aquí tu mensaje..."></textarea>
      `,
                    confirmButtonText: 'Enviar',
                    focusConfirm: false,
                    preConfirm: () => {
                        const helpdeskType = Swal.getPopup().querySelector('#helpdesk-type').value;
                        const message = Swal.getPopup().querySelector('#message').value;
                        if (!message) {
                            Swal.showValidationMessage('Por favor, escribe tu mensaje');
                        }
                        return {helpdeskType, message};
                    },
                }).then((result) => {
                    if (result.isConfirmed) {
                        const {helpdeskType, message} = result.value;
                        Swal.fire(`
          Tipo de Consulta: ${helpdeskType}
          Mensaje: ${message}
        `.trim());
                    }
                });
            });
        </script>
    </div>
</section>