def stock_picker(stockPrices)
  
  maxProfit = 0
  bestDays = []
  
  stockPrices[0..-2].each_with_index do |buyPrice, buyDay|
    
    # This one is a little tricky. This loop only iterates ahead of where the previous loop is
    # However, sellDay's value always starts at 0. That's why it is required to add (buyDay+1)
    stockPrices[(buyDay+1)..-1].each_with_index do |sellPrice, sellDay|
      profit = (sellPrice - buyPrice)
      
      if profit > maxProfit
        maxProfit = profit
        bestDays = [[buyDay, ((buyDay+1) + sellDay)]]
      elsif profit == maxProfit
        bestDays.push([buyDay, ((buyDay+1) + sellDay)])
      end
    
    end
  end

  return bestDays
end

#stock_picker([17,6,3,9,15,8,6,15,1,10,13])
stock_picker([17,8,8,13,9,8,10,8,13,8,10]) # return ALL POSSIBILITIES