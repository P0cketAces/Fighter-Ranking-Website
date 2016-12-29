class FightersController < ApplicationController
    
    def index
        @fighters = Fighter.all
    end
    
    def new
        @fighter = Fighter.new
    end
    
    def create
       @fighter = Fighter.new(fighter_params)
       
       if @fighter.save
           flash[:success] = "Fighter added"
           redirect_to new_fighter_path
       else
           flash[:danger] = "Didn't go through"
           redirect_to new_fighter_path
       end
    end
    
    def edit
        @fighter = Fighter.find( params[:id] )
    end
    
    def show
        @fighter = Fighter.find( params[:id] ) 
    end
    
    def update
        @fighter =Fighter.find( params[:id] )
    
        if @fighter.update_attributes(fighter_params)
            flash[:success] = "Fighter Updated!"
            redirect_to fighter_path( id: params[:id] )
        else
            render action: :edit
        end
    end
    
    def destroy
        Fighter.find( params[:id] ).destroy
        flash[:success] = "User deleted"
        redirect_to fighters_path
    end
    
    private
        def fighter_params
           params.require(:fighter).permit(:name, :wins, :losses) 
        end
end