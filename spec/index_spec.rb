# TDD tests
require_relative "../index.rb"

describe menu_select do
    it 'should return an integer value after selection' do
        menu_output = 1
        expect(menu_output).to be_instance_of(Integer)
    end

end

describe Play do
    before do
        Play.new(username)
    end
    it 'should initialize with user name input' do
        expect(username.name).to eq username
    end
end