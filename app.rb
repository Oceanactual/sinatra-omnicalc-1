require "sinatra"
require "sinatra/reloader"
require "active_support/all"

get("/") do
  erb(:hello)
end

get("/square/new") do 
  erb(:new_square_calc)
  
end

get("/square/results") do
  @user_num = params.fetch("users_number").to_f
  @user_result = @user_num**2
  erb(:new_square_result)
end

get("/square_root/new") do 
  erb(:new_square_root_calc)
  
end

get("/square_root/results") do
  @user_num = params.fetch("users_number").to_f
  @user_result = @user_num**0.5
  erb(:new_square_root_result)
end

get("/random/new") do 
  erb(:random_new)
  
end

get("/random/results") do
  @user_min= params.fetch("users_min").to_f
  @user_max= params.fetch("users_max").to_f
  @random = rand(@user_min..@user_max)
  erb(:random_results)
end

get("/payment/new") do

  erb(:payment_new)
end

get("/payment/results") do
   user_apr = params.fetch("users_apr").to_f
   user_principle = params.fetch("users_principle").to_f
   user_period = params.fetch("users_number_of_years").to_i
   user_months = user_period * 12
   user_apr_yearly = user_apr / 100
   user_apr_monthly = user_apr_yearly / 12
   equation_top = user_principle * user_apr_monthly
   bottom_parenth = 1 + user_apr_monthly
   exp_n = user_months * -1
   bottom_exp = bottom_parenth**exp_n
   final_bottom = 1 - bottom_exp
   users_payment = equation_top / final_bottom
   @apr = user_apr.to_fs(:percentage)
   @payment = users_payment.to_fs(:currency)
   @principal = user_principle.to_fs(:currency)
   @years = user_period
   pp user_months
   pp user_apr_monthly
   pp equation_top
   pp bottom_parenth
   pp exp_n
   pp final_bottom
   pp users_payment
  erb(:payment_results)
end
