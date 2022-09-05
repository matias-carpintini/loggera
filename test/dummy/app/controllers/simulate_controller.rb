class SimulateController < ApplicationController
  def failure
    raise "Simulating an exception"
  end
end
