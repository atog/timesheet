require File.dirname(__FILE__) + '/../test_helper'
require 'sheet_controller'

# Re-raise errors caught by the controller.
class SheetController; def rescue_action(e) raise e end; end

class SheetControllerTest < Test::Unit::TestCase
  def setup
    @controller = SheetController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
