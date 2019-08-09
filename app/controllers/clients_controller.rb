class ClientsController < ApplicationController
    before_action :require_login
    
    def index
        @clients = Client.all
    end

    def new
        @client = Client.new
    end

    def create
        @client = Client.create(client_params)
        if @client.errors.any?
            render :new
        else
            redirect_to client_path(@client)
        end
    end

    def edit
        @client = Client.find(params[:id])
    end

    def update
        @client = Client.find(params[:id])
        @client.update(client_params)
        if @client.errors.any?
            render :edit
        else
            redirect_to client_path(@client)
        end
    end

    def show
        @client = Client.find(params[:id])
    end

    def unassigned
        @clients = Client.unassigned
    end

    private

    def client_params
        params.require(:client).permit(:first_name, :last_name, :caseload_id)
    end

end
