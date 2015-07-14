require 'spec_helper'
require_relative '../../../../apps/web/views/profiles/show'

describe Web::Views::Profiles::Show do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/profiles/show.html.erb') }
  let(:view)      { Web::Views::Profiles::Show.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
