require 'spec_helper'

describe 'Home page' do
  it 'should have the cow' do
    visit '/'

    page.should have_content('rawr')
  end
end
