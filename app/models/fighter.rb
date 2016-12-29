class Fighter < ActiveRecord::Base
    validates :name, presence: true
    
    def getRating
        winArr = self.wins.split(",")
        lossArr = self.losses.split(",")
        numberWins = winArr.length
        numberLosses = lossArr.length
        
        winCount = 0
        winArr.each do |w|
            if(fighterWin = Fighter.find_by name: w)
                winCount += baseCase(fighterWin)
            else
               numberWins -= 1 
            end
        end
        
        if(numberWins == 0)
            winScore = 0
        else
            winScore = winCount / numberWins
        end
        
        lossCount = 0
        lossArr.each do |l|
            if(fighterLoss = Fighter.find_by name: l)
                lossCount += baseCase(fighterLoss)
            else
                numberLosses -= 1
            end
        end
        
        if(numberLosses == 0)
            lossScore = 0
        else
            lossScore = lossCount / numberLosses
        end
        
        winScore + lossScore - numberLosses
    end
    
    def baseCase(f)
        winArr = f.wins.split(",")
        lossArr = f.losses.split(",")
        numberWins = winArr.length
        numberLosses = lossArr.length
        
        winCount = 0
        winArr.each do |w|
            if(fighterWinRatio = Fighter.find_by name: w)
                winCount += ratio(fighterWinRatio)
            else
                numberWins -= 1 
            end
        end
        
        if(numberWins == 0)
            winScore = 0
        else
            winScore = winCount / numberWins
        end
        
        lossCount = 0
        lossArr.each do |l|
            if(fighterLossRatio = Fighter.find_by name: l)
                lossCount += ratio(fighterLossRatio)
            else
                numberLosses -= 1 
            end
        end
        
        if(numberLosses == 0)
            lossScore = 0
        else
            lossScore = lossCount / numberLosses
        end
        
        winScore + lossScore - numberLosses
    end
    
    def ratio(f)
        winArr = f.wins.split(",")
        lossArr = f.losses.split(",")
        
        if(winArr.length + lossArr.length == 0)
            1/2
        else
            winArr.length / (winArr.length + lossArr.length)
        end
    end
    
end