class SheetController < ApplicationController
  
  def index
    @arr, @title_date = get_month_array(validate(1,12,params[:month]),params[:year])
  end
  
  def validate(min, max, value)
    if value != nil
      value = 1 if value.to_i < min
      value = 12 if value.to_i > max
    end
    value
  end
    
  def get_month_array(m=nil,y=nil)
  	format = "%d/%m/%Y"	
  	dt = DateTime.now
  	y = dt.year if y.nil?
  	m = dt.month if m.nil?
  	t = DateTime.new(y.to_i, m.to_i, 1)
  	a = DateTime.new(t.year, t.month, 1)

  	# go to Monday
  	until a.wday == 1 do
  		a-=1
  	end
  	# build the week array
  	arr = Array.new
    until a.mon > t.mon || (a.mon == 1 && t.mon == 12) do
  		arra = Array.new
  		arra << "#{a.strftime(format)} - #{(a+6).strftime(format)}"
  		7.times do |i|
  			arra << (((a+(i)).mon) == t.mon) ? 1 : 0
  		end
  		arr << arra
  		a+=7
  	end
  	return arr, t
  end
    
end
