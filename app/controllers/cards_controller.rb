class CardsController < ApplicationController
	before_action :set_card, only: [:show, :update, :destroy]
	before_action :set_card_title, only: [:validate]
	skip_before_action :verify_authenticity_token

	# GET /cards
	# GET /cards.json
	def index
		@cards = Card.all
	end


	# GET /cards/1
	# GET /cards/1.json
	def show
	end


	# GET /cards/new
	def new
		@card = Card.new
	end


	# POST /cards
	# POST /cards.json
	def create
		@card = Card.new(card_params)

		respond_to do |format|
			if title_exists
				format.json { render json: { status: 'error', message: "Title '#{params[:title]}' already exists." }, status: :unprocessable_entity }
			elsif !validate_params
				format.json { render json: { status: 'error', message: "Invalid parameters." }, status: :unprocessable_entity }
			elsif @card.save
				format.json { render :show, status: :created, location: @card }
			else
				format.json { render json: { status: 'error', message: "Invalid parameters." }, status: :unprocessable_entity }
			end
		end
	end


	# PATCH/PUT /cards/1
	# PATCH/PUT /cards/1.json
	def update
		respond_to do |format|
			if title_exists
				format.json { render json: { status: 'error', message: "Title '#{params[:title]}' already exists." }, status: :unprocessable_entity }
			elsif !validate_params
				format.json { render json: { status: 'error', message: "Invalid parameters." }, status: :unprocessable_entity }
			elsif @card.update(card_params)
				format.json { render :show, status: :ok, location: @card }
			else
				format.json { render json: @card.errors, status: :unprocessable_entity }
			end
		end
	end


	# DELETE /cards/1
	# DELETE /cards/1.json
	def destroy
		@card.destroy
	end


	# GET /cards/validate/1
	def validate
		respond_to do |format|
			format.json { render json: { valid: !title_exists || validate_params} }
		end
	end


	private


	# Use callbacks to share common setup or constraints between actions.
	def set_card
		@card = Card.find(params[:id])
	end


	def title_exists
		card = set_card_title
		if card
			return true
		end
		false
	end


	def validate_params
		if params[:title].length > 255 || !(params[:category_id] =~ /[0-9]{1,3}/) || params[:category_id].to_i < 0 || params[:category_id].to_i > 100
			return false
		end
		true
	end


	def set_card_title
		Card.find_by(title: params[:title])
	end


	# Never trust parameters from the scary internet, only allow the white list through.
	def card_params
		params.require(:card).permit(:title, :body, :category_id)
	end


end
