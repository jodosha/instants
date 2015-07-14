require 'spec_helper'
require_relative '../../../../apps/web/controllers/profiles/show'

describe Web::Controllers::Profiles::Show do
  let(:action) { Web::Controllers::Profiles::Show.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
