class Fighter < ActiveRecord::Base
    validates :name, presence: true
    
    def getRating
        winArr = self.wins.split(",")
        lossArr = self.losses.split(",")
        
        winCount = 0
        winArr.each do |w|
            fighterWin = Fighter.find_by name: w
            winCount += baseCase(fighterWin)
        end
        
        if(winArr.length == 0)
            winScore = 1
        else
            winScore = winCount / winArr.length
        end
        
        lossCount = 0
        lossArr.each do |l|
            fighterLoss = Fighter.find_by name: l
            lossCount += baseCase(fighterLoss)
        end
        
        if(lossArr.length == 0)
            lossScore = 0
        else
            lossScore = lossCount / lossArr.length
        end
        
        winScore + lossScore - lossArr.length
    end
    
    def baseCase(f)
        winArr = f.wins.split(",")
        lossArr = f.losses.split(",")
        
        winCount = 0
        winArr.each do |w|
            fighterWinRatio = Fighter.find_by name: w
            winCount += ratio(fighterWinRatio)
        end
        
        if(winArr.length == 0)
            winScore = 1
        else
            winScore = winCount / winArr.length
        end
        
        lossCount = 0
        lossArr.each do |l|
            fighterLossRatio = Fighter.find_by name: l
            lossCount += ratio(fighterLossRatio)
        end
        
        if(lossArr.length == 0)
            lossScore = 0
        else
            lossScore = lossCount / lossArr.length
        end
        
        winScore + lossScore - lossArr.length
    end
    
    def ratio(f)
        winArr = f.wins.split(",")
        lossArr = f.losses.split(",")
        
        winArr.length / (winArr.length + lossArr.length)
    end
end