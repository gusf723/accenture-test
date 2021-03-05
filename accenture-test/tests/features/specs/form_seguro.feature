#language: pt

@formulario_seguro
Funcionalidade: Formulario - Validar formulario seguro veicular
  Como usuário do sistema
  Quero preencher os formularios a respeito do seguro veicular
  Para enviar um email com os dados a respeito do seguro

  @validar_formulario_seguro_veiculo
  Cenário: Validar formulario seguro veicular
    Dado Acessar a homepage do site
    Quando preencher no formulário a aba Enter Vehicle Data
    E preencher no formulário a aba Enter Insurant Data
    E preencher no formulário a aba Enter Product Data
    E selecionar um preço no Price Option
    E preencher no formulário a aba Send Quote
    Então validar a mensagem de envio de e-mail com sucesso
