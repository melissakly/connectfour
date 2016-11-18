OmniAuth.config.logger = Rails.logger
 
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '2153812311510890', '9e99dc41a2bdd09782127f32ffcf933e', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end