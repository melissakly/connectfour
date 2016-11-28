class UserController < ApplicationController

	def create
		name = params[:name]
		new_user = User.new(name: name)
		new_user.save!
		new_badge = Badge.new(user: new_user)
		new_badge.save!
		
		redirect_to '/'
	end

	def view
		@curr_user ||= User.find(session[:user_id]) if session[:user_id]
		@games = Game.where(user_1: @curr_user).or(Game.where(user_2: @curr_user))

		fb_token = @curr_user.oauth_token
		graph = Koala::Facebook::API.new(fb_token)
		@friends = graph.get_connections("me", "friends")
	end

	def badges
		@curr_user ||= User.find(session[:user_id]) if session[:user_id]
		@curr_badge = Badge.where(user: @curr_user).first
		@no_badge = false
		@three_win = false
		@five_win = false
		@three_loss = false
		if @curr_badge.nil?
			@no_badge = true
		else
			if @curr_badge.wstreak >= 3
				@three_win = true
			end
			if @curr_badge.wstreak >= 5
				@five_win = true
			end
			if @curr_badge.lstreak >= 3
				@three_loss = true
			end
		end
	end

	def profile
		@curr_user ||= User.find(session[:user_id]) if session[:user_id]
		@curr_badge = Badge.where(user: @curr_user).first
		if @curr_badge.nil?
			@wins = 0
			@losses = 0
			@ratio = 0
			@total = 0
		else
			@wins = @curr_badge.wins
			@losses = @curr_badge.losses
			@ratio = @wins.to_f / (@wins + @losses)
			@total = @wins + @losses
		end

   		@image = "http://graph.facebook.com/#{@curr_user.uid}/picture?type=large"

	end

end
