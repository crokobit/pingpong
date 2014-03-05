class HomeController < ApplicationController
  expose(:pongs){ Pong.accepted }
end
