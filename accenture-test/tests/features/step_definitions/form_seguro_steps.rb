Dado('Acessar a homepage do site') do
  form_seguro.load
  form_seguro.wait_ultin_logo_home_visible(wait:10)
  expect(logo_home).to have_logo_home
  expect(logo_home).to have_navigation_menu_home
end

Quando('preencher no formulário a aba Enter Vehicle Data') do
  form_seguro.dropdown_make.drop(1).sample.click
  form_seguro.dropdown_model.drop(1).sample.click
  form_seguro.inpt_cyl_capacity.set data_load(%w[vehicle_data cylinder])
  form_seguro.inpt_eng_performance.set data_load(%w[vehicle_data engine])
  form_seguro.inpt_manufac_date.set data_load(%w[vehicle_data manufacture_date])
  form_seguro.dropdown_seats_number.drop(1).sample.click
  form_seguro.dropdown_seats_number_motorcycle.drop(1).sample.click
  form_seguro.dropdown_fuel_type.drop(1).sample.click
  form_seguro.inpt_payload.set data_load(%w[vehicle_data payload])
  form_seguro.inpt_total_weight.set data_load(%w[vehicle_data weight])
  form_seguro.inpt_list_price.set data_load(%w[vehicle_data list_price])
  form_seguro.inpt_mileage.set data_load(%w[vehicle_data mileage])
  form_seguro.btn_next_insurant.click
  form_seguro.wait_until_inpt_first_name_visible(wait:5)
  expect(form_seguro).to have_inpt_first_name
  expect(form_seguro).to have_inpt_last_name
end

Quando('preencher no formulário a aba Enter Insurant Data') do
  form_seguro.inpt_first_name.set data_load(%w[insurant_data first_name])
  form_seguro.inpt_last_name.set data_load(%w[insurant_data last_name])
  form_seguro.inpt_birth_date.set data_load(%w[insurant_data birth_date])
  form_seguro.dropdown_country.drop(1).sample.click
  form_seguro.inpt_zip_code.set data_load(%w[insurant_data zip_code])
  form_seguro.dropdown_occupation.drop(1).sample.click
  form_seguro.checkbox_speeding.click
  form_seguro.btn_next_product.click
  form_seguro.wait_until_inpt_start_date_visible(wait:5)
  expect(form_seguro).to have_inpt_start_date
  expect(form_seguro).to have_dropdown_insurance
end

Quando('preencher no formulário a aba Enter Product Data') do
  form_seguro.inpt_zip_code.set data_load(%w[product_data start_date])
  form_seguro.dropdown_insurance.drop(1).sample.click
  form_seguro.dropdown_merit.drop(1).sample.click
  form_seguro.dropdown_damage.drop(1).sample.click
  form_seguro.checkbox_euro_protect.click
  form_seguro.dropdown_courtesy.drop(1).sample.click
  form_seguro.nextselectpriceoption.click
  form_seguro.wait_until_slct_price_visible(wait:10)
  expect(form_seguro).to have_slct_price
  expect(form_seguro).to have_price_table
end

Quando('selecionar um preço no Price Option') do
  form_seguro.slct_price.click
  form_seguro.btn_next_quote.click
  form_seguro.wait_until_inpt_email_visible(wait:5)
  expect(form_seguro).to have_inpt_email
  expect(form_seguro).to have_inpt_username
end

Quando('preencher no formulário a aba Send Quote') do
  form_seguro.inpt_email.set data_load(%w[send_quote email])
  form_seguro.inpt_username.set data_load(%w[send_quote username])
  form_seguro.inpt_pwd.set data_load(%w[send_quote password])
  form_seguro.inpt_confirm_pwd.set data_load(%w[send_quote password])
  form_seguro.btn_send_email.click
  form_seguro.wait_until_modal_success_send_visible(wait:20)
end

Então('validar a mensagem de envio de e-mail com sucesso') do
  expect(form_seguro).to have_modal_success_send
  expect(form_seguro.modal_success_send.text).to include(data_load(%w[send_quote msg_success_send]))
  expect(form_seguro).to have_btn_modal_success
end