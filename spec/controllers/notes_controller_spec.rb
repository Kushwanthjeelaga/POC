require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  context "GET index" do
    it "returns a successful response " do
      # binding.pry
      get :index
      expect(response).to be_successful
    end

    it "assigns @notes" do        
      get :index
      expect(assigns(:notes)).to eq(Note.all)      
    end

    it "renders the index template" do
      get :index
      # binding.pry
      expect(response).to render_template("index")
    end

    it "renders the index status" do
      get :index
      expect(response.status).to eq(200)
    end
  end

    context 'GET new' do
      it 'assigns a new note to @note' do
        get :new
        expect(assigns(:note)).to be_a_new(Note)
      end  

      it "renders the new status" do
        get :new
        expect(response.status).to eq(200)
      end

      it "renders the new template" do
        get :new
        # binding.pry
        expect(response).to render_template("new")
      end
    end
    
      context "post create" do
        it 'checks that a note can be created' do
          post :create, params: {note: {
            title: "title", 
            description: "description"
          } } 
            expect(assigns(:note).save).to be_truthy
            expect(response).to  redirect_to notes_path
            expect(flash[:notice]).to eql("Successfully note is added to home.")
        end

        it "check if notes is not created" do
          post :create, params: {note: {
            title: nil,
            description: nil
          } }
          expect(response).to  redirect_to notes_path
        end
      end
        context "delete destroy" do
          it "move to trash" do
            obj = Note.create(title: "monday", description: "preview on monday")
            delete :destroy, params:{ id: obj.id }
            expect(assigns(:note).destroy).to be_truthy
            expect(response).to  redirect_to trash_path
            expect(flash[:notice]).to eql("Successfully note is added to bin.")
          end
        end
  
end

# it "deletes comment" do
#   comment = FactoryBot.create(:comment, movie: movie, user: user)

#   expect do
#     delete :destroy, params { id: comment.id, movie_id: movie.id }
#   end.to change(Comment, :count).by(-1)
  

# end

#       describe "GET pays#show" do
#           it "should render pays#show template" do
#             # binding.pry
#             pay =FactoryBot.create(:pay)
#             get :show, id: pay.id
#             expect(response.status).to eq(200)
#           end
#       end
#       describe 'GET show' do
#         it 'should show user' do 
#           pay = FactoryBot.create(:pay)
#           get :show, params: { id: pay.id }
#           expect(response).to render_template show
#         end
#       end

#       describe 'GET #show' do

#       it "assigns the requested contact to @user" do
#         binding.pry
#         pay = Pay.create
#         get :show, id: pay.id
#         expect(assigns(:pay)).to eq pay
#       end


#       it "renders the :show template" do
#         binding.pry
#         pay = Pay.create
#         get :show, id: pay.id
#         expect(response).to render_template :show
#       end
#   end 
# end