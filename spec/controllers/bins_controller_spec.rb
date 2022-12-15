require 'rails_helper'

RSpec.describe BinsController, type: :controller do
  context "GET trash" do
    it "returns a successful response " do
      # binding.pry
      get :trash
      expect(response).to be_successful
    end
    it "assigns @trash" do        
      get :trash
      expect(assigns(:trash)).to eq(Bin.all)      
    end
    it "renders the trash template" do
      get :trash
      # binding.pry
      expect(response).to render_template("trash")
    end
    it "renders the trash status" do
      get :trash 
      expect(response.status).to eq(200)
    end
  end
    context "POST delete" do
      it 'checks that a note can be created in trash' do       
        
        post :delete, params: {note: {
          title: "title", 
          description: "description"
        }  }
          expect(assigns(:trash).save).to be_truthy
          expect(response).to  redirect_to trash_path
          
          expect(flash[:notice]).to eql("all notes deleted successfully")
      end
    end

      context "delete destroy" do
        it "checks whether notes are delete or not" do
          obj = Bin.create(title: "monday", description: "preview on monday")
          bin = Bin.destroy_all
          delete :destroy
          expect(bin).to be_truthy
          expect(response).to  redirect_to trash_path
        end
      end
end