require "pry"
def consolidate_cart(cart)
  hash_cart = Hash.new
  cart.each do |item|
    #binding.pry
    hash_cart[item.keys[0]] = item.values[0]
    if hash_cart[item.keys[0]][:count] != nil
      hash_cart[item.keys[0]][:count] += 1
    else
      hash_cart[item.keys[0]][:count] = 1
    end
  end
  hash_cart
end

def apply_coupons(cart, coupons)
  coupons.each do |item|
    if cart[item[:item]] != nil
      disc_num = cart[item[:item]][:count]/item[:num]
      if disc_num != 0
        binding.pry
        cart[item[:item]][:count] -= disc_num*item[:num]
        
        cart[item[:item]+" W/COUPON"] = {:price => item[:cost],:clearance => cart[item[:item]][:clearance],:count => disc_num*item[:num]}
      end
      cart.delete(item[:item]) if cart[item[:item]][:count] == 0
    end
    cart
  end
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
