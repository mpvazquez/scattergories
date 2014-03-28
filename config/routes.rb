Scattergories::Application.routes.draw do
  root "rounds#new"

  get "rounds/category", to: "rounds#category"

  get "rounds/letter", to: "rounds#get_letter"

  get "rounds/:id/auto_reject", to: "rounds#auto_reject"

  get "rounds/finalize", to: "rounds#finalize_answers"

  resources :rounds, only: [:show, :create]


  # # PJ: Below is a suggeseted direction for your routes, to make them fit a more 
  # # RESTful convention. For more, see: http://guides.rubyonrails.org/routing.html
  # root "games#new"
  
  # resources :users # people should be allowed to log in, right? :)
  # resource  :session, only: [:new, :create, :destroy] # singular resource

  # resources :games, only: [:new, :create, :show], shallow: true do # a shallow resource...

  #   # round#create should generate a category and a letter then redirect to #show
  #   # the letter can stay hidden, but since both of those need to be shared across
  #   # all users, that logic should be on the server
  #   resources :rounds, only: [:create, :index, :show] do

  #     # here we can call the route players (in the context of a game), 
  #     # but have a correspondence btwn players and users on your server
  #     # and have the users controller handle based on if player is 
  #     # authenticated (ie, logged in)
  #     resources :players, except: [:new, :create], to: "users" do
  #       member do # ie, a route for each player...

  #         # the players submit their cards at the end of the round; the server waits
  #         # for all submits to come in and then responds to each with all of the cards
  #         post "submit" 

  #         # the players submit their scores at the end of the scoring period; the server waits
  #         # for all to come in, and then tallies the rejections, etc. and returns the final
  #         # scores for all
  #         post "score"
  #       end
  #     end
  #   end
  # end

end
