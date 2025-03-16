def stock_picker(stock_prices)
    
    maxProfit = 0
    bestDays = Array.new

    stock_prices[0..-2].each_with_index do |buy, indexBuy|

        # this is a little tricky. This second loop only iterates ahead of where the previous loop is
        # however, indexSell's value always starts at 0. That's why it is required to add it to (indexBuy+1)
        stock_prices[(indexBuy+1)..-1].each_with_index do |sell, indexSell|
            
            if (sell - buy) > maxProfit
                maxProfit = (sell - buy)
                bestDays = [[indexBuy, ((indexBuy+1) + indexSell)]]
                p bestDays
            elsif (sell - buy) == maxProfit
                bestDays.push([indexBuy, ((indexBuy+1) + indexSell)])
                p bestDays
            end

        end
    end
    return bestDays
end

stock_picker([17,6,3,9,15,8,6,15,1,10,13])