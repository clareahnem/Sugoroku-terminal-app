# TDD tests
require_relative("../index")

describe menu_select do
    it 'should return an integer value after selection' do
        menu_output = 1
        expect(menu_output).to be_instance_of(Integer)
    end

end