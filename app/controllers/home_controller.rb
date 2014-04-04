class HomeController < ApplicationController
  expose(:pongs){ Pong.accepted.decorate }
end
