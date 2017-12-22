class TutorialsController < ApplicationController

    before_action :set_tutorial, only: [ :show, :edit, :destroy, :update ]

    def index
        @tutorials = Tutorial.paginate(page: params[:page], per_page: 5)
    end

    def show
    end

    def new
        @tutorial = Tutorial.new
    end

    def create
        @tutorial = Tutorial.new(tutorial_params)
        if @tutorial.save
            redirect_to @tutorial, success: "Tutorial successfully created"
        else
            flash.now[:danger] = "Tutorial doesn't created"
            render :new
        end
    end

    def edit
    end

    def update
        if @tutorial.update_attributes(tutorial_params)
            redirect_to @tutorial, success: 'Tutorial successfully updated'
        else
            flash.now[:danger] = "Tutorial doesn't updated"
            render :edit
        end
    end

    def destroy
        @tutorial.destroy
        redirect_to tutorials_path, success: "Tutorial success deleted"
    end

    private

    def tutorial_params
        params.require(:tutorial).permit(:title, :description, :body, :image, :all_tags, :category_id)
    end

    def set_tutorial
        @tutorial = Tutorial.find(params[:id])
    end
end